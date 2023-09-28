# `flyoverhead.docker.postgres`

`PostgreSQL` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `postgres_name` | PostgreSQL service name (used for container's and folder's names) | `postgres` |
| `postgres_image` | PostgreSQL docker image name | `postgres` |
| `postgres_tag` | PostgreSQL docker image version tag | `15.4-alpine` |
| `postgres_port` | PostgreSQL service listening port | `5432` |
| `postgres_username` | PostgreSQL default (root) user | `postgres` |
| `postgres_password` | PostgreSQL default (root) user password | `postgres` |
| `postgres_database` | PostgreSQL default database owned by default (root) user | `postgres` |
| `postgres_initial_databases` | List of databases to be created at first start of the container (owner with username and password equal to database name will be created) | `["drone", "gitea", "nextcloud"]` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.postgres
```

## License

PostgreSQL

## Author Information

fLy0v3rH34d
