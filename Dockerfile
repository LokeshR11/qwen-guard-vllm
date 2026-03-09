FROM vllm/vllm-openai:latest

WORKDIR /app

CMD ["serve","Qwen/Qwen3-Guard-8B","--port","8000","--trust-remote-code"]

# rebuild-v3
