# linuxserver – calibre-web

This is a [Docker](/wiki/docker.md) container for a [Calibre-Web](/wiki/calibre.md) server.
The official container and documentation was made by
[linuxserver](https://github.com/linuxserver/docker-calibre-web).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterward.

### Environment-variables

Set the following environment-variables in the `environment:` section.

| Name | Usage | Default |
| ---- | ----- | ------- |
| `PUID` | User ID of the host user | |
| `PGID` | Group ID of the host user | |
| `TZ` | Timezone | |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount | Description |
| ------------------------- | --------------- | ----------- |
| `config` | `/config` | Calibre-Web configuration |
| `books` | `/books` | Calibre library |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8083` | `8083` | TCP | WebUI |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull lscr.io/linuxserver/calibre-web:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "3"

services:
  calibre-web:
    image: lscr.io/linuxserver/calibre-web:latest
    container_name: calibre-web
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Berlin
    volumes:
      - config:/config
      - books:/books
    ports:
      - "8083:8083"
    restart: unless-stopped

volumes:
  config:
  books:
```
