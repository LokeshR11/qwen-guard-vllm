FROM openeuler/vllm-cpu:latest
WORKDIR /app

# Bypass SAP security/tmp restrictions
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

# Copy and prepare startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 8000

# ENTRYPOINT instead of CMD — KServe cannot override this
ENTRYPOINT ["/app/start.sh"]
