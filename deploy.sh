#!/bin/bash

echo "🧹 Stopping old containers..."
docker-compose down

echo "🚀 Deploying new container on port 8080..."
docker-compose up -d

if [ $? -eq 0 ]; then
  echo "✅ Deployment successful. App should be live on port 8080."
else
  echo "❌ Deployment failed."
  exit 1
fi

