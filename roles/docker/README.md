# `flyoverhead.docker.docker`

`Docker` service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `docker_path` | Root path for services files on host machine | `/opt/docker` |
| `docker_timezone` | Default timezone for docker services | `Europe/Moscow` |
| `docker_group` | Docker system group name | `docker` |
| `docker_repo_key` | Docker repository gpg key URL | `https://download.docker.com/linux/debian/gpg` |
| `docker_repo_url` | Docker repository URL | `https://download.docker.com/linux/debian bookworm stable` |
| `docker_packages` | List of docker packages to be installed | `['docker-ce', 'docker-ce-cli', 'containerd.io', 'docker-buildx-plugin', 'docker-compose-plugin']` |
| `docker_required_packages` | List of packages required for docker installation | `['apt-transport-https', 'ca-certificates', 'gnupg']` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `docker_users` | List of users to be added to docker group | `ansible_user` |

## Dependencies

None

## Example playbook

```yaml
- hosts: host
  roles:
    - role: flyoverhead.docker.docker
```

## License

Docker

## Author Information

fLy0v3rH34d
