# portainer - agent

The official container and documentation was made by [portainer](https://hub.docker.com/r/portainer/agent).

## Volumes

Set the following volumes with the -v tag.

| Volume-Name               | Container mount           | Description                            |
| ------------------------- | ------------------------- | -------------------------------------- |
| `/var/run/docker.sock`    | `/var/run/docker.sock`    | connect your running docker containers |
| `/var/lib/docker/volumes` | `/var/lib/docker/volumes` | connect running docker volumes         |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description          |
| -------------- | ------------------------ | -------- | -------------------- |
| `9001`         | `9001`                   | TCP      | Portainer agent port |

## Rebuild

```shell
#!/bin/sh
docker stop portainer_agent
docker rm portainer_agent
docker pull portainer/agent:latest
docker run --name portainer_agent \
    -p 9001:9001 \
    --restart unless-stopped \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker/volumes:/var/lib/docker/volumes \
    -d portainer/agent:latest
```
