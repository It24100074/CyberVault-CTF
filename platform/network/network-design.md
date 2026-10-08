# CyberVault CTF Network Design

## Overview

The CyberVault CTF platform uses Docker-based networking to separate the main CTF platform services from challenge environments.

## Main Components

- Player browser
- Nginx reverse proxy
- CTFd application
- MariaDB database
- Redis cache
- Web challenge containers
- Stage 6 Ubuntu virtual machine

## Docker Networks

The following Docker networks are used:

- `ctfd_default`
- `ctfd_internal`
- `web-challenge_ctf`

## Communication Flow

Player Browser  
↓  
Nginx - Port 80  
↓  
CTFd Application - Port 8000  
↓  
MariaDB / Redis internal services

Challenge environments use separate Docker networks.

## Ports

| Service | Port | Access |
|---|---:|---|
| Nginx | 80 | Player / Host |
| CTFd | 8000 | Player / Host |
| MariaDB | 3306 | Internal |
| Redis | 6379 | Internal |

## Isolation

Internal services are not intended to be directly exposed to players.

Vulnerable challenge services run in isolated Docker networks.

Stage 6 runs separately in an Ubuntu virtual machine.