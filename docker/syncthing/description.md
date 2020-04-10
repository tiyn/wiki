# Syncthing
This is a dockerized version of a syncthing server.
The official container and documentation was made by [linuxserver](https://hub.docker.com/r/linuxserver/syncthing).

## Environment-variables
Set the following variables with the -e tag.

| Name      | Usage            | Default |
| --------- | ---------------- | ------- |
| PUID      | UserID           |         |
| PGID      | GroupID          |         |
| TZ        | Timezone         |         |
| UMASK_SET | setting usermask |         |

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                                     |
| ---------------- | --------------- | ----------------------------------------------- |
| syncthing_config | /config         | storage for config and possible downloaded data |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description        |
| -------------- | ------------------------ | -------- | ------------------ |
| 8384           | 8384                     | TCP      | WebUI              |
| 22000          | 22000                    | TCP      | Syncthing internal |
| 21027          | 21027                    | UDP      | Syncthing internal |

