FROM vllm/vllm-openai:latest   


ENV VLLM_CONFIG_ROOT=/tmp
ENV XDG_CACHE_HOME=/tmp
ENV HF_HOME=/tmp
ENV NUMBA_CACHE_DIR=/tmp
ENV TRANSFORMERS_CACHE=/tmp

# Download 0.6B model
RUN huggingface-cli download Qwen/Qwen3Guard-Gen-0.6B \
    --local-dir /app/models/Qwen3Guard-Gen-0.6B && \
    rm -rf /tmp/huggingface

# Permissions for SAP restricted user
RUN chmod -R 777 /app/models

CMD ["python", "-m", "vllm.entrypoints.openai.api_server", \
     "--model", "/app/models/Qwen3Guard-Gen-0.6B", \
     "--port", "8000", \
     "--host", "0.0.0.0", \
     "--trust-remote-code", \
     "--max-model-len", "2048", \
     "--dtype", "float32", \
     "--enforce-eager", \
     "--disable-log-requests"]
