ARG BUILD_FROM
FROM ${BUILD_FROM}

COPY rootfs /
RUN chmod +x /k2fsa/*.sh

WORKDIR /k2fsa

# 使用 USTC 镜像加速 apt，安装必要工具，执行后立即清理
RUN sed -i 's@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    sed -i 's@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g' /etc/apt/sources.list && \
    apt update && \
    apt install -y --no-install-recommends wget bzip2 && \
    wget -q -O sherpa-onnx.tar.bz2 https://ghfast.top/github.com/k2-fsa/sherpa-onnx/releases/download/v1.10.43/sherpa-onnx-v1.10.43-linux-x64-static.tar.bz2 --no-check-certificate && \
    tar -xjf sherpa-onnx.tar.bz2 --strip-components=1 -C /k2fsa/ && \
    chmod +x /k2fsa/bin/* && \
    rm -f /k2fsa/include && \
    rm -f /k2fsa/lib && \
    rm -f /k2fsa/bin/*online* && \
    rm -f /k2fsa/bin/*vad* && \
    rm -f /k2fsa/bin/*tts* && \
    rm -f /k2fsa/bin/*microphone* && \
    rm -f /k2fsa/bin/*keyword* && \
    rm -f /k2fsa/bin/*alsa* && \
    rm -f sherpa-onnx.tar.bz2 && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

CMD [ "/k2fsa/init.sh" ]
