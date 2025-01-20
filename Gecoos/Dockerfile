
ARG BUILD_ARCH
FROM docker.m.daocloud.io/library/alpine:3.21
ENV BUILD_ARCH=$BUILD_ARCH
RUN apk add --no-cache wget jq 

RUN case $BUILD_ARCH in \
    amd64) DOWNLOAD_URL="http://file.cnrouter.com/upload/gac/%E5%90%AB%E7%99%BB%E5%BD%95%E9%A1%B5%E9%9D%A2%E7%89%88%E6%9C%AC%EF%BC%88%E4%B8%BB%E8%A6%81%E7%94%A8%E4%BA%8E%E7%8B%AC%E7%AB%8B%E4%BD%BF%E7%94%A8%EF%BC%89/ac_linux_amd64_V2.2_202501031919"; \
    aarch64) DOWNLOAD_URL="http://file.cnrouter.com/upload/gac/%E5%90%AB%E7%99%BB%E5%BD%95%E9%A1%B5%E9%9D%A2%E7%89%88%E6%9C%AC%EF%BC%88%E4%B8%BB%E8%A6%81%E7%94%A8%E4%BA%8E%E7%8B%AC%E7%AB%8B%E4%BD%BF%E7%94%A8%EF%BC%89/ac_linux_arm64_V2.2_202501031919"; \
    armhf) DOWNLOAD_URL="http://file.cnrouter.com/upload/gac/%E5%90%AB%E7%99%BB%E5%BD%95%E9%A1%B5%E9%9D%A2%E7%89%88%E6%9C%AC%EF%BC%88%E4%B8%BB%E8%A6%81%E7%94%A8%E4%BA%8E%E7%8B%AC%E7%AB%8B%E4%BD%BF%E7%94%A8%EF%BC%89/ac_linux_arm_V2.2_202501031919"; \
    armv7) DOWNLOAD_URL="http://file.cnrouter.com/upload/gac/%E5%90%AB%E7%99%BB%E5%BD%95%E9%A1%B5%E9%9D%A2%E7%89%88%E6%9C%AC%EF%BC%88%E4%B8%BB%E8%A6%81%E7%94%A8%E4%BA%8E%E7%8B%AC%E7%AB%8B%E4%BD%BF%E7%94%A8%EF%BC%89/ac_linux_arm_V2.2_202501031919"; \
    i386) DOWNLOAD_URL="http://file.cnrouter.com/upload/gac/%E5%90%AB%E7%99%BB%E5%BD%95%E9%A1%B5%E9%9D%A2%E7%89%88%E6%9C%AC%EF%BC%88%E4%B8%BB%E8%A6%81%E7%94%A8%E4%BA%8E%E7%8B%AC%E7%AB%8B%E4%BD%BF%E7%94%A8%EF%BC%89/ac_linux_386_V2.2_202501031919"; \
    *) echo "Unsupported architecture $BUILD_ARCH" && exit 1 ;; \
    esac && \
    wget -O /ac $DOWNLOAD_URL && \
    chmod +x /ac

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]