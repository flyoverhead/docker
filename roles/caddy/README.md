# `flyoverhead.docker.caddy`

`Caddy` web server docker service deployment: one static site with an
automatically issued and renewed Let's Encrypt certificate.

## Purpose

Built as a self-hosted REALITY target for `flyoverhead.docker.xray`. The TLS
site listens on `https_bind:https_port` (`127.0.0.1:8443` by default), and xray
points `xray_server_config.reality_target` at it. Probes of xray's public :443
are then answered by this site, with a real certificate for the server's own
name, instead of by a third-party website.

The plain-HTTP site listens publicly on `http_port` (80): it answers the ACME
HTTP-01 challenge and redirects everything else to `https://`. Keep that port
open and the domain's A record pointed at the host, or renewal fails. The
TLS-ALPN-01 challenge is disabled because :443 belongs to xray.

The container runs on the host network: a loopback bind behind a docker bridge
would be unreachable from the host. The admin API is off, so a configuration
change restarts the container instead of reloading it.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `caddy_docker_config` | Docker configuration | Definition example in [defaults/main.yml](defaults/main.yml) |
| `caddy_service_config` | Site name, ports, TLS bind address, page title | Definition example in [defaults/main.yml](defaults/main.yml) |

`caddy_service_config.domain` is required; `detect.yml` fails when it is empty.
It is also the `default_sni`, so a handshake without SNI gets this site's
certificate rather than an alert.

`aliases` lists further names served by the same site (for example the apex and
`www`); Caddy obtains a certificate for each, so each must resolve to the host.

`site_src` is a directory on the controller whose contents are copied to the
site root. When it is empty the role serves a one-page placeholder titled
`site_title` (falling back to the domain). The copy itself never deletes files
that were removed from `site_src`; set `site_prune: true` to delete them, which
matters for generators that write content-hashed asset names on every build.
Errors are served from `/<status>.html` in the site root when present, so ship
at least a `404.html`. Caddy reads the files from disk on every request, so
content changes need no restart.

Responses are compressed with zstd or gzip. `headers` sets response headers on
the TLS site, for example `Strict-Transport-Security`; a name starting with `-`
removes that header (`-Server: ''`). The default is none, so the placeholder
site of a REALITY target keeps Caddy's stock responses unless you add some.

## Facts set by this role

| Fact | Description |
| :--- | :--- |
| `caddy_container_exists` | Whether the container is already present |
| `caddy_container_update` | Whether the running container's image differs from the configured tag |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |

## Example playbook

```yaml
- hosts: xray
  gather_facts: true
  roles:
    - role: flyoverhead.docker.docker
    - role: flyoverhead.docker.caddy
    - role: flyoverhead.docker.xray
```

## Service configuration example

```yaml
caddy_service_config:
  domain: tw.example.org
  http_port: 80
  https_port: 8443
  https_bind: 127.0.0.1
  aliases:
    - example.org
    - www.example.org
  site_title: ''
  site_src: '{{ inventory_dir }}/files/sites/example'
  site_prune: true
  headers:
    Strict-Transport-Security: max-age=31536000
    X-Content-Type-Options: nosniff
    Referrer-Policy: strict-origin-when-cross-origin
    -Server: ''

xray_server_config:
  # ...
  vless_address: tw.example.org
  reality_target: 127.0.0.1:8443
```

## Check mode

`--check --diff` reports drift in the rendered Caddyfile, the site and the
compose file. With `site_prune`, the run lists the site root even in check mode and reports
each file it would delete. Detection reads the running container through
`community.docker.docker_container_info`, so a check run needs a reachable
docker daemon. On a first deployment the compose handlers are skipped in check
mode.

## Tags

| Tag | Purpose |
| :--- | :--- |
| `caddy.detect` | Container state detection only |
| `caddy.install` | First deployment |
| `caddy.update` | Image tag change: pull and recreate |
| `caddy.config` | Caddyfile and site content |

## License

GPL-3.0-only

## Author Information

fLy0v3rH34d
