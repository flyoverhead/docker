# `flyoverhead.docker.node_exporter`

`Node exporter` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `node_exporter_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `node_exporter_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `node_exporter_command` | Service start options | Definition example in [defaults.yml](defaults/main.yml) |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.node-exporter
```

## Example Node exporter starting options

```yaml
node_exporter_command:
  - --path.procfs=/host/proc
  - --path.rootfs=/rootfs
  - --path.sysfs=/host/sys
  - --collector.filesystem.mount-points-exclude=^/(dev|proc|sys|var/lib/docker/.+)($|/)
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
