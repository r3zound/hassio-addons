ARG BUILD_FROM
FROM ${BUILD_FROM}

COPY rootfs /
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

RUN \
    sed -i 's@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    sed -i 's@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends wget bzip2 && \
    wget -q -c -4 --tries=10 https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.10.43/sherpa-onnx-v1.10.43-linux-x64-static.tar.bz2 && \
    tar -xvf sherpa-onnx-v1.10.43-linux-x64-static.tar.bz2 -C /k2fsa/ && \
    mkdir -p /k2fsa/bin && \
    mv /k2fsa/sherpa-onnx-v1.10.43-linux-x64-static/bin/*offline* /k2fsa/bin && \
    chmod +x /k2fsa/bin/* && \
    #chown -R root:root /k2fsa && \
    rm -rf /k2fsa/sherpa-onnx-v1.10.43-linux-x64-static && \
    wget -q -c -4 --tries=10 -O /module/encoder-epoch-12-avg-4.onnx \
        https://huggingface.co/pkufool/icefall-asr-zipformer-streaming-wenetspeech-20230615/resolve/4519d431eebb33363c267e827fb9f65dcb200009/exp/encoder-epoch-12-avg-4.onnx && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

CMD ["/k2fsa/init.sh"]