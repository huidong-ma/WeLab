#!/bin/bash

source activate claw_env

# 从 config.json 读取 Ollama 相关配置
export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_NUM_CTX=$(python3 -c "import json; print(json.load(open('$SLURM_SUBMIT_DIR/config.json'))['ollama']['num_ctx'])")
export OLLAMA_MAX_LOADED_MODELS=$(python3 -c "import json; print(json.load(open('$SLURM_SUBMIT_DIR/config.json'))['ollama']['max_loaded_models'])")

ollama serve