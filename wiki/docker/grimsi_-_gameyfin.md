# grimsi - gameyfin

This is a [Docker](/wiki/docker.md) container for a [Gameyfin](/wiki/game/gameyfin.md).

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs.
Create the volume for the configuration files by running the command `docker volume create
gameyfin_config`.
Make sure to run the following command on the config volume `chown -R 1000:root gameyfin_config`.
Afterwards run `./rebuild.sh`.

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                              | Usage                                   | Default |
| --------------------------------- | --------------------------------------- | ------- |
| `GAMEYFIN_USER`                   | user name for gameyfin                  |         |
| `GAMEYFIN_PASSWORD`               | password for gameyfin                   |         |
| `GAMEYFIN_IGDB_API_CLIENT_ID`     | id of twitch internet game database     |         |
| `GAMEYFIN_IGDB_API_CLIENT_SECRET` | secret of twitch internet game database |         |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount         | Description                    |
| ------------------------- | ----------------------- | ------------------------------ |
| `media_games`             | `/opt/gameyfin-library` | storage for games and configs  |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description            |
| -------------- | ------------------------ | -------- | ---------------------- |
| `8080`         | `8093`                   | TCP      | WebUI                  |


### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker-compose up -d
```

### docker-compose.yml

```yml
version: "3"
services:
  gameyfin:
    image: grimsi/gameyfin:latest
    container_name: gameyfin
    environment:
      - GAMEYFIN_USER=admin
      - GAMEYFIN_PASSWORD=admin
      - GAMEYFIN_IGDB_API_CLIENT_ID=id
      - GAMEYFIN_IGDB_API_CLIENT_SECRET=secret
    volumes:
      - media_games:/opt/gameyfin-library
      - config:/opt/gameyfin-library/.gameyfin
    ports:
      - "8093:8080"

volumes:
    media_games:
    config:
```
