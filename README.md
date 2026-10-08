# CyberVault CTF

CyberVault CTF is a six-stage penetration testing Play Box created for the IE3132 Penetration Testing module.

The project uses CTFd as the main challenge and flag validation platform, Docker for platform services and web challenges, and a separate Ubuntu virtual machine for the final Linux privilege escalation stage.

## Challenge Stages

1. OSINT
2. Steganography
3. Web / SQL Injection
4. Cryptography
5. Digital Forensics
6. Linux Privilege Escalation

## Requirements

- Windows 10/11
- WSL 2
- Ubuntu
- Docker Desktop
- Docker Compose
- VirtualBox
- Ubuntu Server VM for Stage 6
- Git

## Setup

Open WSL / Ubuntu:

```bash
cd ~/CTFd
```

Make sure Docker Desktop is running.

## Start the Platform

```bash
./scripts/member1/start_ctf.sh
```

Or:

```bash
docker compose up -d
```

## Access the Platform

Open:

```text
http://localhost
```

or:

```text
http://localhost:8000
```

## Health Check

```bash
./scripts/member1/health_check.sh
```

## Stop the Platform

```bash
./scripts/member1/stop_ctf.sh
```

## Reset / Recovery

```bash
./scripts/member1/reset_ctf.sh
```

After reset:

```bash
./scripts/member1/health_check.sh
```

## Network and Services

| Service | Port | Purpose |
|---|---:|---|
| Nginx | 80 | Reverse proxy / player access |
| CTFd | 8000 | Main CTF platform |
| MariaDB | 3306 | Internal database |
| Redis | 6379 | Internal cache |

Docker networks used:

- `ctfd_default`
- `ctfd_internal`
- `web-challenge_ctf`

## Member 1 Contribution

Member 1 is responsible for:

- CTF platform deployment
- Docker and network architecture
- Network isolation
- Ports and services documentation
- Reset / recovery mechanism
- Platform health checking
- Resource monitoring
- Platform automation scripts

## Member 1 Scripts

```text
scripts/member1/start_ctf.sh
scripts/member1/stop_ctf.sh
scripts/member1/reset_ctf.sh
scripts/member1/health_check.sh
```

## Member 1 Documentation

```text
docs/member1/architecture.md
docs/member1/deployment.md
docs/member1/flag-validation.md
docs/member1/resource-usage.md
```

## Member 1 Evidence

```text
evidence/member1/health-check.txt
evidence/member1/health-check-after-reset.txt
evidence/member1/reset-test.txt
```

## Project Structure

```text
CyberVault-CTF/
├── README.md
├── docker-compose.yml
├── CTFd/
├── challenges/
├── docs/
│   └── member1/
├── evidence/
│   └── member1/
├── platform/
│   ├── config/
│   └── network/
├── scripts/
│   └── member1/
└── vm/
```

## Useful Commands

Start:

```bash
./scripts/member1/start_ctf.sh
```

Stop:

```bash
./scripts/member1/stop_ctf.sh
```

Reset:

```bash
./scripts/member1/reset_ctf.sh
```

Health check:

```bash
./scripts/member1/health_check.sh
```

Check containers:

```bash
docker compose ps
```

Check networks:

```bash
docker network ls
```

Check resource usage:

```bash
docker stats --no-stream
```

## Security Notice

CyberVault CTF contains intentionally vulnerable components created for educational penetration testing activities.

The environment must only be used in a controlled and authorized lab environment.

## Upstream CTFd

CyberVault CTF is built using the open-source CTFd framework.

Official repository:

```text
https://github.com/CTFd/CTFd
```

Official documentation:

```text
https://docs.ctfd.io/
```

## IE3132 Penetration Testing

**Project:** CyberVault CTF  
**Module:** IE3132 - Penetration Testing  
**Project Type:** CTF Play Box Implementation  
**Platform:** CTFd + Docker + Ubuntu VM