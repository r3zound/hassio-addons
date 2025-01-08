# 使用指定的基础镜像
FROM docker.m.daocloud.io/library/ubuntu:latest

# 架构相关变量
ARG BUILD_ARCH
ENV BUILD_ARCH=$BUILD_ARCH

# 定义下载链接的映射
ENV JDXB_amd64=owjdxb_x86 
ENV JDXB_aarch64=owjdxb_a64 
ENV JDXB_armhf=owjdxb_a32 
ENV JDXB_armv7=owjdxb_a32 
ENV JDXB_i386=owjdxb_x86

# 提取对应架构的下载链接并安装
# 根据架构选择正确的文件并拷贝
RUN case $BUILD_ARCH in \
    amd64) cp /$JDXB_amd64 /owjdxb ;; \
    aarch64) cp /$JDXB_aarch64 /owjdxb ;; \
    armhf) cp /$JDXB_armhf /owjdxb ;; \
    armv7) cp /$JDXB_armv7 /owjdxb ;; \
    i386) cp /$JDXB_i386 /owjdxb ;; \
    *) echo "Unsupported architecture $BUILD_ARCH" && exit 1 ;; \
    esac

RUN chmod +x "/owjdxb/bin/owjdxb"
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]