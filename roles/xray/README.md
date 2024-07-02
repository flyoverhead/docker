# `docker.xray`

`XRay VPN` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `xray_name` | Service name (used for container's and folder's names) | `xray` |
| `xray_image` | Docker image name | `teddysun/xray` |
| `xray_tag` | Docker image version tag | `1.8.4` |
| `xray_path` | Service path | `/opt/docker/xray` |
| `xray_restart_policy` | Docker containers restart policy | `always` |
| `xray_network_mode` | Docker containers network mode | `host` |
| `xray_timezone` | Default timezone for docker services | `Europe/Moscow` |
| `xray_listening_address` | Service listening address | `0.0.0.0` |
| `xray_listening_port` | Service listening port | `443` |
| `xray_public_address` | Server public IP address | `192.168.1.1` |
| `xray_server_config` | Server configuration | `[example below](#server-config-example)` |
| `xray_clients` | Service clients list | `[example below](#clients-list-example)` |
| `xray_geofiles` | Geofiles list | `[example below](#geofiles-example)` |
| `xray_server_socks_tuning` | Server [shadowsocks optimizations](https://shadowsocks.org/doc/advanced.html) | `false` |
| `xray_server_socks_tuning_config` | Server shadowsocks optimization [parameters](https://shadowsocks.org/doc/advanced.html#step-2-tune-the-kernel-parameters) | `[example below](#shadowsocks-server-optimization-parameters-example)` |
| `xray_system_limits` | Server required system limits for [shadowsocks optimizations](https://shadowsocks.org/doc/advanced.html#step-1-increase-the-maximum-number-of-open-file-descriptors) | `[example below](#shadowsocks-server-system-limits-example)` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `docker.docker` | [README.md](../docker/README.md) |

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
- hosts: all
  roles:
      - role: docker.xray
```

## Server config example

```yaml
xray_server_config:
  name: '{{ inventory_hostname }}'
  tag: proxy
  server_address: '{{ ansible_host }}'
  vless_address: example.com
  block:
    domain:
      - blocked-domain.com
    ip:
      - 111.111.111.111
    port:
      - 8080
    protocol:
      - udp
  # direct:
  #   domain:
  #     - direct-domain.com
  proxy:
    domain:
      - proxied-domain.com
    ip:
      - 8.8.8.8
    port:
      - 443
    protocol:
      - tcp
```

## Clients list example

```yaml
xray_clients:
  - name: client01
    protocol: socks
  - name: client02
    protocol: dokodemo-door
```

## Geofiles example

```yaml
xray_geofiles:
  - name: geodata_v2fly
    repo: v2fly/domain-list-community
    file: dlc.dat
  - name: geoip_v2fly
    repo: loyalsoldier/v2ray-rules-dat
    file: geoip.dat
  - name: geosite_v2fly
    repo: v2fly/domain-list-community
    file: dlc.dat
```

## Shadowsocks server optimization parameters example

```yaml
xray_server_socks_tuning_config:
  fs.file-max: 51200
  net.core.default_qdisc: fq
  net.ipv4.tcp_congestion_control: bbr
  net.core.rmem_max: 67108864
  net.core.wmem_max: 67108864
  net.core.netdev_max_backlog: 250000
  net.core.somaxconn: 4096
  net.ipv4.tcp_syncookies: 1
  net.ipv4.tcp_tw_reuse: 1
  net.ipv4.tcp_fin_timeout: 30
  net.ipv4.tcp_keepalive_time: 1200
  net.ipv4.ip_local_port_range: 10000 65000
  net.ipv4.tcp_keepalive_probes: 5
  net.ipv4.tcp_keepalive_intvl: 30
  net.ipv4.tcp_max_syn_backlog: 8192
  net.ipv4.tcp_max_tw_buckets: 5000
  net.ipv4.tcp_fastopen: 3
  net.ipv4.tcp_mem: 25600 51200 102400
  net.ipv4.udp_mem: 25600 51200 102400
  net.ipv4.tcp_rmem: 4096 87380 67108864
  net.ipv4.tcp_wmem: 4096 65536 67108864
  net.ipv4.tcp_mtu_probing: 1
  net.ipv4.tcp_slow_start_after_idle: 0
```

## Shadowsocks server system limits example

```yaml
xray_system_limits:
  - limit: nofile
    domain: '*'
    types:
      - type: soft
        value: 51200
      - type: hard
        value: 51200
```

## License

MPL-2.0

## Author Information

fLy0v3rH34d
