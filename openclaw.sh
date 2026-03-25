#!/bin/bash

source activate claw_env

PROMPT_PATH=$(python3 -c "import json; print(json.load(open('$SLURM_SUBMIT_DIR/config.json'))['prompt'])")
export OPENCLAW_SYSTEM_PROMPT=$(cat "$PROMPT_PATH")

openclaw gateway --allow-unconfigured