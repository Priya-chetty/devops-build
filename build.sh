#!/bin/bash

echo "🔨 Building Docker image from build/ directory..."
docker build -t my-devops-app ./build

if [ $? -eq 0 ]; then
  echo "✅ Image built successfully: my-devops-app"
else
  echo "❌ Failed to build image."
  exit 1
fi
echo "Building Docker image..."
docker build -t devops-build-app:latest .
echo "Docker image built successfully."
