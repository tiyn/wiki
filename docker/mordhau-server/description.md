# Mordhau-server
This is a dockerized version of a mordhau server.
The official container and documentation was made by [tetricz](https://hub.docker.com/r/tetricz/mordhau-server).

## Environment-variables
Set the following variables with the -e tag.

| Name | Usage                                                | Default |
| ---- | ---------------------------------------------------- | ------- |
| QUERYPORT | port for query mordhau                          |         |
| GAME_PORT | port for mordhau game                           |         |
| BEACONPORT | port for mordhau beacon                        |         |
| STEAM_CONNECT | set to tell if you want to connect to steam |         |
| STEAMID64 | set the serve owner steamid                     |         |
| UID | users userid to run                                   |         |
| GID | users groupid to run                                  |         |
| GAME_MODE | specify mordhau game mode                       |         |
| PLAYER_COUNT | set a playercount limit                      |         |
| SERVER_NAME | set a servername                              |         |
| SERVER_PASSWORD | set a password                            |         |
| ADMIN_PASSWORD | set an admin password                      |         |

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount      | Description             |
| ---------------- | -------------------- | ---------------------------------------- |
| mordhau          | /serverdata/mordhau  | storage for mordhau server relevant data |
| mordhau_steamcmd | /serverdata/steamcmd | storage for steam related data           |


## Ports
Set the following ports with the -p tag.
| Container Port | Recommended outside port | Protocol | Description       |
| -------------- | ------------------------ | -------- | ----------------- |
| 7777           | 7777                     | UDP      |  mordhau internal |
| 15000          | 15000                    | UDP      |  mordhau internal |
| 27015          | 27015                    | UDP      |  mordhau internal |

