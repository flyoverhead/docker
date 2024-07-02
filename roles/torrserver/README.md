# `flyoverhead.docker.torrserver`

`Torrserver` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `torrserver_name` | Torrserver service name (used for container's and folder's names) | `torrserver` |
| `torrserver_image` | Torrserver docker image name | `ksey/torrserver` |
| `torrserver_tag` | Torrserver docker image version tag | `latest` |
| `torrserver_port` | Torrserver service HTTP port | `8070` |
| `torrserver_path` | Path to service files | `/opt/docker` |
| `torrserver_restart_policy` | Service container restart policy | `always` |
| `torrserver_network_mode` | Service container network mode | `host` |
| `torrserver_timezone` | Default timezone for docker service | `Europe/Moscow` |

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
