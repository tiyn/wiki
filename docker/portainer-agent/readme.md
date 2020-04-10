# Portainer-agent
This is a dockerized portainer-agent.
The official container and documentation was made by [portainer](https://hub.docker.com/r/portainer/agent).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name             | Container mount         | Description                            |
| ----------------------- | ----------------------- | -------------------------------------- |
| /var/run/docker.sock    | /var/run/docker.sock    | connect your running docker containers |
| /var/lib/docker/volumes | /var/lib/docker/volumes | connect running docker volumes         |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description          |
| -------------- | ------------------------ | -------- | -------------------- |
| 9001           | 9001                     | TCP      | Portainer agent port |

