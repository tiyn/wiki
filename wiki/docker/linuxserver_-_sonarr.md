# linuxserver - sonarr

This is a [Docker](/wiki/docker.md) container for a [Sonarr](/wiki/*arr.md)
server.
The official container and documentation was made by
[linuxserver](https://hub.docker.com/r/linuxserver/sonarr).

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.
It is recommended to set a download completed folder with the same internal and
external mounts as your [BitTorent](/wiki/bittorrent.md) client.
This guide uses the same mounts as used in the
[Transmission](/wiki/transmission.md)
[Docker container](/wiki/docker/haugene_-_transmission-openvpn.md).
This namely causes the following line in the
[`docker-compose.yml`](#docker-composeyml).

```txt
      - /var/lib/docker/volumes/transmission_data/_data/completed:/data/completed #optional
```

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                  | Usage                       | Default                 |
| --------------------- | --------------------------- | ----------------------- |
| `PUID`                | user id for container user  | `1000`                  |
| `PGID`                | group id for container user | `1000`                  |
| `TZ`                  | specify the timezone        | `Etc/UTC`               |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount   | Description                       |
| ------------------------- | ----------------- | --------------------------------- |
| `config`                  | `/config`         | directory for config              |
| `complete`                | `/tv`             | directory for music               |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description  |
| -------------- | ------------------------ | -------- | ------------ |
| `8989`         | `8989`                   | TCP      | webUI        |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull lscr.io/linuxserver/sonarr:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "2.1"
services:
  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    container_name: sonarr
    environment:
      - PUID=0
      - PGID=0
      - TZ=Etc/UTC
    volumes:
      - config:/config
      - complete:/tv #optional
      - /var/lib/docker/volumes/transmission_data/_data/completed:/data/completed #optional
    ports:
      - 8989:8989
    restart: unless-stopped

volumes:
    config:
        driver: local
    complete:
        driver: local
```
