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
    - keenetic_router
    - smartphone
    - macbook
  # dns, inbounds, outbounds, routing and log: see defaults/main.yml for the full structure
```

## Predefined secrets

By default the role generates the server `REALITY` key pair (`xray x25519`) and
each client's `id`/`shortId` (`xray uuid` + `openssl rand`), and reuses any
values already present on the host (`config.json` / `public_key`).

To reuse previously generated secrets and skip the generation tasks, define the
values explicitly. This is useful for rebuilding a host from scratch or storing
secrets in a vault.

Server keys — when both `private_key` and `public_key` are set, `xray x25519`
is skipped:

```yaml
xray_server_config:
  private_key: SERVER_PRIVATE_KEY
  public_key: SERVER_PUBLIC_KEY
```

Client secrets — define a client as a mapping; when both `id` and `shortId` are
set, generation is skipped for that client (plain strings still auto-generate):

```yaml
xray_clients_config:
  clients:
    - android
    - email: keenetic_router
      id: 11111111-2222-3333-4444-555555555555
      shortId: 0123456789abcdef
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
