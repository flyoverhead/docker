# `flyoverhead.docker.alertmanager`

`Alertmanager` docker service deployment.

## Requirements

Custom messages templates can be added by placing templates files to `files` directory, e.g., `files/custom.tmpl`.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `alertmanager_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `alertmanager_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `alertmanager_command` | Service start options | `[--config.file=/etc/alertmanager/alertmanager.yml]` |
| `alertmanager_global_config` | Global configuration parameters | `Example below` |
| `alertmanager_route_config` | Route configuration parameters | `Example below` |
| `alertmanager_receivers_config` | Recievers configuration parameters | `Example below` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.node-exporter` | [README.md](../node-exporter/README.md) |
| `flyoverhead.docker.prometheus` | [README.md](../prometheus/README.md) |

## Example playbook

```yaml
- hosts: docker
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

GPL-3.0-only

## Author Information

fLy0v3rH34d
