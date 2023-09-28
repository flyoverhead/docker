# `flyoverhead.docker.pihole`

`PiHole` docker service deployment.

## Requirements

Blocklists, domains blacklists and whitelists can be added by filling in the corresponding files:

| File | Purpose |
| :--- | :--- |
| adlist.list | ADs list |
| domain_black.list | Domains blacklist |
| domain_white.list | Domains whitelist |

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `sysctl_config_ipv6` | Sysctl IPv6 parameters list | `["net.ipv6.conf.all.disable_ipv6", "net.ipv6.conf.default.disable_ipv6", "net.ipv6.conf.lo.disable_ipv6"]` |
| `pihole_required_packages` | List of packages required for PiHole configuration | `sqlite3` |
| `pihole_name` | PiHole service name (used for container's and folder's names) | `pihole` |
| `pihole_image` | PiHole docker image name | `pihole/pihole` |
| `pihole_tag` | PiHole docker image version tag | `2023.05.2` |
| `pihole_dnsmasq_listening_address` | PiHole Dnsmasq listening address | `all` |
| `pihole_upstream_dns` | PiHole upstream DNS servers list | `["192.168.1.1#5353"]` |
| `pihole_web_password` | PiHole web panel access password | `pihole` |
| `pihole_web_port` | PiHole web panel access port | `8080` |
| `pihole_dns_port` | PiHole DNS listening port | `53` |
| `pihole_dnssec` | PiHole DNSSEC support | `true` |
| `pihole_query_logging` | PiHole query logging | `true` |
| `pihole_dns_bogus_priv` | Disable forwarding of reverse lookups for private ranges | `true` |
| `pihole_dns_fqdn_required` | Disable forwarding of non-FQDNs | `true` |
| `pihole_web_theme` | PiHole user interface theme | `default-dark` |
| `pihole_ipv6_support` | PiHole IPv6 support (for unraid compatibility, strips out all the IPv6 configuration from DNS/Web services when `false`) | `false` |
| `pihole_adlist_content` | PiHole adlist content (populated from `adlist.list` file) | [adlist.list](files/adlist.list) |
| `pihole_domain_blacklist_content` | PiHole domain blacklist content (populated from `domain_black.list` file) | [domain_black.list](files/domain_black.list) |
| `pihole_domain_whitelist_content` | PiHole domain whitelist content (populated from `domain_white.list` file) | [domain_white.list](files/domain_white.list) |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.pihole
```

## License

EUPL-1.2

## Author Information

fLy0v3rH34d
