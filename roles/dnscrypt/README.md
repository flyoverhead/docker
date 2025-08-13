# `flyoverhead.docker.dnscrypt`

`DNSCrypt Proxy` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `dnscrypt_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `dnscrypt_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.dnscrypt
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
