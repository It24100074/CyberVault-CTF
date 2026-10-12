#!/bin/bash

echo "[+] Resetting CyberVault CTF..."
docker compose down
docker compose up -d
docker compose ps