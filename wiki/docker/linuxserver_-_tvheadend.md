# linuxserver - tvheadend

This is a [Docker](/wiki/docker.md) container for a [TVHeadend](../tvheadend.md)
server.
The official container and documentation was made by
[linuxserver](https://hub.docker.com/r/linuxserver/tvheadend).

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                  | Usage                       | Default                 |
| --------------------- | --------------------------- | ----------------------- |
| `PUID`                | user id for container user  | `1000`                  |
| `PGID`                | group id for container user | `1000`                  |
| `TZ`                  | specify the timezone        | `Europe/London`         |
| `RUN_OPTS`          | specify the timezone          | ` `                     |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount | Description                       |
| ------------------------- | --------------- | --------------------------------- |
| `config`                  | `/config`       | directory for config              |
| `tvdvr`                   | `/recordings`   | directory for storage             |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description  |
| -------------- | ------------------------ | -------- | ------------ |
| `9981`         | ` `                      | TCP      | webUI        |
| `9982`         | ` `                      | TCP      | HTSP port    |

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull lscr.io/linuxserver/tvheadend:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "2.1"
services:
  tvheadend:
    image: lscr.io/linuxserver/tvheadend:latest
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - config:/config
      - tvdvr:/recordings
    network_mode: "host"
    restart: unless-stopped

volumes:
    config:
    tvdvr:
```
