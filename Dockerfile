FROM vllm/vllm-openai:latest

WORKDIR /app

COPY start.sh .

CMD ["bash","start.sh"]
