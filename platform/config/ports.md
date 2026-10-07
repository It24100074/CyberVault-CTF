# CyberVault CTF Ports

| Service | Port | Access |
|---|---:|---|
| Nginx | 80 | Host / Player |
| CTFd | 8000 | Host / Player |
| MariaDB | 3306 | Internal Docker network |
| Redis | 6379 | Internal Docker network |

The exact port mappings are verified using:

docker compose ps