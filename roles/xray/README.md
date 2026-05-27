# `flyoverhead.docker.xray`

`Xray VPN` (VLESS + REALITY) docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `xray_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_server_config` | Server configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_clients_config` | Clients configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_tuning_config` | Server kernel optimization parameters | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_force_update_secrets` | Force regeneration of server keys and client secrets | `false` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example inventory

```yaml
all:
  children:
    xray:
      hosts:
        vps_host:
```

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.xray
```

## Server config example

```yaml
xray_server_config:
  name: '{{ inventory_hostname }}'
  tag: proxy
  listening_address: 0.0.0.0
  listening_port: 443
  public_address: '{{ ansible_host }}'
  vless_address: vk.com
  target_port: 443
  dns_port: 53
  # dns, outbounds, routing and log: see defaults/main.yml for the full structure
```

## Clients list example

```yaml
xray_clients_config:
  path: '{{ inventory_dir }}/files/clients'
  clients:
    - name: keenetic_router
    - name: smartphone
      platform: android
    - name: iphone
      platform: ios
    - name: macbook
      platform: macos
  # dns, inbounds, outbounds, routing and log: see defaults/main.yml for the full structure
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
