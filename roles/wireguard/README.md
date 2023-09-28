# `flyoverhead.docker.wireguard`

`Wireguard` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `wireguard_name` | Wireguard service name (used for container's and folder's names) | `wireguard` |
| `wireguard_image` | Wireguard docker image name | `linuxserver/wireguard` |
| `wireguard_tag` | Wireguard docker image version tag | `v1.0.20210914-ls3` |
| `wireguard_server_address` | Wireguard server (endpoint) address | `192.168.1.1` |
| `wireguard_server_port` | Wireguard server (endpoint) listening port | `51820` |
| `wireguard_internal_subnet` | Wireguard internal subnet used by server and peers | `10.13.13.0` |
| `wireguard_allowed_ips` | The IPs/Ranges that the peers will be able to reach using the wireguard connection | `["0.0.0.0/0"]` |
| `wireguard_peers` | Number of peers to create configurations for. Can also be a list of names in alphanumeric (hostnames can be used to apply configuration to real hosts). | `["client01", "client02"]` |
| `wireguard_post_up` | Wireguard client post up command (Default: `route all host traffic through wireguard interface`) | `iptables -t nat -A POSTROUTING -o wg+ -j MASQUERADE` |
| `wireguard_post_down` | Wireguard client post down command (Default: `disable all host traffic routing`) | `iptables -t nat -D POSTROUTING -o wg+ -j MASQUERADE` |

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
