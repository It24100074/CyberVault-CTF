# CyberVault CTF Architecture

## Overview
CyberVault CTF uses CTFd as the main challenge and flag validation platform.

## Main Components
- Player browser
- Nginx reverse proxy
- CTFd application
- MariaDB database
- Redis cache
- Docker networks
- Separate web challenge containers
- Stage 6 Ubuntu virtual machine

## Current Services
- Nginx: Port 80
- CTFd: Port 8000
- MariaDB: Port 3306 (internal)
- Redis: Port 6379 (internal)

## Network Design
The main CTFd environment uses Docker bridge networks.

Detected networks include:
- ctfd_default
- ctfd_internal
- web-challenge_ctf

The internal services are separated from public access where possible.

## Isolation
Intentionally vulnerable challenge services are deployed in Docker containers and isolated networks.

Stage 6 uses a separate Ubuntu virtual machine.

## Validation
CTFd handles challenge flag submission and validation.

## Recovery
The platform can be restarted using the Member 1 reset script:

./scripts/member1/reset_ctf.sh

After reset, platform health is verified using:

./scripts/member1/health_check.sh