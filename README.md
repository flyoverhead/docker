# Ansible Collection - flyoverhead.docker

Ansible collection for deploying and configuring docker services.

## Compatibilities

This collection was tested with RaspberryPi 4, OrangePi 3 and OrangePi 5 hardware.

## Supported OS

- Debian 12.x "Bookworm" (AArch64)

## Installation and Usage

### Requirements

- Ansible `>=2.16`

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
    - flyoverhead.docker.node-exporter
    - flyoverhead.docker.prometheus
    - flyoverhead.docker.alertmanager
    - flyoverhead.docker.grafana
    - flyoverhead.docker.xray
    - flyoverhead.docker.dnscrypt
    - flyoverhead.docker.pihole
    - flyoverhead.docker.torrserver
```

## Included content

### Roles

| Name | Description |
| :--- | :--- |
| [alertmanager](roles/alertmanager/README.md) | Ansible role for `Alertmanager` service deployment. |
| [dnscrypt](roles/dnscrypt/README.md) | Ansible role for `Dnscrypt proxy` service deployment. |
| [docker](roles/docker/README.md) | Ansible role for `Docker` service deployment. |
| [grafana](roles/grafana/README.md) | Ansible role for `Grafana` service deployment. |
| [node-exporter](roles/node-exporter/README.md) | Ansible role for `Node exporter` service deployment. |
| [pihole](roles/pihole/README.md) | Ansible role for `PiHole` service deployment. |
| [prometheus](roles/prometheus/README.md) | Ansible role for `Prometheus` service deployment. |
| [torrserver](roles/torrserver/README.md) | Ansible role for `Torrserver` service deployment. |
| [xray](roles/xray/README.md) | Ansible role for `XRay VPN` service deployment. |

## Testing

Test can be launched from the root directory of the collection by running:

```Bash
task deploy
```

After successfull deployment all services can be accessed through the web browser on host machine at address:

```Bash
127.0.0.1:<service_port>
```

## License

- GPL-3.0-only

## Author Information

fLy0v3rH34d
