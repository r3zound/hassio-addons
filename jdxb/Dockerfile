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

# 复制并设置运行脚本
COPY ${JDXB_${BUILD_ARCH}} /owjdxb
RUN chmod +x "/owjdxb/bin/owjdxb"
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]


