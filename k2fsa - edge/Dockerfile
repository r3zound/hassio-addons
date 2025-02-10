ARG BUILD_FROM
FROM ${BUILD_FROM}

COPY rootfs /
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

RUN \
    sed -i 's@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    sed -i 's@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    apt update && apt install -y --no-install-recommends wget bzip2 && \
    wget -q -c -4 --tries=10 https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.10.43/sherpa-onnx-v1.10.43-linux-x64-static.tar.bz2 && \
    tar -xvf sherpa-onnx-v1.10.43-linux-x64-static.tar.bz2 -C /k2fsa/ && \
    mkdir -p /k2fsa/bin && \
    mv /k2fsa/sherpa-onnx-v1.10.43-linux-x64-static/bin/* /k2fsa/bin && \
    chmod +x /k2fsa/bin/* && \
    rm -rf /k2fsa/sherpa-onnx-v1.10.43-linux-x64-static* && \
    mkdir -p /k2fsa/module && \
    wget -q -c -4 --tries=10 https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 && \
    tar -xvf icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 -C /tmp && \
    rm -rf icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 && \
    mv /tmp/icefall-asr-zipformer-wenetspeech-20230615/data/lang_char/tokens.txt /k2fsa/module && \
    rm -rf /tmp/icefall-asr-zipformer-wenetspeech-20230615/exp/*int* && \
    mv /tmp/icefall-asr-zipformer-wenetspeech-20230615/exp/* /k2fsa/module && \
    apt remove -y wget bzip2 --purge && apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

