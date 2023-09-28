# `flyoverhead.docker.xray`

`XRay VPN` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `xray_name` | XRay service name (used for container's and folder's names) | `xray` |
| `xray_image` | XRay docker image name | `teddysun/xray` |
| `xray_tag` | XRay docker image version tag | `1.8.4` |
| `xray_listening_address` | XRay service listening address | `0.0.0.0` |
| `xray_listening_port` | XRay service listening port | `443` |
| `xray_config` | XRay server config to be used (based on [technology](https://github.com/XTLS/Xray-examples)) | `vless_xtls_utls_reality` |
| `xray_server_public_address` | XRay server public IP address | `192.168.1.1` |
| `xray_server_vless_flow` | XRay server VLESS flow | `"xtls-rprx-vision` |
| `xray_clients_list` | XRay clients list (hostnames can be used to apply configuration to real hosts) | `["client1", "client2"]` |
| `xray_server_socks_tuning` | XRay server [shadowsocks optimizations](https://shadowsocks.org/doc/advanced.html) | `false` |
| `xray_server_socks_tuning_config` | XRay server shadowsocks optimization [parameters](https://shadowsocks.org/doc/advanced.html#step-2-tune-the-kernel-parameters) | `Example below` |
| `xray_system_limits` | XRay server required system limits for [shadowsocks optimizations](https://shadowsocks.org/doc/advanced.html#step-1-increase-the-maximum-number-of-open-file-descriptors) | `Example below` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example inventory

### XRay client configuration will be applied for hosts in `vpn_clients` hostgroup

```yaml
test:
  children:
    vpn_server:
      hosts:
        server:
          ansible_host: "192.168.1.11"
    vpn_clients:
      hosts:
        client01:
          ansible_host: "192.168.1.12"
        client02:
          ansible_host: "192.168.1.13"
```

## Example playbook

```yaml
- hosts: all
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.xray
```

## Shadowsocks server optimization parameters example

```yaml
xray_server_socks_tuning_config:
  fs.file-max: "51200"
  net.core.default_qdisc: "fq"
  net.ipv4.tcp_congestion_control: "bbr"
  net.core.rmem_max: "67108864"
  net.core.wmem_max: "67108864"
  net.core.netdev_max_backlog: "250000"
  net.core.somaxconn: "4096"
  net.ipv4.tcp_syncookies: "1"
  net.ipv4.tcp_tw_reuse: "1"
  net.ipv4.tcp_fin_timeout: "30"
  net.ipv4.tcp_keepalive_time: "1200"
  net.ipv4.ip_local_port_range: "10000 65000"
  net.ipv4.tcp_keepalive_probes: "5"
  net.ipv4.tcp_keepalive_intvl: "30"
  net.ipv4.tcp_max_syn_backlog: "8192"
  net.ipv4.tcp_max_tw_buckets: "5000"
  net.ipv4.tcp_fastopen: "3"
  net.ipv4.tcp_mem: "25600 51200 102400"
  net.ipv4.udp_mem: "25600 51200 102400"
  net.ipv4.tcp_rmem: "4096 87380 67108864"
  net.ipv4.tcp_wmem: "4096 65536 67108864"
  net.ipv4.tcp_mtu_probing: "1"
  net.ipv4.tcp_slow_start_after_idle: "0"
```

## Shadowsocks server system limits example

```yaml
xray_system_limits:
  - limit: "nofile"
    domain: "*"
    types:
      - type: "soft"
        value: "51200"
      - type: "hard"
        value: "51200"
```

## License

MPL-2.0

## Author Information

fLy0v3rH34d
