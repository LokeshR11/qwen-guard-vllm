#!/bin/bash
exec python -m vllm.entrypoints.openai.api_server \
    --model /app/models/Qwen3Guard-Gen-0.6B \
    --port 8000 \
    --host 0.0.0.0 \
    --trust-remote-code \
    --max-model-len 2048 \
    --dtype float32 \
    --enforce-eager \
    --disable-log-requests
