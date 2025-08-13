# `flyoverhead.docker.grafana`

`Grafana` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `grafana_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `grafana_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `grafana_plugins` | Plugins to be installed | Definition example in [defaults.yml](defaults/main.yml) |
| `grafana_dashboards` | Dashboards to be installed | Definition example in [defaults.yml](defaults/main.yml) |
| `grafana_source` | Metrics source | Definition example in [defaults.yml](defaults/main.yml) |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.node-exporter` | [README.md](../node-exporter/README.md) |
| `flyoverhead.docker.prometheus` | [README.md](../prometheus/README.md) |
| `flyoverhead.docker.alertmanager` | [README.md](../alertmanager/README.md) |

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.node-exporter
      - role: flyoverhead.docker.prometheus
      - role: flyoverhead.docker.alertmanager
      - role: flyoverhead.docker.grafana
```

## Dashboards list example:

```yaml
grafana_dashboards:
  - dashboard_id: 1860
    revision_id: 31
    name: node_exporter
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
