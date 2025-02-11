ARG BUILD_FROM
FROM ${BUILD_FROM}

COPY rootfs / 
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

# 使用 USTC 镜像加速 apt，安装必要工具，执行后立即清理
RUN apt update && \
    apt install -y --no-install-recommends wget bzip2 python3 python3-pip python3-venv && \
    python3 -m venv /k2fsa/venv && \
    /k2fsa/venv/bin/pip install --upgrade pip && \
    /k2fsa/venv/bin/pip install numpy websockets wheel sherpa_onnx && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

CMD ["/k2fsa/init.sh"]
