# 使用指定的基础镜像
FROM docker.m.daocloud.io/library/alpine:3.21.3



RUN apk add --no-cache wget unzip
# 定义下载链接的映射
#COPY owjdxb_x86 owjdxb_x86
#COPY owjdxb_a32 owjdxb_a32
#COPY owjdxb_a64 owjdxb_a64

#RUN case $BUILD_ARCH in \
#    amd64) mv /owjdxb_x86 /owjdxb ;; \
#    aarch64) mv /owjdxb_a64 /owjdxb ;; \
#    armhf) mv /owjdxb_a32 /owjdxb ;; \
#    armv7) mv /owjdxb_a32 /owjdxb ;; \
#    i386) mv /owjdxb_x86 /owjdxb ;; \
#    *) echo "Unsupported architecture $BUILD_ARCH" && exit 1 ;; \
WORKDIR /tmp
RUN case $BUILD_ARCH in \
    amd64) wget -owjdxb.zip https://raw.githubusercontent.com/djhui/hassio-addons/refs/heads/main/jdxb%20-%20Edge/owjdxb_x86.zip ;; \
    aarch64) wget -owjdxb.zip https://raw.githubusercontent.com/djhui/hassio-addons/refs/heads/main/jdxb%20-%20Edge/owjdxb_a64.zip ;; \
    armhf) wget -owjdxb.zip https://raw.githubusercontent.com/djhui/hassio-addons/refs/heads/main/jdxb%20-%20Edge/owjdxb_a32.zip ;; \
    armv7) wget -owjdxb.zip https://raw.githubusercontent.com/djhui/hassio-addons/refs/heads/main/jdxb%20-%20Edge/owjdxb_a32.zip ;; \
    i386) wget -owjdxb.zip https://raw.githubusercontent.com/djhui/hassio-addons/refs/heads/main/jdxb%20-%20Edge/owjdxb_x86.zip ;; \
    *) echo "Unsupported architecture $BUILD_ARCH" && exit 1 ;; \
    esac && \
    unzip owjdxb.zip && \
    mv owjdxb /owjdxb \
    chmod +x "/owjdxb/bin/owjdxb"

# 复制并设置run.sh脚本
COPY run.sh /run.sh
RUN chmod +x /run.sh

# 设置入口点
ENTRYPOINT ["/bin/sh", "/run.sh"]