# 使用指定的基础镜像
FROM docker.m.daocloud.io/library/ubuntu:latest

# 架构相关变量
ARG BUILD_ARCH
ENV BUILD_ARCH=$BUILD_ARCH



RUN case $BUILD_ARCH in \
    amd64) COPY owjdxb_x86 /owjdxb ;; \
    aarch64) COPY owjdxb_a64 /owjdxb ;; \
    armhf) COPY owjdxb_a32 /owjdxb ;; \
    armv7) COPY owjdxb_a32  /owjdxb ;; \
    i386) COPY owjdxb_x86 /owjdxb ;; \
    *) echo "Unsupported architecture $BUILD_ARCH" && exit 1 ;; \
    esac

# 复制并设置运行脚本
COPY "JDXB_${BUILD_ARCH}" /owjdxb
RUN chmod +x "/owjdxb/bin/owjdxb"
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]


