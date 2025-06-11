#!/bin/bash

echo "Starting Ollama server..."
ollama serve &
SERVE_PID=$!

echo "Waiting for Ollama server to be ready..."
while ! ollama list &>/dev/null; do
    echo "Waiting for Ollama to start..."
    sleep 1
done

echo "Pulling required models..."
ollama pull nomic-embed-text || echo "Failed to pull nomic-embed-text"
ollama pull llama3.2-vision || echo "Failed to pull llama3.2-vision"
ollama pull qwen2.5vl || echo "Failed to pull qwen2.5vl"

# Wait for the serve process
wait $SERVE_PID
