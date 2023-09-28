# `flyoverhead.docker.drone_runner`

`Drone runner` docker service deployment.

## Role variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `service_root_path` | Root path for services files on host machine | `/opt/docker_services` |
| `docker_restart_policy` | Docker containers restart policy | `always` |
| `docker_network_mode` | Docker containers network mode | `host` |
| `timezone` | Default timezone for docker services | `Europe/Moscow` |
| `drone_runner_name` | Drone runner service name (used for container's and folder's names) | `drone-runner` |
| `drone_runner_image` | Drone runner docker image name | `drone/drone-runner-docker` |
| `drone_runner_tag` | Drone runner docker image version tag | `1.8.3` |
| `drone_runner_port` | Drone runner service HTTP port used to access the web dashboard | `8010` |
| `drone_runner_rpc_proto` | IP protocol of Drone CI server | `http` |
| `drone_runner_rpc_host` | IP/FQDN of Drone CI server | `192.168.1.1:8000` |
| `drone_runner_rpc_secret` | Shared secret used to authenticate the RPC connection to the Drone CI server | `c8df9027745212b3b19416cc2247d9ce` |
| `drone_runner_username` | Drone runner user name used to authenticate and access the web dashboard | `gitea` |
| `drone_runner_password` | Drone runner user password used to authenticate and access the web dashboard | `gitea` |

## Dependencies

| Name | Description |
| :--- | :--- |
| `flyoverhead.docker.docker` | [README.md](../docker/README.md) |
| `flyoverhead.docker.postgres` | [README.md](../postgres/README.md) |
| `flyoverhead.docker.gitea` | [README.md](../gitea/README.md) |
| `flyoverhead.docker.drone` | [README.md](../drone/README.md) |

## Example playbook

```yaml
- hosts: host
  roles:
      - role: flyoverhead.docker.docker
      - role: flyoverhead.docker.postgres
      - role: flyoverhead.docker.gitea
      - role: flyoverhead.docker.drone
      - role: flyoverhead.docker.drone_runner
```

## License

PolyForm-Small-Business-1.0.0

## Author Information

fLy0v3rH34d
