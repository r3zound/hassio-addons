ARG BUILD_FROM
FROM ${BUILD_FROM}

# 设置 S6 覆盖
COPY rootfs /

# 安装必要的包
RUN apk add --no-cache \
    jq

# 设置权限
RUN chmod a+x /etc/services.d/alist/run

# 使用 S6 覆盖作为入口点
ENTRYPOINT ["/init"]