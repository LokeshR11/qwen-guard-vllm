FROM vllm/vllm-openai:latest

WORKDIR /app

CMD ["python","-m","vllm.entrypoints.openai.api_server","--model","Qwen/Qwen3-Guard-8B","--port","8000","--trust-remote-code"]

# rebuild-v2
