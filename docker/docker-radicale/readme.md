# Docker-radicale
This is a dockerized version of a radicale server.
The official container and documentation was made by [tomsquest](https://hub.docker.com/r/tomsquest/docker-radicale).

The ```latest``` tag at the moment of writing this readme was corrupted.
The last usable tag was used therefore to guarantee best performance for all users.

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                 |
| ---------------- | --------------- | --------------------------- |
| radicale_data    | /data           | storage for caldav          |
| radicale_config  | /config         | storage for radicale config |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description   |
| -------------- | ------------------------ | -------- | ------------- |
| 5232           | 5232                     | TCP      | WebUI, caldav |

## Additional
There are some special variables to set.

| Flag        | Usage                                                                  |
| ----------- | ---------------------------------------------------------------------- |
| --read-only | make radicale read-only, caldav can still be changed and used normally |
