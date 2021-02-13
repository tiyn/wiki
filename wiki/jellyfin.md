# Jellyfin

[Jellyfin](https://jellyfin.ord) is a suite for multimedia streaming.
It includes a web-interface.

## Setup Server

### Docker

The official container and documentation was made by [linuxserver](https://hub.docker.com/linuxserver/jellyfin).
This docker-rebuild is made up by a `docker-compose.yml` file.

#### Environment-variables

Set the following environment-variables in the `environment:` section of the docker-compose file.

| Name   | Usage                        | Default |
| ------ | ---------------------------- | ------- |
| `PUID` | Userid to run the container  |         |
| `PGID` | Groupid to run the container |         |
| `TZ`   | specify the timezone         |         |

#### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name     | Container mount | Description                          |
| --------------- | --------------- | ------------------------------------ |
| `config`        | `/config`       | storage for config files of jellyfin |
| `media_movies`  | `/data/movies`  | storage for movies                   |
| `media_tvshows` | `/data/tvshows` | storage for tvshows                  |
| `transcode`     | `/transcode`    | tmp storage to transcode             |

Because it is useful to have the possibility to use the `media_movies` and
`media_tvshows` in multiple containers,
it is recommended to use them as external volumes (volumes section:
`external: true` instead of `driver: local`).
To use the rebuild the volumes have to exist before creating the container
(`docker volume create media_movies` and tvshows accordingly).

#### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8096`         | `8096`                   | TCP      | WebUI       |

#### Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull linuxserver/jellyfin:latest
docker-compose up -d
```

#### Docker-Compose.yml

```yml
version: "2"
services:
  jellyfin:
    image: linuxserver/jellyfin
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Berlin
    volumes:
      - config:/config
      - media_movies:/data/movies
      - media_tvshows:/data/tvshows
      - transcode:/transcode
    ports:
      - 8096:8096
    restart: unless-stopped

volumes:
  config:
    driver: local
  transcode:
    driver: local
  media_movies:
    external: true
  media_tvshows:
    external: true
```

### Add IP-TV

You can add IP-TV under `Live TV` in the administration panel.
To include a m3u IP-TV stream just put the file on the server or copy its URL
and add it under `Live TV`.
After that make sure to setup `DVR` to your liking to record.
