# `flyoverhead.docker.torrserver`

`Torrserver` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `torrserver_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `torrserver_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |

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
