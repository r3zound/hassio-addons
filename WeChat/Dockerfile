ARG BUILD_FROM=alpine:3.20.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Environment variables


# Set shell
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# Install base system
ARG BASHIO_VERSION="v0.16.2"
#ARG S6_OVERLAY_VERSION="3.2.0.2"
ARG TEMPIO_VERSION="2021.09.0"
RUN \
    set -o pipefail \
    \
    && apk add --no-cache --virtual .build-dependencies \
        tar=1.35-r2 \
        xz=5.6.2-r0 \
    \
    && apk add --no-cache \
        libcrypto3=3.3.2-r1 \
        libssl3=3.3.2-r1 \
        musl-utils=1.2.5-r0 \
        musl=1.2.5-r0 \
    \
    && apk add --no-cache \
        bash=5.2.26-r0 \
        curl=8.11.0-r2 \
        jq=1.7.1-r0 \
        tzdata=2024b-r0 \
    \

    && curl -J -L -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf \
        /tmp/bashio.tar.gz \
        --strip 1 -C /tmp/bashio \
    \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    \
    && curl -L -s -o /usr/bin/tempio \
        "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}" \
    && chmod a+x /usr/bin/tempio \
    \
    && apk del --no-cache --purge .build-dependencies \
    && rm -f -r \
        /tmp/*

# Copy root filesystem
#COPY rootfs /

# Copy s6-overlay adjustments
#COPY s6-overlay /package/admin/s6-overlay-${S6_OVERLAY_VERSION}/

# 安装 Python3、pip 和必要的系统依赖
RUN apk add --no-cache python3 py3-pip python3-dev \
    && apk add --no-cache gcc libffi-dev musl-dev openssl-dev

# 创建并激活虚拟环境，然后安装 Python 包
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && /opt/venv/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir werobot zhipuai



# 设置 PATH 环境变量，让系统识别虚拟环境中的 Python 和 pip
ENV PATH="/opt/venv/bin:$PATH"


COPY docker-entrypoint.sh /docker-entrypoint.sh 
RUN chmod +x /docker-entrypoint.sh 

ENTRYPOINT [ "/docker-entrypoint.sh" ]


ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ARG BUILD_REPOSITORY