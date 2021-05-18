# NextCloud

The official container and documentation was made by [NextCloud](https://hub.docker.com/_/nextcloud).
This docker-rebuild is made up by a `docker-compose.yml` file.
The services in this files are explained seperately.
The main Docker container needs a database in form of a [MariaDB](./mariadb.md)
Docker container.

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name | Container mount | Description                              |
| ----------- | --------------- | ---------------------------------------- |
| `nextcloud` | `/var/www/html` | storage for nextcloud plugins and config |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

## Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull nextcloud:latest
docker pull mariadb:latest
docker-compose up -d
```

## Docker-Compose.yml

```yml
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    restart: always
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=<mysql root password>
      - MYSQL_PASSWORD=<mysql password>
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    image: nextcloud
    restart: always
    ports:
      - 8080:80
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
    environment:
      - MYSQL_PASSWORD=<mysql password>
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db

volumes:
    db:
        driver: local
    nextcloud:
        driver: local

```
