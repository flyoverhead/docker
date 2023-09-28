# `flyoverhead.docker.gitea`

`Gitea` docker service deployment.

## Requirements

For Gitea service SSH access all required public keys should be placed in `files` directory, e.g., `files/id_rsa.pub`.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_group` | Docker users group name | `docker` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `gitea_name` | Gitea service name (used for container's and folder's names) | `gitea` |
| `gitea_image` | Gitea docker image name | `gitea/gitea` |
| `gitea_tag` | Gitea docker image version tag | `1.20.3` |
| `gitea_web_port` | Gitea service HTTP port | `8080` |
| `gitea_ssh_port` | Gitea service SSH port | `2222` |
| `gitea_domain` | IP address/domain name displayed in clone URL address | `192.168.1.1` |
| `gitea_git_uid` | The UID of the user `git` that will be created on host (to provide gitea ssh access) | `false` |
| `gitea_git_gid` | The GID of the user `git` that will be created on host (to provide gitea ssh access) | `true` |
| `gitea_admin_username` | Gitea admin user name | `gitea` |
| `gitea_admin_password` | Gitea admin user password | `gitea` |
| `gitea_admin_email` | Gitea admin user email | `email@example.com` |
| `gitea_db_type` | External database type | `postgres` |
| `gitea_db_address` | External database address (FQDN/IP with port) | `192.168.1.1:5432` |
| `gitea_db_name` | External database name | `gitea` |
| `gitea_db_user` | External database owner username | `gitea` |
| `gitea_db_password` | External database owner password | `gitea` |
| `gitea_web_theme` | Gitea default web theme | `arc-green` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.postgres` | [README.md](../postgres/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.postgres
      - role: flyoverhead.docker.gitea
```

## License

MIT

## Author Information

fLy0v3rH34d
