# CyberVault CTF Architecture

## Overview

CyberVault CTF uses CTFd as the main challenge and flag validation platform.

The platform combines Docker-based services with a separate Ubuntu virtual machine for the final Linux privilege escalation challenge.

---

## Main Components

- Player browser
- Nginx reverse proxy
- CTFd application
- MariaDB database
- Redis cache
- Docker networks
- Separate web challenge containers
- Stage 6 Ubuntu virtual machine

---

## Current Services

| Service | Port | Purpose |
|---|---:|---|
| Nginx | 80 | Reverse proxy and player web access |
| CTFd | 8000 | Main challenge and flag validation platform |
| MariaDB | 3306 | Internal database |
| Redis | 6379 | Internal cache |

---

## Network Design

The main CTFd environment uses Docker bridge networks.

Detected networks include:

- `ctfd_default`
- `ctfd_internal`
- `web-challenge_ctf`

These networks help separate the main platform services from challenge-specific services.

Internal backend services are separated from direct player access where possible.

---

## Communication Flow

The main communication flow is:

```text
Player Browser
      |
      v
Nginx - Port 80
      |
      v
CTFd - Port 8000
      |
      +------> MariaDB - Port 3306
      |
      +------> Redis - Port 6379
      |
      +------> Challenge Containers
```

---

## CTFd Platform

CTFd is the main CyberVault challenge platform.

CTFd is responsible for:

- Challenge delivery
- Challenge descriptions
- Flag submission
- Flag validation
- Score tracking
- Challenge progression
- Player access

The CTFd service is available through:

```text
http://localhost:8000
```

Nginx also provides player access through:

```text
http://localhost
```

---

## Nginx Reverse Proxy

Nginx acts as the reverse proxy for the CyberVault CTF platform.

It listens on:

```text
Port 80
```

Nginx forwards player web requests to the CTFd application.

The running container is:

```text
ctfd-nginx-1
```

---

## MariaDB

MariaDB is used as the main CTFd database.

The database container is:

```text
ctfd-db-1
```

MariaDB uses:

```text
Port 3306
```

This service is intended for internal platform communication and is not meant to be directly accessed by players.

---

## Redis

Redis is used by CTFd as a caching service.

The Redis container is:

```text
ctfd-cache-1
```

Redis uses:

```text
Port 6379
```

This service is also intended for internal platform communication.

---

## Challenge Containers

Web-based vulnerable challenges run in separate Docker containers.

Examples include:

```text
web-challenge-web-1
web-challenge-db-1
```

These challenge containers are separated using Docker networking.

---

## Isolation

CyberVault contains intentionally vulnerable challenge services.

For safety, vulnerable components are deployed in controlled environments.

The isolation design includes:

- Docker containers for platform services
- Docker bridge networks
- Separate challenge networks
- Internal backend services
- A separate Ubuntu VM for Stage 6

Internal services such as MariaDB and Redis are not intended to be directly exposed to participants.

---

## Stage 6 Virtual Machine

Stage 6 is hosted separately in an Ubuntu virtual machine.

This virtual machine is used for the Linux privilege escalation challenge and remains separate from the main Docker-based CTFd environment.

VirtualBox is used to host the Stage 6 VM.

---

## Flag Validation

CTFd handles challenge flag submission and validation.

The validation process is:

```text
Player solves challenge
        |
        v
Player submits flag
        |
        v
CTFd validates flag
        |
   +----+----+
   |         |
Correct    Incorrect
   |         |
   v         v
Accepted   Rejected
```

Further documentation is available in:

```text
docs/member1/flag-validation.md
```

---

## Platform Deployment

The platform can be started using the Member 1 script:

```bash
./scripts/member1/start_ctf.sh
```

Alternatively:

```bash
docker compose up -d
```

The running services can be checked using:

```bash
docker compose ps
```

Further deployment documentation:

```text
docs/member1/deployment.md
```

---

## Recovery

The platform can be restarted using the Member 1 reset script:

```bash
./scripts/member1/reset_ctf.sh
```

The reset process stops and restarts the CTFd Docker environment.

After reset, platform health is verified using:

```bash
./scripts/member1/health_check.sh
```

---

## Health Monitoring

Platform health can be checked using:

```bash
./scripts/member1/health_check.sh
```

The health-check script verifies:

- Docker Engine status
- Running containers
- Docker networks
- Resource usage

---

## Resource Monitoring

Docker resource usage can be checked using:

```bash
docker stats --no-stream
```

This displays:

- CPU usage
- Memory usage
- Network I/O
- Block I/O
- Process count

Further documentation:

```text
docs/member1/resource-usage.md
```

---

## Main Ports

| Service | Port | Access |
|---|---:|---|
| Nginx | 80 | Player / Host |
| CTFd | 8000 | Player / Host |
| MariaDB | 3306 | Internal |
| Redis | 6379 | Internal |

---

## Member 1 Responsibilities

Member 1 is responsible for:

- CTF platform deployment
- Docker architecture
- Network design
- Network segmentation
- Ports and services
- Platform isolation
- Flag validation support
- Reset and recovery
- Health monitoring
- Resource monitoring
- Platform automation scripts
- Architecture documentation

---

## Member 1 Automation Scripts

The following scripts are provided:

```text
scripts/member1/start_ctf.sh
scripts/member1/stop_ctf.sh
scripts/member1/reset_ctf.sh
scripts/member1/health_check.sh
```

### start_ctf.sh

Starts the CyberVault CTF Docker environment.

### stop_ctf.sh

Stops the CyberVault CTF Docker environment.

### reset_ctf.sh

Restarts the CyberVault CTF Docker environment.

### health_check.sh

Checks:

- Docker status
- Containers
- Networks
- Resource usage

---

## Testing Evidence

Member 1 test evidence is stored under:

```text
evidence/member1/
```

Current evidence includes:

```text
health-check.txt
health-check-after-reset.txt
reset-test.txt
```

This evidence confirms that:

- Docker was running
- CTFd services were active
- Networks were available
- Resource usage was checked
- Reset and recovery were tested

---

## Related Documentation

```text
docs/member1/deployment.md
docs/member1/flag-validation.md
docs/member1/resource-usage.md

platform/config/environment.md
platform/config/ports.md
platform/config/services.md

platform/network/network-design.md
platform/network/isolation.md

scripts/member1/start_ctf.sh
scripts/member1/stop_ctf.sh
scripts/member1/reset_ctf.sh
scripts/member1/health_check.sh
```

---

## Conclusion

The CyberVault CTF architecture combines CTFd, Docker-based services, isolated challenge environments, and a separate Ubuntu virtual machine.

This architecture provides a structured environment for the six-stage CTF while supporting:

- Challenge delivery
- Flag validation
- Network separation
- Platform recovery
- Resource monitoring
- Controlled challenge isolation