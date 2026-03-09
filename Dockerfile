FROM vllm/vllm-openai:latest
WORKDIR /app

RUN huggingface-cli download Qwen/Qwen3Guard-Gen-0.6B \
    --local-dir /app/models/Qwen3Guard-Gen-0.6B && \
    rm -rf /root/.cache/huggingface

CMD ["--model", "/app/models/Qwen3Guard-Gen-0.6B", \
     "--port", "8000", \
     "--trust-remote-code", \
     "--dtype", "half", \
     "--max-model-len", "4096"]
