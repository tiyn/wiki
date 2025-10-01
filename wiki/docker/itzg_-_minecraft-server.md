# itzg - minecraft-server

This is a [Docker](/wiki/docker.md) container for a
[Minecraft](/wiki/games/minecraft.md) server.
The container and documentation was made by
[itzg](https://hub.docker.com/r/itzg/minecraft-server).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

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

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                    |
| ------------------------- | --------------- | ------------------------------ |
| `minecraft`               | `/data`         | location for all relevant data |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol  | Description        |
| -------------- | ------------------------ | --------- | ------------------ |
| `25565`        | `25565`                  | Minecraft | Port for Minecraft |

### rebuild.sh

```sh
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

## Usage

This section addresses the usage of the minecraft-server container.

### Installing Mods

Mods can be installed as described in the
[corresponding article of the official documentation](https://github.com/itzg/docker-minecraft-server/blob/master/docs/mods-and-plugins/index.md).
For this set the server type by using the `-e TYPE=<type>` flag.
`<type>` is the API that is used as the core library.
Most notably this value could be `FABRIC` or `FORGE`.
After this the mods (as `.jar` files) can be placed in the `mods` directory of the
[Docker](/wiki/docker.md) volume.
Afterwards run the [`rebuild.sh`](#rebuildsh) to restart the server with loaded mods.

#### Installing Datapacks

The installation of datapacks is done similar to the described process in the
[corresponding section of the minecraft entry](/wiki/games/minecraft.md#installing-datapacks).
The only difference is the path to place the `.zip` datapack files in which is `world/datapacks` in
case of this [Docker](/wiki/docker.md) image.
