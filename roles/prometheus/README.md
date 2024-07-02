# `flyoverhead.docker.prometheus`

`Prometheus` docker service deployment.

## Requirements

Alerting rules can be added by placing rules files to `files` directory, e.g., `files/rules.yml`.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `prometheus_name` | Prometheus service name (used for container's and folder's names) | `prometheus` |
| `prometheus_image` | Prometheus docker image name | `prom/prometheus` |
| `prometheus_tag` | Prometheus docker image version tag | `v2.46.0` |
| `prometheus_listening_port` | Prometheus HTTP listening port | `9090` |
| `prometheus_command` | Prometheus service starting options | `["--config.file=/etc/prometheus/prometheus.yml"]` |
| `prometheus_global_config` | List of Prometheus global configuration parameters | `Example below` |
| `prometheus_scrape_jobs` | List of Prometheus scrape jobs configuration parameters | `Example below` |
| `prometheus_alert_jobs` | List of Prometheus alerting jobs configuration parameters | `Example below` |
| `prometheus_path` | Path to service files | `/opt/docker` |
| `prometheus_restart_policy` | Service container restart policy | `always` |
| `prometheus_network_mode` | Service container network mode | `host` |
| `prometheus_timezone` | Default timezone for docker service | `Europe/Moscow` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.node_exporter` | [README.md](../node_exporter/README.md) |
| `flyoverhead.docker.alertmanager` | [README.md](../alertmanager/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.node_exporter
      - role: flyoverhead.docker.prometheus
      - role: flyoverhead.docker.alertmanager
```

## Global configuration example

```yaml
prometheus_global_config:
  scrape_interval: "15s"
  scrape_timeout: "1m"
  evaluation_interval: "15s"
```

## Scrape configuration example

```yaml
prometheus_scrape_jobs:
  - job_name: "alertmanager"
    scrape_interval: "1m"
    static_configs:
      - targets: ["192.168.1.1:9093"]
        labels: { "instance": "alertmanager" }
  - job_name: "node-exporter"
    scrape_interval: "1m"
    static_configs:
      - targets: ["192.168.1.1:9100"]
        labels: { "instance": "node-exporter" }
  - job_name: "prometheus"
    scrape_interval: "1m"
    static_configs:
      - targets: ["192.168.1.1:9090"]
        labels: { "instance": "prometheus" }
```

## Alerting configuration example

```yaml
prometheus_alert_jobs:
  - static_configs:
      - targets: ["192.168.1.1:9093"]
```

## License

Apache-2.0

## Author Information

fLy0v3rH34d
