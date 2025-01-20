# 定义可用的构建参数
ARG BUILD_ARCH
ARG DOWNLOAD_URL
# 设置基础镜像
FROM docker.m.daocloud.io/library/alpine:3.21

RUN apk add --no-cache wget jq

# 下载对应架构的文件
COPY build.json /build.json
RUN echo "DOWNLOAD_URL=$DOWNLOAD_URL" && \
    DOWNLOAD_URL=$(jq -r ".args.DOWNLOAD_URL[\"$BUILD_ARCH\"]" /build.json) && \
    echo "Resolved DOWNLOAD_URL=$DOWNLOAD_URL" && \
    wget -O /ac "$DOWNLOAD_URL" && \
    chmod +x /ac


# 拷贝启动脚本
COPY run.sh /run.sh
RUN chmod +x /run.sh

# 指定容器启动命令
CMD ["/run.sh"]
