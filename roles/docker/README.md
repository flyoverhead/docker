# `flyoverhead.docker.docker`

`Docker` service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `docker_group` | Docker system group name | `docker` |
| `docker_mirror` | Docker mirror URL address | `https://download.docker.com` |
| `docker_gpg_key` | Docker mirror gpg key path (Joined to `docker_mirror` value) | `/linux/debian/gpg` |
| `docker_gpg_check` | Enable docker gpg key check | `true` |
| `docker_apt_repo` | Docker APT repository (Joined to `docker_mirror` value) | `/linux/debian bullseye stable` |
| `docker_add_repo` | Add docker repository | `true` |
| `docker_packages` | List of docker packages to be installed | `["docker.io", "docker-compose", "docker-registry"]` |
| `docker_required_packages` | List of packages required for docker installation | `["apt-transport-https", "ca-certificates", "gnupg"]` |
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
