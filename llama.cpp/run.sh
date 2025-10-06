#!/bin/bash

# Script to run different llama.cpp server configurations
# Usage: ./run.sh <model_number>
# Models: 1=qwen3-coder-30b, 2=qwen2.5-coder-14b, 3=qwen2.5-coder-3b, 4=deepseek-r1, 5=gemma-3-12b

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <model_number>"
    echo ""
    echo "Available models:"
    echo "1 - Qwen3-Coder-30B-A3B-Instruct (unsloth)"
    echo "2 - Qwen3-4B-Thinking-2507 (unsloth)"
    echo "3 - DeepSeek-R1-0528-Qwen3-8B (unsloth)"
    exit 1
fi

MODEL=$1

case $MODEL in
    1)
        echo "Starting Qwen3-Coder-30B-A3B-Instruct..."
        ./llama.cpp/build/bin/llama-server \
            -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q4_K_XL \
            --alias unsloth/qwen3-coder-30b-a3b \
            --host 0.0.0.0 \
            --port 10000 \
            --jinja \
            --n-gpu-layers 25 \
            --ctx-size 32768 \
            --temp 0.7 \
            --top-k 20 \
            --min-p 0.00 \
            --top-p 0.8 \
            --repeat-penalty 1.05 \
            --flash-attn on \
            --cache-type-k q4_0 \
            --cache-type-v q4_0 \
            --batch-size 2048 \
            --ubatch-size 512 \
            --threads 14 \
            --threads-batch 14 \
            --cont-batching \
            --split-mode none \
            --main-gpu 0 \
            --no-mmap
        ;;
    2)
        echo "Starting Qwen3-4B-Thinking-2507..."
        ./llama.cpp/build/bin/llama-server \
            -hf unsloth/Qwen3-4B-Thinking-2507-GGUF:UD-Q8_K_XL \
            --alias unsloth/qwen3-4b-thinking-2507 \
            --host 0.0.0.0 \
            --port 10000 \
            --jinja \
            --n-gpu-layers -1 \
            --ctx-size 32768 \
            --temp 0.6 \
            --top-k 20 \
            --min-p 0.00 \
            --top-p 0.95 \
            --presence-penalty 1.0 \
            --flash-attn on \
            --cache-type-k q8_0 \
            --cache-type-v q8_0 \
            --batch-size 2048 \
            --ubatch-size 512 \
            --threads 14 \
            --threads-batch 14 \
            --cont-batching \
            --split-mode none \
            --main-gpu 0 \
            --no-mmap
        ;;
    3)
        echo "Starting DeepSeek-R1-0528-Qwen3-8B..."
        ./llama.cpp/build/bin/llama-server \
            -hf unsloth/DeepSeek-R1-0528-Qwen3-8B-GGUF:UD-Q4_K_XL \
            --alias unsloth/deepseek-r1-0528-qwen3-8b \
            --host 0.0.0.0 \
            --port 10000 \
            --jinja \
            --n-gpu-layers -1 \
            --ctx-size 16384 \
            --flash-attn on \
            --cache-type-k f16 \
            --cache-type-v f16 \
            --batch-size 2048 \
            --ubatch-size 512 \
            --threads 14 \
            --threads-batch 14 \
            --cont-batching \
            --split-mode none \
            --main-gpu 0 \
            --no-mmap
        ;;
    *)
        echo "Invalid model number. Please choose 1-5."
        echo ""
        echo "Available models:"
        echo "1 - Qwen3-Coder-30B-A3B-Instruct (unsloth)"
        echo "2 - Qwen3-4B-Thinking-2507 (unsloth)"
        echo "3 - DeepSeek-R1-0528-Qwen3-8B (unsloth)"
        exit 1
        ;;
esac
