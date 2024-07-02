# `flyoverhead.docker.wireguard`

`Wireguard` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `wireguard_name` | Wireguard service name (used for container's and folder's names) | `wireguard` |
| `wireguard_image` | Wireguard docker image name | `linuxserver/wireguard` |
| `wireguard_tag` | Wireguard docker image version tag | `v1.0.20210914-ls3` |
| `wireguard_public_address` | Wireguard server (endpoint) address | `192.168.1.1` |
| `wireguard_public_port` | Wireguard server (endpoint) listening port | `51820` |
| `wireguard_internal_subnet` | Wireguard internal subnet used by server and peers | `10.13.13.0` |
| `wireguard_allowed_ips` | The IPs/Ranges that the peers will be able to reach using the wireguard connection | `["0.0.0.0/0"]` |
| `wireguard_peers` | Number of peers to create configurations for | `1` |
| `wireguard_path` | Path to service files | `/opt/docker` |
| `wireguard_restart_policy` | Service container restart policy | `always` |
| `wireguard_network_mode` | Service container network mode | `host` |
| `wireguard_timezone` | Default timezone for docker service | `Europe/Moscow` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example inventory

### Wireguard client configuration will be applied for hosts in `vpn_clients` hostgroup

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
      - role: flyoverhead.docker.wireguard
```

## License

Apache-2.0, BSD-Source-Code, GPL-1.0-only, GPL-2.0-only, MIT

## Author Information

fLy0v3rH34d
