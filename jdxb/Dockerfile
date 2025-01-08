# 使用指定的基础镜像
FROM docker.m.daocloud.io/library/ubuntu:latest

# 架构相关变量
ARG BUILD_ARCH
ENV BUILD_ARCH=$BUILD_ARCH

# 定义下载链接的映射
COPY owjdxb_x86 owjdxb_x86
COPY owjdxb_a32 owjdxb_a32
COPY owjdxb_a64 owjdxb_a64

# 提取对应架构的下载链接并安装
# 根据架构选择正确的文件并拷贝
RUN case $BUILD_ARCH in \
    amd64) mv /owjdxb_x86 /owjdxb ;; \
    aarch64) mv /owjdxb_a64 /owjdxb ;; \
    armhf) mv /owjdxb_a32 /owjdxb ;; \
    armv7) mv /owjdxb_a32 /owjdxb ;; \
    i386) mv /owjdxb_x86 /owjdxb ;; \
    *) echo "Unsupported architecture $BUILD_ARCH" && exit 1 ;; \
    esac && \
    rm -rf /owjdxb_* && \
    chmod +x "/owjdxb/bin/owjdxb"

# 复制并设置run.sh脚本
COPY run.sh /run.sh
RUN chmod +x /run.sh

# 设置入口点
ENTRYPOINT ["/bin/sh", "/run.sh"]