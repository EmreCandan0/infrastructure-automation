# LDAP Configuration

This directory contains the LDAP configuration files used in the infrastructure automation project. The setup ensures centralized authentication and authorization across both Main and Backup servers.

## 📁 Contents

- `emrecandan.ldif`  
  Manual LDAP entry defining a user (`emre.candan`) with UID, GID, home directory, and group memberships.

- `people.ldif`  
  Hierarchical LDAP group structure defining organizational units and roles:
  - `People` (base group)
    - `Developer`
      - `emre`
    - `Management`
      - `ceren`

- `adduser.yml`  
  Ansible playbook to automate LDAP user creation using `.ldif` files. This playbook ensures idempotent provisioning of user entries.

## 🔐 Authentication Policy

- Only LDAP-authenticated users are allowed SSH access.
- Only the user `emre` has sudo privileges.
- Users in `Developer` and `Management` groups are restricted by role.

## 🧪 Testing Users

You can validate LDAP users on the Backup Server with:

```bash
getent passwd emre.candan
getent passwd ceren.cicek
