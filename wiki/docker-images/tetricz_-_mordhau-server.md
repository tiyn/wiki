# tetricz - mordhau-server

This is a docker container for a mordhau server.
The official container and documentation was made by [tetricz](https://hub.docker.com/r/tetricz/mordhau-server).

## Environment-variables

Set the following variables with the -e tag.

| Name              | Usage                                       | Default |
| ----------------- | ------------------------------------------- | ------- |
| `QUERYPORT`       | port for query mordhau                      |         |
| `GAME_PORT`       | port for mordhau game                       |         |
| `BEACONPORT`      | port for mordhau beacon                     |         |
| `STEAM_CONNECT`   | set to tell if you want to connect to steam |         |
| `STEAMID64`       | set the serve owner steamid                 |         |
| `UID`             | users userid to run                         |         |
| `GID`             | users groupid to run                        |         |
| `GAME_MODE`       | specify mordhau game mode                   |         |
| `PLAYER_COUNT`    | set a playercount limit                     |         |
| `SERVER_NAME`     | set a servername                            |         |
| `SERVER_PASSWORD` | set a password                              |         |
| `ADMIN_PASSWORD`  | set an admin password                       |         |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount        | Description                              |
| ------------------------- | ---------------------- | ---------------------------------------- |
| `mordhau`                 | `/serverdata/mordhau`  | storage for mordhau server relevant data |
| `mordhau_steamcmd`        | `/serverdata/steamcmd` | storage for steam related data           |

## Ports

Set the following ports with the -p tag.
| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------------- |
| `7777` | `7777` | UDP | mordhau internal |
| `15000` | `15000` | UDP | mordhau internal |
| `27015` | `27015` | UDP | mordhau internal |

## start.sh

```shell
#!/bin/sh

docker pull tetricz/mordhau-server
docker run --name=mordhau \
 --restart=unless-stopped \
 -p 27015:27015/udp \
 -p 7777:7777/udp \
 -p 15000:15000/udp \
 -v mordhau:/serverdata/mordhau \
 -v mordhau_steamcmd:/serverdata/steamcmd \
 -e QUERYPORT=27015 \
 -e GAME_PORT=7777 \
 -e BEACONPORT=15000 \
 -e STEAM_CONNECT=True \
 -e STEAMID64="tmp" \
 -e UID=99 \
 -e GID=100 \
 -e GAME_MODE=SKM \
 -e PLAYER_COUNT="16" \
 -e SERVER_NAME="tmp" \
 -e SERVER_PASSWORD="tmp" \
 -e ADMIN_PASSWORD="tmp" \
 tetricz/mordhau-server
```

## stop.sh

```shell
#/bin/sh

docker stop mordhau
docker rm mordhau
```
