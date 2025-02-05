# portainer - portainer

This is a [Docker](/wiki/docker.md) container for a [portainer](../portainer.md)
server.
The official container and documentation was made by
[portainer](https://hub.docker.com/r/portainer/portainer).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount        | Description                                       |
| ------------------------- | ---------------------- | ------------------------------------------------- |
| `portainer`               | `/data`                | configuration directory                           |
| `/var/run/docker.sock`    | `/var/run/docker.sock` | connection to local docker containers and volumes |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `9000`         | `9000`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker stop portainer
docker rm portainer
docker pull portainer/portainer:latest
docker run --name portainer \
    --restart unless-stopped \
    -p 9000:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer:/data \
    -d portainer/portainer
```
