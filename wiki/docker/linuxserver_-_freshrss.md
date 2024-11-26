# linuxserver - jellyfin

This is a [Docker](/wiki/docker.md) container for a
[freshrss](https://freshrss.org/) server.
The official container and documentation was made by
[linuxserver](https://docs.linuxserver.io/images/docker-freshrss).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name   | Usage                        | Default |
| ------ | ---------------------------- | ------- |
| `PUID` | Userid to run the container  |         |
| `PGID` | Groupid to run the container |         |
| `TZ`   | specify the timezone         |         |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount | Description                          |
| ------------------------- | --------------- | ------------------------------------ |
| `config`                  | `/config`       | storage for config files of jellyfin |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `7008`         | `80`                     | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull lscr.io/linuxserver/freshrss:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "2.1"
services:
  freshrss:
    image: lscr.io/linuxserver/freshrss:latest
    container_name: freshrss
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/data:/config
    ports:
      - 80:80
    restart: unless-stopped
```
