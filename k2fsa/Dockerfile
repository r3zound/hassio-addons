ARG BUILD_FROM
FROM ${BUILD_FROM}

COPY rootfs /
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

# 使用 USTC 镜像加速 apt，安装必要工具，执行后立即清理
RUN sed -i 's@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    sed -i 's@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    apt update && \
    apt install -y --no-install-recommends wget bzip2 python3 python3-pip avahi-daemon && \
    pip install wyoming && \
    \
    # 下载并解压 sherpa-onnx，避免额外的 mv 操作
    wget -q -O sherpa-onnx.tar.bz2 https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.10.43/sherpa-onnx-v1.10.43-linux-x64-static.tar.bz2 && \
    tar -xjf sherpa-onnx.tar.bz2 --strip-components=1 -C /k2fsa/ && \
    chmod +x /k2fsa/bin/* && \
    rm -f sherpa-onnx.tar.bz2 && \
    \
    # 下载 ASR 模型，直接解压到目标目录，避免使用 /tmp 目录
    wget -q -O asr-model.tar.bz2 https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 && \
    mkdir -p /k2fsa/module && \
    tar -xjf asr-model.tar.bz2 -C /k2fsa/module --strip-components=3 icefall-asr-zipformer-wenetspeech-20230615/data/lang_char/tokens.txt && \
    tar -xjf asr-model.tar.bz2 -C /k2fsa/module --strip-components=2 --wildcards '*/exp/*' && \
    rm -f asr-model.tar.bz2 && \
    \
    # 清理不必要的软件包和缓存，减少镜像体积
    apt remove -y wget bzip2 --purge && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

CMD [ "/k2fsa/init.sh" ]
