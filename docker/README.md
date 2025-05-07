# Docker Services

This folder contains Docker Compose configurations used to deploy containerized services within the infrastructure.

## 📦 Services

### 1. OwnCloud

- Accessible at: `http://192.168.19.129:8080`
- Docker Compose file: `owncloud-compose.yml`
- Credentials: `admin / admin`
- Used for:
  - Storing compressed backups (`html.tar.gz`)
  - Uploading logs from Monit (`monit_YYYY-MM-DD.log`)
  - Archiving Ansible playbooks

### 2. Redmine

- Accessible at: `http://192.168.19.129:3000`
- Docker Compose file: `redmine-compose.yml`
- Used for:
  - Tracking Monit/Ansible-triggered issues via REST API
  - Manually logging infrastructure tasks

### 3. MySQL (via Compose)

- MySQL used for both OwnCloud and Redmine services
- Database credentials managed in `.env` file or inline in `docker-compose.yml`

## 🚀 How to Start Containers

```bash
cd docker
docker-compose -f owncloud-compose.yml up -d
docker-compose -f redmine-compose.yml up -d
