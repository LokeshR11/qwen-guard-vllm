FROM vllm/vllm-openai:latest
WORKDIR /app

RUN huggingface-cli download Qwen/Qwen3Guard-Gen-4B \
    --local-dir /app/models/Qwen3Guard-Gen-4B

CMD ["--model", "/app/models/Qwen3Guard-Gen-4B", \
     "--port", "8000", \
     "--trust-remote-code", \
     "--dtype", "half", \
     "--max-model-len", "4096"]
# rebuild-v7
