# linuxserver - syncthing

This is a [Docker](/wiki/docker.md) container for syncthing for
[file synchronization](../file-synchronization.md).
The official container and documentation was made by
[linuxserver](https://hub.docker.com/r/linuxserver/syncthing).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment-variables

Set the following variables with the -e tag.

| Name        | Usage            | Default |
| ----------- | ---------------- | ------- |
| `PUID`      | UserID           |         |
| `PGID`      | GroupID          |         |
| `TZ`        | Timezone         |         |
| `UMASK_SET` | setting usermask |         |

## Volumes

Set the following volumes with the -v tag.

| Volume-Name        | Container mount | Description                                     |
| ------------------ | --------------- | ----------------------------------------------- |
| `syncthing_config` | `/config`       | storage for config and possible downloaded data |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description        |
| -------------- | ------------------------ | -------- | ------------------ |
| `8384`         | `8384`                   | TCP      | WebUI              |
| `22000`        | `22000`                  | TCP      | Syncthing internal |
| `21027`        | `21027`                  | UDP      | Syncthing internal |

## rebuild.sh

```sh
#!/bin/sh
docker stop syncthing
docker rm syncthing
docker pull linuxserver/syncthing
docker run --name syncthing \
    --restart unless-stopped \
    -p 8384:8384 \
    -p 22000:22000 \
    -p 21027:21027/udp \
    -v syncthing_config:/config \
    -e PUID=0 \
    -e PGID=0 \
    -e TZ=Europe/Berlin \
    -e UMASK_SET=022 \
    -d linuxserver/syncthing
```
