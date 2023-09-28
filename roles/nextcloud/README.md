# `flyoverhead.docker.nextcloud`

`Nextcloud` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_group` | Docker users group name | `docker` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `nextcloud_name` | Nextcloud service name (used for container's and folder's names) | `nextcloud` |
| `nextcloud_image` | Nextcloud docker image name | `nextcloud` |
| `nextcloud_tag` | Nextcloud docker image version tag | `25.0.9-apache` |
| `nextcloud_web_port` | Nextcloud service HTTP port | `8050` |
| `nextcloud_trusted_domains` | List of Nextcloud trusted domains | `["192.168.1.1"]` |
| `nextcloud_admin_username` | Nextcloud admin user name | `nextcloud` |
| `nextcloud_admin_password` | Nextcloud admin user password | `nextcloud` |
| `nextcloud_db_type` | Internal/external database type (can be `sqlite (int)`, `mysql (ext)` or `pgsql (ext)`) | `pgsql` |
| `nextcloud_db_address` | External database address (FQDN/IP with port) | `192.168.1.1:5432` |
| `nextcloud_db_name` | Database name | `nextcloud` |
| `nextcloud_db_user` | Database owner username | `nextcloud` |
| `nextcloud_db_password` | Database owner password | `nextcloud` |

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
      - role: flyoverhead.docker.nextcloud
```

## License

AGPL-3.0-or-later

## Author Information

fLy0v3rH34d
