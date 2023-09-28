# Ansible Collection - flyoverhead.docker

Ansible collection for deployment and configuration of Docker services.

## Compatibilities

This collection was tested with RaspberryPi 4, OrangePi 3 and OrangePi 5 hardware.

## Supported OS

- Debian 11.x "Bullseye" (amd64, AArch64)
- Debian 12.x "Bookworm" (AArch64)

## Installation and Usage

### Requirements

- Ansible `>=2.13`

- Task `>=3.20`

### Installation

Installing collection:

```bash
ansible-galaxy collection install -r requirements.yml
```

### Roles usage

Full documentation and usage examples of role `<role>` can be found in `roles/<role>/README.md`.

### Example Playbook

```yaml
---
- hosts: all
  become: true
  gather_facts: true
  roles:
    - flyoverhead.docker.docker
    - flyoverhead.docker.postgres
    - flyoverhead.docker.gitea
    - flyoverhead.docker.drone
    - flyoverhead.docker.drone_runner
    - flyoverhead.docker.nextcloud
    - flyoverhead.docker.torrserver
    - flyoverhead.docker.node_exporter
    - flyoverhead.docker.prometheus
    - flyoverhead.docker.alertmanager
    - flyoverhead.docker.grafana
    - flyoverhead.docker.wireguard
    - flyoverhead.docker.xray
    - flyoverhead.docker.dnscrypt
    - flyoverhead.docker.pihole
```

## Included content

### Roles

| Name | Description |
| :--- | :--- |
| [alertmanager](roles/alertmanager/README.md) | Ansible role for `Alertmanager` service deployment. |
| [dnscrypt](roles/dnscrypt/README.md) | Ansible role for `Dnscrypt proxy` service deployment. |
| [docker](roles/docker/README.md) | Ansible role for `Docker` service deployment. |
| [drone](roles/drone/README.md) | Ansible role for `Drone CI` service deployment. |
| [drone_runner](roles/drone_runner/README.md) | Ansible role for `Drone runner` service deployment. |
| [gitea](roles/gitea/README.md) | Ansible role for `Gitea` service deployment. |
| [grafana](roles/grafana/README.md) | Ansible role for `Grafana` service deployment. |
| [nextcloud](roles/nextcloud/README.md) | Ansible role for `Nextcloud` service deployment. |
| [node_exporter](roles/node_exporter/README.md) | Ansible role for `Node exporter` service deployment. |
| [pihole](roles/pihole/README.md) | Ansible role for `PiHole` service deployment. |
| [postgres](roles/postgres/README.md) | Ansible role for `PostgreSQL` service deployment. |
| [prometheus](roles/prometheus/README.md) | Ansible role for `Prometheus` service deployment. |
| [torrserver](roles/torrserver/README.md) | Ansible role for `Torrserver` service deployment. |
| [wireguard](roles/wireguard/README.md) | Ansible role for `Wireguard` service deployment. |
| [xray](roles/xray/README.md) | Ansible role for `XRay VPN` service deployment. |

## Testing

All required variables should be defined in `tests/vars.yml`.

Test can be launched from the root directory of the collection by running:

```Bash
task test-<env>
```

Where `<env>` can be defined according to provider:

| Variable | Provider |
| :--- | :--- |
| `vmware` | VMWare Fusion for Apple Silicon M1/M2 |
| `vbox` | Virtual Box for x86-64 |

After successfull deployment all services can be accessed through the web browser on host machine at address:

```Bash
127.0.0.1:<service_port>
```

## License

- GPL-3.0-only

## Author Information

fLy0v3rH34d
