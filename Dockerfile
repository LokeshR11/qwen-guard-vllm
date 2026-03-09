FROM vllm/vllm-openai:latest

WORKDIR /app

# Download model ONCE during build
RUN huggingface-cli download Qwen/Qwen3Guard-Gen-8B \
    --local-dir /app/models/Qwen3Guard-Gen-8B

CMD ["--model", "/app/models/Qwen3Guard-Gen-8B", \
     "--port", "8000", \
     "--trust-remote-code"]

# rebuild-v5
