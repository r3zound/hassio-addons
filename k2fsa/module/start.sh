#/bin/bash

#https://k2-fsa.github.io/sherpa/onnx/websocket/offline-websocket.html#build-sherpa-onnx-with-websocket-support
# 检查环境变量USE_INT8是否存在
echo "Loading onnx, please wait 2 minutes..."
if [ -n "$USE_INT8" ]; then
    echo "use int8.onnx!"
    /k2fsa/bin/sherpa-onnx-offline-websocket-server \
        --port=6006 \
        --num-work-threads=5 \
        --tokens=/module/tokens.txt \
        --encoder=/module/encoder-epoch-12-avg-4.int8.onnx \
        --decoder=/module/decoder-epoch-12-avg-4.int8.onnx \
        --joiner=/module/joiner-epoch-12-avg-4.int8.onnx \
        --max-batch-size=5
else
    /k2fsa/bin/sherpa-onnx-offline-websocket-server \
        --port=6006 \
        --num-work-threads=5 \
        --tokens=/module/tokens.txt \
        --encoder=/module/encoder-epoch-12-avg-4.onnx \
        --decoder=/module/decoder-epoch-12-avg-4.onnx \
        --joiner=/module/joiner-epoch-12-avg-4.onnx \
        --max-batch-size=5
fi
