# owncloud

The official container and documentation was made by [owncloud](https://hub.docker.com/_/owncloud).
This docker-rebuild is made up by a `docker-compose.yml` file.
The services in this files are explained seperately.
The main Docker container needs a database in form of a [MariaDB](./mariadb.md)
Docker container.

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount        | Description                  |
| ------------------------- | ---------------------- | ---------------------------- |
| `owncloud`                | `/var/www/html`        | storage for owncloud plugins |
| `config`                  | `/var/www/html/config` | storage for owncloud config  |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker-compose down
docker pull owncloud
docker pull mariadb
docker-compose up -d
```

## docker-compose.yml

```yml
version: "3.1"

services:
  owncloud:
    image: owncloud
    restart: unless-stopped
    ports:
      - 80:80
    volumes:
      - owncloud:/var/www/html
      - config:/var/www/html/config

  mariadb:
    image: mariadb
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: pass
    volumes:
      - mariadb:/var/lib/mysql

volumes:
  owncloud:
    driver: local
  mariadb:
    driver: local
  config:
    driver: local
```
