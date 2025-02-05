# alexta69 - metube

This is a [Docker](/wiki/docker.md) container for a [MeTube](/wiki/metube.md)
server.
The official container and documentation was made by
[alexta69](https://github.com/alexta69/metube).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount | Description                          |
| ------------------------- | --------------- | ------------------------------------ |
| `downloads`               | `/downloads`    | folder to download data to           |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8881`         | `8081`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull vim alexta69/metube
docker-compose up -d
```

### docker-compose.yml

```yml
version: "3"
services:
  metube:
    image: alexta69/metube
    restart: unless-stopped
    ports:
      - "8881:8081"
    volumes:
      - downloads:/downloads

volumes:
    downloads:
        driver: local
```
