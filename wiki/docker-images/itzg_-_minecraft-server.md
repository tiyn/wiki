# itzg - minecraft-server

This is a docker container for a [Minecraft](../games/minecraft.md) server.
The container and documentation was made by [itzg](https://hub.docker.com/r/itzg/minecraft-server).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment-variables

Set the following variables with the -e tag.

| Name          | Usage                                                          | Default                                      |
| ------------- | -------------------------------------------------------------- | -------------------------------------------- |
| `EULA`        | Accept the EULA                                                |                                              |
| `TZ`          | Specify Timezone                                               | `Europe/London`                              |
| `SERVER_NAME` | Specify the Servername                                         |                                              |
| `OPS`         | Specify the admins of the server                               |                                              |
| `WHITELIST`   | Specify allowed users (if none are specified all are accepted) |                                              |
| `ICON`        | Link the Icon of the Server                                    |                                              |
| `MOTD`        | Set the Message of the day                                     | "A Paper Minecraft Server powered by Docker" |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                    |
| ------------------------- | --------------- | ------------------------------ |
| `minecraft`               | `/data`         | location for all relevant data |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol  | Description        |
| -------------- | ------------------------ | --------- | ------------------ |
| `25565`        | `25565`                  | Minecraft | Port for Minecraft |

## rebuild.sh

```shell
#!/bin/sh
docker stop minecraft
docker rm minecraft
docker pull itzg/minecraft-server
docker run --name minecraft \
    --restart unless-stopped \
    -p 25565:25565 \
    -v minecraft:/data \
    -e EULA=TRUE \
    -e TZ=Europe/Berlin \
    -e SERVER_NAME="ServerName" \
    -e OPS=admin1,admin2 \
    -e WHITELIST=user1,user2 \
    -e ICON=https://<path to image> \
    -e MOTD="Message of the day" \
    -d itzg/minecraft-server
```
