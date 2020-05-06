# Syncthing

## Setup

### Docker

The official container and documentation was made by [linuxserver](https://hub.docker.com/r/linuxserver/syncthing).

#### Environment-variables
Set the following variables with the -e tag.

| Name      | Usage            | Default |
| --------- | ---------------- | ------- |
| PUID      | UserID           |         |
| PGID      | GroupID          |         |
| TZ        | Timezone         |         |
| UMASK\_SET | setting usermask |         |

#### Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                                     |
| ---------------- | --------------- | ----------------------------------------------- |
| syncthing\_config | /config         | storage for config and possible downloaded data |

#### Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description        |
| -------------- | ------------------------ | -------- | ------------------ |
| 8384           | 8384                     | TCP      | WebUI              |
| 22000          | 22000                    | TCP      | Syncthing internal |
| 21027          | 21027                    | UDP      | Syncthing internal |

#### Rebuild

```
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
