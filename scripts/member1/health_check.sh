#!/bin/bash

echo "=== CyberVault CTF Health Check ==="

docker info >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Docker: RUNNING"
else
    echo "Docker: NOT RUNNING"
fi

echo
echo "[Containers]"
docker compose ps

echo
echo "[Networks]"
docker network ls

echo
echo "[Resource Usage]"
docker stats --no-stream