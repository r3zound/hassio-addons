#/bin/bash

/k2fsa/bin/sherpa-onnx-offline-websocket-server \
        --port=6006 \
        --num-work-threads=5 \
        --tokens=module/tokens.txt \
        --encoder=module/encoder-epoch-12-avg-4.onnx \
        --decoder=module/decoder-epoch-12-avg-4.onnx \
        --joiner=module/joiner-epoch-12-avg-4.onnx \
        --max-batch-size=5 \
        --debug

