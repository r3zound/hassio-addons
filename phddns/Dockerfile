# 使用指定的基础镜像
FROM docker.m.daocloud.io/library/ubuntu:latest

# 架构相关变量
ARG BUILD_ARCH
ENV BUILD_ARCH=$BUILD_ARCH

# 定义下载链接的映射
ENV DOWNLOAD_URLS="amd64=https://dl.oray.com/hsk/linux/phddns_5.3.0_amd64.deb \
                    aarch64=https://dl.oray.com/hsk/linux/phddns_5.1.0_rapi_aarch64.deb \
                    armhf=https://dl.oray.com/hsk/linux/phddns_5.1.0_rapi_armhf.deb \
                    armv7=https://dl.oray.com/hsk/linux/phddns_5.1.0_rapi_armhf.deb \
                    i386=https://dl.oray.com/hsk/linux/phddns_5.3.0_i386.deb"

# 提取对应架构的下载链接并安装
RUN apt-get update && apt-get install -y wget \
    && DOWNLOAD_URL=$(echo $DOWNLOAD_URLS | tr " " "\n" | grep "^$BUILD_ARCH=" | cut -d '=' -f 2) \
    && if [ -z "$DOWNLOAD_URL" ]; then echo "Unsupported platform: $BUILD_ARCH" && exit 1; fi \
    && wget -q "$DOWNLOAD_URL" -O phddns.deb \
    && dpkg -i phddns.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm phddns.deb

# 复制并设置运行脚本
COPY run.sh /run.sh
RUN chmod +x /run.sh

# 设置入口点
ENTRYPOINT ["/bin/sh", "/run.sh"]

