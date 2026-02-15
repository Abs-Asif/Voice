#!/bin/bash

# Default values
MODEL_ID="fishaudio/s1-mini"
LOCAL_DIR="checkpoints/s1-mini"
TOKEN=""

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --token) TOKEN="$2"; shift ;;
        --model) MODEL_ID="$2"; shift ;;
        --dir) LOCAL_DIR="$2"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

# Check if token is provided via env if not via arg
if [ -z "$TOKEN" ]; then
    TOKEN="$HF_TOKEN"
fi

echo "Downloading weights for $MODEL_ID to $LOCAL_DIR..."

if [ -n "$TOKEN" ]; then
    huggingface-cli download "$MODEL_ID" --local-dir "$LOCAL_DIR" --token "$TOKEN"
else
    echo "Warning: No token provided. If the model is gated, the download might fail."
    huggingface-cli download "$MODEL_ID" --local-dir "$LOCAL_DIR"
fi

if [ $? -eq 0 ]; then
    echo "Download successful."
else
    echo "Download failed. Please check your token and model ID."
    exit 1
fi
