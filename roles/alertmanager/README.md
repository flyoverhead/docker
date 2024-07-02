# `flyoverhead.docker.alertmanager`

`Alertmanager` docker service deployment.

## Requirements

Custom messages templates can be added by placing templates files to `files` directory, e.g., `files/custom.tmpl`.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `alertmanager_name` | Alertmanager service name (used for container's and folder's names) | `alertmanager` |
| `alertmanager_image` | Alertmanager docker image name | `prom/alertmanager` |
| `alertmanager_tag` | Alertmanager docker image version tag | `v0.26.0` |
| `alertmanager_listening_address` | Alertmanager listening address | `127.0.0.1` |
| `alertmanager_listening_port` | Alertmanager listening port | `9093` |
| `alertmanager_command` | Alertmanager service starting options | `[--config.file=/etc/alertmanager/alertmanager.yml]` |
| `alertmanager_global_config` | List of Alertmanager global configuration parameters | `Example below` |
| `alertmanager_route_config` | List of Alertmanager route configuration parameters | `Example below` |
| `alertmanager_receivers_config` | List of Alertmanager recievers configuration parameters | `Example below` |
| `alertmanager_path` | Path to service files | `/opt/docker/alertmanager` |
| `alertmanager_restart_policy` | Service container restart policy | `always` |
| `alertmanager_network_mode` | Service container network mode | `host` |
| `alertmanager_timezone` | Default timezone for docker service | `Europe/Moscow` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.node-exporter` | [README.md](../node-exporter/README.md) |
| `flyoverhead.docker.prometheus` | [README.md](../prometheus/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.alertmanager
```

## Global configuration example

```yaml
alertmanager_global_config:
  resolve_timeout: 5m
```

## Route configuration example

```yaml
alertmanager_route_config:
  group_wait: 10s
  group_interval: 10m
  repeat_interval: 60m
  group_by:
    - alertname
  receiver: telegram
```

## Recievers configuration example

```yaml
alertmanager_receivers_config:
  - name: telegram
    telegram_configs:
      - send_resolved: true
        api_url: https://api.telegram.org
        bot_token: <telegram_bot_token>
        chat_id: <telegram_chat_id>
        message: '{% raw %}{{ template "telegram.custom.message" . }}{% endraw %}'
        parse_mode: Markdown
```

## License

Apache-2.0

## Author Information

fLy0v3rH34d
