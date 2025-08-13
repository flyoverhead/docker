# `flyoverhead.docker.docker`

`Docker` service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `docker_network_mode` | Docker containers network mode | `host` |
| `docker_path` | Root path for services files on host machine | `/opt/docker` |
| `docker_repo` | Docker repository configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_timezone` | Default timezone for docker services | `Europe/Moscow` |
| `docker_users` | List of users to be added to docker group | `['{{ ansible_user }}']` |

## Dependencies

None

## Example playbook

```yaml
- hosts: docker
  roles:
    - role: flyoverhead.docker.docker
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
