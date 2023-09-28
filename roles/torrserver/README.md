# `flyoverhead.docker.torrserver`

`Torrserver` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `torrserver_name` | Torrserver service name (used for container's and folder's names) | `torrserver` |
| `torrserver_image` | Torrserver docker image name | `ksey/torrserver` |
| `torrserver_tag` | Torrserver docker image version tag | `latest` |
| `torrserver_port` | Torrserver service HTTP port | `8070` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.torrserver
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
