#!/bin/sh

python3 -m sherpa-onnx-offline-websocket-server \
        --port=10300 \
        --num-work-threads=5 \
        --tokens=module/tokens.txt \
        --encoder=module/encoder-epoch-12-avg-4.onnx \
        --decoder=module/decoder-epoch-12-avg-4.onnx \
        --joiner=module/joiner-epoch-12-avg-4.onnx \
        --max-batch-size=5 \

