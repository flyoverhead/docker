# `flyoverhead.docker.node_exporter`

`Node exporter` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `node_exporter_name` | Node exporter service name (used for container's and folder's names) | `node-exporter` |
| `node_exporter_image` | Node exporter docker image name | `prom/node-exporter` |
| `node_exporter_tag` | Node exporter docker image version tag | `v1.6.1` |
| `node_exporter_listening_port` | Node exporter HTTP listening port | `9100` |
| `node_exporter_command` | Node exporter service starting options | `Example below` |
| `node_exporter_path` | Path to service files | `/opt/docker` |
| `node_exporter_restart_policy` | Service container restart policy | `always` |
| `node_exporter_network_mode` | Service container network mode | `host` |
| `node_exporter_timezone` | Default timezone for docker service | `Europe/Moscow` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.node_exporter
```

## Example Node exporter starting options

```yaml
node_exporter_command:
  [
    "--path.procfs=/host/proc",
    "--path.rootfs=/rootfs",
    "--path.sysfs=/host/sys",
    "--collector.filesystem.mount-points-exclude=^/(dev|proc|sys|var/lib/docker/.+)($|/)",
  ]
```

## License

Apache-2.0

## Author Information

fLy0v3rH34d
