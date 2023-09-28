# `flyoverhead.docker.grafana`

`Grafana` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `grafana_name` | Grafana service name (used for container's and folder's names) | `grafana` |
| `grafana_image` | Grafana docker image name | `grafana/grafana-oss` |
| `grafana_tag` | Grafana docker image version tag | `10.1.1` |
| `grafana_port` | Grafana HTTP web port | `8030` |
| `grafana_admin_username` | Grafana admin user name | `grafana` |
| `grafana_admin_password` | Grafana admin user password | `grafana` |
| `grafana_plugins` | List of Grafana plugins to be installed | `["grafana-clock-panel", "grafana-simple-json-datasource"]` |
| `grafana_dashboards` | List of Grafana dashboards to be installed | `Example below` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.node_exporter` | [README.md](../node_exporter/README.md) |
| `flyoverhead.docker.prometheus` | [README.md](../prometheus/README.md) |
| `flyoverhead.docker.alertmanager` | [README.md](../alertmanager/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.node_exporter
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

AGPL-3.0-only, Apache-2.0

## Author Information

fLy0v3rH34d
