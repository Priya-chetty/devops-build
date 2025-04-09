#!/bin/bash
echo "Deploying application..."
docker-compose down
docker-compose up -d --build
echo "Application deployed on port 80."
