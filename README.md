# 🛠 Infrastructure Automation & Monitoring Project

This project builds a secure, observable, and automated infrastructure using two Ubuntu-based servers: a **Main Server** and a **Backup Server**. It integrates LDAP for centralized authentication, Ansible for configuration management, Monit for system monitoring, Syslog-ng for log aggregation, Redmine for issue tracking, and OwnCloud for backup access — all secured over SSH.

---

## 🌐 System Overview

[LDAP Users]

↓

[Main Server]

Ansible

Monit

Rsync to Backup Server

Syslog client

Triggers Redmine via API

[Backup Server]

Monit

Syslog-ng server

OwnCloud (Docker)

Redmine (Docker)

---

## ⚙️ Components & Structure

| Folder       | Purpose                                         |
|--------------|--------------------------------------------------|
| `ansible/`   | Automation scripts and playbooks                 |
| `ldap/`      | LDIF files and user structure                    |
| `monit/`     | Monit configuration files and Redmine alerts     |
| `docker/`    | Docker Compose setups for OwnCloud & Redmine     |

---

## 🔐 Authentication

- **LDAP-based authentication** for all users
- Only `emre` has `sudo` privileges on both servers
- SSH key-based access for automation and backups

---

## 🔁 Automation & Monitoring

- **Ansible** provisions users, installs packages, and configures services
- **Monit** watches over system health (disk, SSH, Apache)
- **Syslog-ng** forwards logs from Main → Backup Server
- **Rsync + Cron** performs daily backups from Main Server

---

## 📥 Backup & File Access

- Backups and logs are uploaded to **OwnCloud**
- Ansible playbooks also archived
- Access at: `http://<backup-server>:8080` (admin/admin)

---

## 📝 Redmine Integration

- Alerts from Monit trigger issues in **Redmine** via REST API
- Issues are labeled with:
  - `Server`
  - `Event Type`
  - `Auto Created` (true/false)
- Access at: `http://<backup-server>:3000` (admin/newpassword123)

---

## 🚀 Deployment Notes

- All components are deployed and configured via **Ansible**
- Docker used for OwnCloud and Redmine
- LDAP users and groups defined with `.ldif` files and added via playbooks

---

## ✅ Project Outcomes

- 🔄 DevOps-style automation across two servers
- 🔒 Secure, centralized access with role-based control
- 📡 Real-time monitoring + alert tracking
- ☁️ Self-hosted, browser-accessible storage and issue dashboard

---

📁 **Explore the folders** to view individual configurations and deployment logic.
