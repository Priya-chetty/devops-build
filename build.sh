#!/bin/bash
echo "Building Docker image..."
docker build -t devops-build-app:latest .
echo "Docker image built successfully."
