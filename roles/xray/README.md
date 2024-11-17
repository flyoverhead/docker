# `docker.xray`

`XRay VPN` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `xray_docker_config` | Docker configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_service_config` | Service configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_clients_config` | Clients configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_geofiles` | External geofiles configuration | Definition example in [defaults.yml](defaults/main.yml) |
| `xray_tuning_config` | Server shadowsocks optimization [parameters](https://shadowsocks.org/doc/advanced.html#step-2-tune-the-kernel-parameters) | Definition example in [defaults.yml](defaults/main.yml) |

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
        server_01:
          ansible_host: 192.168.1.11
        server_02:
          ansible_host: 192.168.1.12
```

## Example playbook

```yaml
- hosts: docker
  roles:
      - role: flyoverhead.docker.xray
```

## Server config example

```yaml
xray_service_config:
  name: '{{ inventory_hostname }}'
  tag: proxy
  listening_address: 0.0.0.0
  listening_port: 443
  public_address: '{{ ansible_host }}'
  vless_address: youtube.com
  proxy:
    domain:
      - ext:geosite_v2fly.dat:category-anticensorship
      - ext:geosite_v2fly.dat:category-dev
      - ext:geosite_v2fly.dat:google
      - ext:geosite_v2fly.dat:netflix
      - ext:geosite_v2fly.dat:youtube
      - ext:zkeen.dat:domains
      - ext:zkeen.dat:youtube
```

## Clients list example

```yaml
xray_clients_config:
  path: '{{ playbook_dir }}'
  clients:
    - name: router
      protocol: dokodemo-door
    - name: smaptphone
      protocol: socks
```

## Geofiles example

```yaml
xray_geofiles:
  - name: geosite_v2fly
    repo: v2fly/domain-list-community
    file: dlc.dat
  - name: zkeen
    repo: jameszeroX/zkeen-domains
    file: zkeen.dat
```

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
