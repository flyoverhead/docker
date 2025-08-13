# `docker.singbox`

`Sing-Box VPN` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `singbox_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_server_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_clients_config` | Clients configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `singbox_tuning_config` | Server shadowsocks optimization [parameters](https://shadowsocks.org/doc/advanced.html#step-2-tune-the-kernel-parameters) | Definition example in [defaults.yml](defaults/main.yml) |

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
  dns_servers: []
  dns_rules: []
  endpoints: []
  route_rules: []
  rule_sets: []
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
  dns_servers:
    - tag: dns-local
      address: local
      detour: out-direct
    - tag: dns-proxy
      address: https://dns.adguard-dns.com/dns-query
      address_resolver: dns-local
      detour: out-proxy
    - tag: dns-direct
      address: https://common.dot.dns.yandex.net
      address_resolver: dns-local
      detour: out-direct
  dns_rules:
    - outbound: out-direct
      server: dns-direct
    - outbound: out-proxy
      server: dns-proxy
  route_rules:
    - inbound: tun-in
      action: sniff
    - protocol: dns
      action: hijack-dns
    - protocol: bittorrent
      outbound: out-direct
    - domain:
        - 4pda.to
      outbound: out-proxy
    - domain_regex:
        - anthropic.+
        - claude.+
      outbound: out-proxy
  rule_sets:
    - tag: geosite-category-ads
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-ads.srs
      action: reject
    - tag: antizapret
      type: remote
      format: binary
      url: https://github.com/savely-krasovsky/antizapret-sing-box/releases/latest/download/antizapret.srs
      outbound: out-proxy
    - tag: geoip-ru
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geoip/rule-set/geoip-ru.srs
      outbound: out-direct
    - tag: geosite-category-anticensorship
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-anticensorship.srs
      outbound: out-proxy
    - tag: geosite-category-communication
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-communication.srs
      outbound: out-proxy
    - tag: geosite-category-companies
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-companies.srs
      outbound: out-proxy
    - tag: geosite-category-cryptocurrency
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-cryptocurrency.srs
      outbound: out-proxy
    - tag: geosite-category-ecommerce
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-ecommerce.srs
      outbound: out-proxy
    - tag: geosite-category-dev
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-dev.srs
      outbound: out-proxy
    - tag: geosite-category-entertainment
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-entertainment.srs
      outbound: out-proxy
    - tag: geosite-category-gov-ru
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-gov-ru.srs
      outbound: out-direct
    - tag: geosite-category-porn
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-porn.srs
      outbound: out-proxy
    - tag: geosite-category-ru
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-category-ru.srs
      outbound: out-direct
    - tag: geosite-google-gemini
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-google-gemini.srs
      outbound: out-proxy
    - tag: geosite-google-play
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-google-play.srs
      outbound: out-proxy
    - tag: geosite-google-registry
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-google-registry.srs
      outbound: out-proxy
    - tag: geosite-google-trust-services
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-google-trust-services.srs
      outbound: out-proxy
    - tag: geosite-google
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-google.srs
      outbound: out-proxy
    - tag: geosite-googlefcm
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-googlefcm.srs
      outbound: out-proxy
    - tag: geosite-instagram
      type: remote
      format: binary
      url: https://raw.githubusercontent.com/sagernet/sing-geosite/rule-set/geosite-instagram.srs
      outbound: out-proxy
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
