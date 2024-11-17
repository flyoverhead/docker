# flyoverhead.docker.prometheus

`Prometheus` docker service deployment.

## Requirements

Alerting rules can be added by placing rules files to `files` directory, e.g., `files/rules.yml`.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `prometheus_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `prometheus_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `prometheus_command` | Service start options | Definition example in [defaults.yml](defaults/main.yml) |
| `prometheus_global_config` | Global configuration parameters | Definition example in [defaults.yml](defaults/main.yml) |
| `prometheus_scrape_jobs` | Scrape jobs configuration parameters | Definition example in [defaults.yml](defaults/main.yml) |
| `prometheus_alert_jobs` | Alerting jobs configuration parameters | Definition example in [defaults.yml](defaults/main.yml) |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.node-exporter` | [README.md](../node-exporter/README.md) |
| `flyoverhead.docker.alertmanager` | [README.md](../alertmanager/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.node-exporter
      - role: flyoverhead.docker.prometheus
      - role: flyoverhead.docker.alertmanager
```

## Global configuration example

```yaml
prometheus_global_config:
  scrape_interval: 15s
  scrape_timeout: 1m
  evaluation_interval: 15s
```

## Scrape configuration example

```yaml
prometheus_scrape_jobs:
  - job_name: alertmanager
    scrape_interval: 1m
    static_configs:
      - targets:
        - 192.168.1.1:9093
        labels:
          instance: alertmanager
  - job_name: node-exporter
    scrape_interval: 1m
    static_configs:
      - targets:
          - 192.168.1.1:9100
        labels:
          instance: node-exporter
  - job_name: prometheus
    scrape_interval: 1m
    static_configs:
      - targets:
          - 192.168.1.1:9090
        labels:
          instance: prometheus
```

## Alerting configuration example

```yaml
prometheus_alert_jobs:
  - static_configs:
      - targets:
          - 192.168.1.1:9093
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
