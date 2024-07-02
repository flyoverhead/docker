# `flyoverhead.docker.dnscrypt`

`DNSCrypt Proxy` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `dnscrypt_name` | DNSCrypt Proxy service name (used for container's and folder's names) | `dnscrypt` |
| `dnscrypt_image` | DNSCrypt Proxy docker image name | `klutchell/dnscrypt-proxy` |
| `dnscrypt_tag` | DNSCrypt Proxy docker image version tag | `2.1.5` |
| `dnscrypt_listening_addresses` | DNSCrypt Proxy service listening addresses list (Default to `any`) | `['0.0.0.0']` |
| `dnscrypt_listening_port` | DNSCrypt Proxy service listening port | `5353` |
| `dnscrypt_public_resolvers` | [Extensive list of public DNS resolvers supporting the DNSCrypt and DNS-over-HTTP2 protocols](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration-Sources) (default: `all`) | `null` |
| `dnscrypt_ipv4_servers` | Use servers reachable over IPv4 | `true` |
| `dnscrypt_ipv6_servers` | Use servers reachable over IPv6 | `false` |
| `dnscrypt_public_servers` | Use servers implementing the DNSCrypt protocol | `true` |
| `dnscrypt_doh_servers` | Use servers implementing the DNS-over-HTTPS protocol | `true` |
| `dnscrypt_odoh_servers` | Use servers implementing the Oblivious DoH protocol | `true` |
| `dnscrypt_anon_servers` | Use anonymized DNS relays | `true` |
| `dnscrypt_quad_servers` | Use Quad9 servers | `true` |
| `dnscrypt_dnssec_servers` | Server must support DNS security extensions (DNSSEC) | `true` |
| `dnscrypt_nolog_servers` | Server must not log user queries (declarative) | `true` |
| `dnscrypt_nofilter_servers` | Server must not enforce its own blocklist (for parental control, ads blocking...) | `true` |
| `dnscrypt_disabled_public_resolvers` | Server names to avoid even if they match all criteria | `null` |
| `dnscrypt_upstream_servers` | List of normal, non-encrypted DNS resolvers, that will be only used for one-shot queries when retrieving the initial resolvers list | `['1.1.1.1', '8.8.8.8', '9.9.9.9']` |
| `dnscrypt_netprobe_address` | Address and port to try initializing a connection to, just to check if the network is up | `9.9.9.9` |
| `dnscrypt_block_unqualified` | Immediately respond to A and AAAA queries for host names without a domain name | `true` |
| `dnscrypt_block_undelegated` | Immediately respond to queries for local zones instead of leaking them to upstream resolvers | `true` |
| `dnscrypt_dns_cache` | Enable a DNS cache to reduce latency and outgoing traffic | `true` |
| `dnscrypt_dns_cache_size` | DNS cache size | `4096` |
| `dnscrypt_path` | Path to service files | `/opt/docker/dnscrypt` |
| `dnscrypt_restart_policy` | Service container restart policy | `always` |
| `dnscrypt_network_mode` | Service container network mode | `host` |
| `dnscrypt_timezone` | Default timezone for docker service | `Europe/Moscow` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.dnscrypt
```

## License

ISC

## Author Information

fLy0v3rH34d
