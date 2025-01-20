# 定义可用的构建参数
ARG BUILD_ARCH
ARG DOWNLOAD_URL

# 设置基础镜像
FROM docker.m.daocloud.io/library/alpine:3.21

# 添加环境变量
ENV BUILD_ARCH=$BUILD_ARCH

# 安装基础工具
RUN apk add --no-cache wget jq

# 下载对应架构的文件
RUN wget -O /ac "$DOWNLOAD_URL" && chmod +x /ac

# 拷贝启动脚本
COPY run.sh /run.sh
RUN chmod +x /run.sh

# 指定容器启动命令
CMD ["/run.sh"]
