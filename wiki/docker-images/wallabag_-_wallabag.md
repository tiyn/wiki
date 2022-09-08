# wallabag - wallabag

This is a docker container for a [wallabag](../wallabag.md) server.
The Server consists of 3 Docker containers, one is the wallabag main server, one
is a database and one a redis instance.
In addition to the main container you need to connect a [mariadb container](./mariadb.md)
and a [redis container](./redis.md) to it.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                              | Usage                                    | Default                                  |
| --------------------------------- | ---------------------------------------- | ---------------------------------------- |
| `MYSQL_ROOT_PASSWORD`             | Password for the mySQL root user         |                                          |
| `SYMFONY__ENV__DATABASE_DRIVER`   | Database driver to use                   | `pdo_sqlite`                             |
| `SYMFONY__ENV__DATABASE_HOST`     | Host for database                        | `127.0.0.1`                              |
| `SYMFONY__ENV__DATABASE_PORT`     | Port for database                        |                                          |
| `SYMFONY__ENV__DATABASE_NAME`     | Name for database                        | `symfony`                                |
| `SYMFONY__ENV__DATABASE_USER`     | User for database                        | `root`                                   |
| `SYMFONY__ENV__DATABASE_PASSWORD` | Password for database                    | `~`                                      |
| `SYMFONY__ENV__DATABASE_CHARSET`  | Character set to be used by the database | `utf8`                                   |
| `SYMFONY__ENV__MAILER_HOST`       | SMTP host                                | `127.0.0.1`                              |
| `SYMFONY__ENV__MAILER_USER`       | SMTP user                                | `~`                                      |
| `SYMFONY__ENV__MAILER_PASSWORD`   | SMTP passwort                            | `~`                                      |
| `SYMFONY__ENV__FROM_EMAIL`        | mail address used for outgoing mails     | `wallabag@example.com`                   |
| `SYMFONY__ENV__DOMAIN_NAME`       | URL to wallabag instance                 | `https://your-wallabag-url-instance.com` |
| `SYMFONY__ENV__SERVER_NAME`       | Name for the wallabag server             | `Your wallabag instance`                 |

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount                       | Description                      |
| ------------------------- | ------------------------------------- | -------------------------------- |
| `wallabag_wallabag`       | `/var/www/wallabag/web/assets/images` | storage for wallabag config data |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker-compose down
docker pull wallabag/wallabag:latest
docker pull mariadb:latest
docker pull redis:alpine
docker-compose up -d
```

## docker-compose.yml

```yml
version: '3'
services:
  wallabag:
    image: wallabag/wallabag
    environment:
      - MYSQL_ROOT_PASSWORD=wallaroot
      - SYMFONY__ENV__DATABASE_DRIVER=pdo_mysql
      - SYMFONY__ENV__DATABASE_HOST=db
      - SYMFONY__ENV__DATABASE_PORT=3306
      - SYMFONY__ENV__DATABASE_NAME=wallabag
      - SYMFONY__ENV__DATABASE_USER=wallabag
      - SYMFONY__ENV__DATABASE_PASSWORD=wallapass
      - SYMFONY__ENV__DATABASE_CHARSET=utf8mb4
      - SYMFONY__ENV__MAILER_HOST=127.0.0.1
      - SYMFONY__ENV__MAILER_USER=~
      - SYMFONY__ENV__MAILER_PASSWORD=~
      - SYMFONY__ENV__FROM_EMAIL=wallabag@example.com
      - SYMFONY__ENV__DOMAIN_NAME=https://<wallabag instance>
      - SYMFONY__ENV__SERVER_NAME="Your wallabag instance"
    ports:
        - "8082:80"
    volumes:
      - wallabag_wallabag:/var/www/wallabag/web/assets/images
  db:
    image: mariadb
    environment:
      - MYSQL_ROOT_PASSWORD=wallaroot
    volumes:
      - /opt/wallabag/data:/var/lib/mysql
  db:
    image: mariadb
    environment:
      - MYSQL_ROOT_PASSWORD=wallaroot
    volumes:
      - /opt/wallabag/data:/var/lib/mysql
  redis:
    image: redis:alpine
    volumes:
      - wallabag_redis:/data

volumes:
  wallabag_wallabag:
    driver: local
  wallabag_redis:
    driver: local
```
