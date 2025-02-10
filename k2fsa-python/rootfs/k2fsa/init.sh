#!/bin/bash

# 启动 Sherpa-ONNX WebSocket 服务器
python3 /k2fsa/streaming_server.py \
    --port=6005 \
    --num_threads=5 \
    --tokens /k2fsa/module/tokens.txt \
    --encoder /k2fsa/module/encoder-epoch-12-avg-4.onnx \
    --decoder /k2fsa/module/decoder-epoch-12-avg-4.onnx \
    --joiner /k2fsa/module/joiner-epoch-12-avg-4.onnx \
    --max-batch-size=5 \
    --debug
