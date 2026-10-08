# CyberVault CTF Resource Usage

## Overview

Resource monitoring is part of the CyberVault CTF platform administration process.

The purpose is to verify that the CTF platform and challenge containers are running correctly without consuming excessive CPU or memory.

Member 1 is responsible for monitoring the resource usage of the CTF platform.

---

## Resource Monitoring Command

Docker resource usage can be checked using:

```bash
docker stats --no-stream
```

This command displays:

- CPU usage
- Memory usage
- Memory percentage
- Network I/O
- Block I/O
- Process count

---

## Member 1 Health Check Script

The CyberVault project includes a Member 1 health-check script:

```bash
./scripts/member1/health_check.sh
```

The script checks:

1. Docker Engine status
2. Running containers
3. Docker networks
4. Container resource usage

---

## Current Platform Containers

The main CyberVault CTF platform uses the following Docker containers:

| Container | Service | Purpose |
|---|---|---|
| ctfd-nginx-1 | Nginx | Reverse proxy and player web access |
| ctfd-ctfd-1 | CTFd | Main CTF challenge platform |
| ctfd-db-1 | MariaDB | CTFd database |
| ctfd-cache-1 | Redis | CTFd cache |

Additional challenge containers may also run depending on the active challenge environment.

For example:

```text
web-challenge-web-1
web-challenge-db-1
```

---

## Example Resource Usage

A successful health-check test showed the main CTFd containers running with low CPU and memory usage.

Example observations:

| Container | Approximate Memory Usage |
|---|---:|
| Nginx | ~7 MiB |
| CTFd | ~145 MiB |
| MariaDB | ~87 MiB |
| Redis | ~4 MiB |
| Web Challenge | ~18 MiB |
| Web Challenge Database | ~99 MiB |

The exact values may change while the CTF is running.

---

## CPU Usage

During testing, the containers used very low CPU when the platform was idle.

CPU usage increases temporarily when:

- Players access challenges
- Flags are submitted
- Database queries are processed
- Containers are restarted
- Challenge services are actively used

CPU usage can be checked using:

```bash
docker stats --no-stream
```

---

## Memory Usage

Memory usage is monitored to ensure that the platform remains stable.

The CTFd application normally uses more memory than services such as Nginx and Redis.

MariaDB also requires additional memory for database operations.

The exact memory usage depends on:

- Number of running containers
- Number of connected players
- Number of active challenges
- Database activity
- Challenge workload

---

## Network Usage

The Docker statistics output also displays network I/O.

Network traffic is generated when:

- Players open the CTF platform
- Challenge files are downloaded
- Flags are submitted
- CTFd communicates with the database and cache
- Web challenge containers receive requests

---

## Resource Verification

The following commands can be used during testing:

### Check Containers

```bash
docker compose ps
```

### Check Resource Usage

```bash
docker stats --no-stream
```

### Check Docker Networks

```bash
docker network ls
```

### Full Health Check

```bash
./scripts/member1/health_check.sh
```

---

## Reset and Resource Recovery

The CyberVault CTF platform can be restarted using:

```bash
./scripts/member1/reset_ctf.sh
```

After the reset, resource usage can be verified using:

```bash
./scripts/member1/health_check.sh
```

This confirms that the containers have restarted and returned to a healthy state.

---

## Evidence

Resource monitoring evidence is stored under:

```text
evidence/member1/
```

Current evidence includes:

```text
health-check.txt
health-check-after-reset.txt
reset-test.txt
```

These files provide evidence that:

- Docker was running
- CTFd services were active
- Docker networks were available
- Resource usage was monitored
- The reset mechanism was tested

---

## Resource Considerations

The platform should have enough resources to run:

- CTFd
- Nginx
- MariaDB
- Redis
- Challenge containers
- Stage 6 Ubuntu VM

The host system should have sufficient CPU, RAM, and storage to support both Docker and the virtual machine at the same time.

---

## Demonstration

During the Assignment 02 video walkthrough, Member 1 can demonstrate resource usage by running:

```bash
./scripts/member1/health_check.sh
```

or:

```bash
docker stats --no-stream
```

The demonstration should show that the CyberVault CTF services are running correctly and using reasonable system resources.

---

## Conclusion

The CyberVault CTF resource monitoring process confirms that the platform services are operational and stable.

The Member 1 health-check script provides a simple method to verify containers, networks, and resource usage before and after reset operations.