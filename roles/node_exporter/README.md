# `flyoverhead.docker.node_exporter`

`Node exporter` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `node_exporter_docker_config` | Docker configuration | Definition example in [defaults/main.yml](defaults/main.yml) |
| `node_exporter_service_config` | Service configuration | Definition example in [defaults/main.yml](defaults/main.yml) |
| `node_exporter_command` | Service start options | Definition example in [defaults/main.yml](defaults/main.yml) |

## Facts set by this role

| Fact | Description |
| :--- | :--- |
| `node_exporter_container_exists` | Whether the container is already present |
| `node_exporter_container_update` | Whether the running container's image differs from the configured tag |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: docker
  gather_facts: true
  roles:
    - role: flyoverhead.docker.docker
    - role: flyoverhead.docker.node_exporter
```

## Example Node exporter starting options

```yaml
node_exporter_command:
  - --path.procfs=/host/proc
  - --path.rootfs=/rootfs
  - --path.sysfs=/host/sys
  - --collector.filesystem.mount-points-exclude=^/(dev|proc|sys|var/lib/docker/.+)($$|/)
```

`$$` escapes a literal `$` for docker compose interpolation. A single `$` would
be consumed by compose before node_exporter ever sees the regex.

## Tags

| Tag | Purpose |
| :--- | :--- |
| `node_exporter.detect` | Container state detection only |
| `node_exporter.install` | First deployment |
| `node_exporter.update` | Image tag change: pull and recreate |

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
