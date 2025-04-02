# 使用 Playwright 的 Python 镜像作为基础镜像
FROM mcr.microsoft.com/playwright/python:v1.50.0-jammy

# 设置工作目录
WORKDIR /app

# 拷贝项目文件到容器内
COPY core/ .

# 安装项目依赖
RUN pip install -r requirements.txt

# 设置环境变量（这些环境变量也可以在运行容器时通过 -e 参数传递）
ENV PB_API_BASE=http://pocketbase:8090
ENV VL_MODEL=${VL_MODEL}
ENV PROJECT_DIR=/work_dir
ENV LLM_API_KEY=${LLM_API_KEY}
ENV LLM_API_BASE=${LLM_API_BASE}
ENV ZHIPU_API_KEY=${ZHIPU_API_KEY}
ENV PRIMARY_MODEL=${PRIMARY_MODEL}
ENV SECONDARY_MODEL=${SECONDARY_MODEL}
ENV LLM_CONCURRENT_NUMBER=${LLM_CONCURRENT_NUMBER:-1}
ENV VERBOSE=${VERBOSE:-""}


ENTRYPOINT ["/app/docker_entrypoint.sh"]
# 挂载卷
VOLUME ["/work_dir"]

# 启动命令
CMD ["sh", "run.sh"]



