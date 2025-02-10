
FROM docker.m.daocloud.io/library/python:3.13.2-alpine3.21

COPY rootfs /
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

RUN \
    apk add --no-cache build-base cmake onnxruntime protobuf libstdc++ gcompat && \
    pip install --upgrade pip setuptools wheel && \
    pip install cmake sherpa-onnx numpy websockets && \
    wget -q -c -4 --tries=10 https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 && \
    tar -xvf icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 -C /tmp && \
    rm -rf icefall-asr-zipformer-wenetspeech-20230615.tar.bz2 && \
    mv /tmp/icefall-asr-zipformer-wenetspeech-20230615/data/lang_char/tokens.txt /k2fsa/module && \
    rm -rf /tmp/icefall-asr-zipformer-wenetspeech-20230615/exp/*int8* && \
    mv /tmp/icefall-asr-zipformer-wenetspeech-20230615/exp/* /k2fsa/module 

    CMD [ "/k2fsa/init.sh" ]