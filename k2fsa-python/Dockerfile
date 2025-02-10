ARG BUILD_FROM
FROM ${BUILD_FROM}

COPY rootfs /
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

# 使用 USTC 镜像加速 apt，安装必要工具，执行后立即清理
RUN apt update && \
    apt install -y --no-install-recommends wget bzip2 python3 python3-pip && \
    pip install /k2fsa/sherpa_onnx-1.10.43-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl && \
    pip install numpy \
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
