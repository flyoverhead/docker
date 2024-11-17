# `flyoverhead.docker.pihole`

`PiHole` docker service deployment.

## Requirements

Blocklists, domains blacklists and whitelists can be added by filling in the corresponding files:

| File | Purpose |
| :--- | :--- |
| adlist.list | ADs list |
| domain_black.list | Domains blacklist |
| domain_white.list | Domains whitelist |

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `pihole_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `pihole_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `pihole_lists` | PiHole lists (populated from `*.list` files) | Examples in [files](files) folder |
| `pihole_required_packages` | PiHole configuration required packages | `['sqlite3']` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.pihole
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
