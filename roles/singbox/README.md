# `flyoverhead.docker.singbox`

`Sing-Box VPN` (VLESS + REALITY) docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `singbox_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_server_config` | Server configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_clients_config` | Clients configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_tuning_config` | Server kernel optimization parameters | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_force_update_secrets` | Force regeneration of server keys and client secrets | `false` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example inventory

```yaml
all:
  children:
    sing_box:
      hosts:
        vps_host:
```

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.singbox
```

## Server config example

```yaml
singbox_server_config:
  name: '{{ inventory_hostname }}'
  listening_address: 0.0.0.0
  listening_port: 443
  public_address: '{{ ansible_host }}'
  vless_address: npo.nl
  vless_port: 443
  dns_port: 53
  # dns, endpoints, outbounds, route and log: see defaults/main.yml for the full structure
```

## Clients list example

```yaml
singbox_clients_config:
  path: '{{ inventory_dir }}/files/clients'
  clients:
    - name: keenetic_router
    - name: smartphone
      platform: android
    - name: iphone
      platform: ios
    - name: macbook
      platform: macos
  dns:
    servers:
      - tag: dns-direct
        address: local
        detour: out-direct
      - tag: dns-proxy
        address: https://dns.adguard-dns.com/dns-query
        address_resolver: dns-direct
        detour: out-proxy
    rules:
      - outbound: out-direct
        server: dns-direct
    final: dns-direct
    strategy: ipv4_only
    independent_cache: true
  route:
    rules:
      - protocol: dns
        action: hijack-dns
      - domain:
          - 4pda.to
        outbound: out-proxy
    rule_set:
      - tag: geosite-category-ads
        type: remote
        format: binary
        url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-ads.srs
        action: reject
    default_domain_resolver:
      server: dns-direct
    auto_detect_interface: true
  # inbounds, outbounds, endpoints, log and experimental: see defaults/main.yml for the full structure
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
