# linuxserver - lidarr

This is a [Docker](/wiki/docker.md) container for a [Lidarr](/wiki/*arr.md)
server.
The official container and documentation was made by
[linuxserver](https://hub.docker.com/r/linuxserver/lidarr).

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.
It is recommended to set a download completed folder with the same internal and
external mounts as your [BitTorent](/wiki/bittorrent.md) client.
This guide uses the same mounts as used in the
[Transmission](/wiki/transmission.md)
[Docker container](/wiki/docker-images/haugene_-_transmission-openvpn.md).
This namely causes the following line in the
[`docker-compose.yml`](#docker-composeyml).

```txt
      - /var/lib/docker/volumes/transmission_data/_data/completed:/data/completed #optional
```

## Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                  | Usage                       | Default                 |
| --------------------- | --------------------------- | ----------------------- |
| `PUID`                | user id for container user  | `1000`                  |
| `PGID`                | group id for container user | `1000`                  |
| `TZ`                  | specify the timezone        | `Etc/UTC`               |

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount   | Description                       |
| ------------------------- | ----------------- | --------------------------------- |
| `config`                  | `/config`         | directory for config              |
| `complete`                | `/music`          | directory for music               |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description  |
| -------------- | ------------------------ | -------- | ------------ |
| `8686`         | `8686`                   | TCP      | webUI        |

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull lscr.io/linuxserver/lidarr:latest
docker-compose up -d
```

## docker-compose.yml

```yml
version: "2.1"
services:
  lidarr:
    image: lscr.io/linuxserver/lidarr:latest
    container_name: lidarr
    environment:
      - PUID=0
      - PGID=0
      - TZ=Etc/UTC
    volumes:
      - config:/config
      - complete:/music #optional
      - /var/lib/docker/volumes/transmission_data/_data/completed:/data/completed #optional
    ports:
      - 8686:8686
    restart: unless-stopped

volumes:
    config:
        driver: local
    complete:
        driver: local
```
