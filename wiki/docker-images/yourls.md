# yourls

The official container and documentation was made by [yourls](https://hub.docker.com/_/yourls).
In addition to the main container you need to connect a [mySQL container](./mysql.md)
to it.

## Environment-variables

Set the following variables with the -e tag.

| Name             | Usage                      | Default |
| ---------------- | -------------------------- | ------- |
| `YOURLS_DB_PASS` | database password          |         |
| `YOURLS_SITE`    | domain/site name of yourls |         |
| `YOURLS_USER`    | username for yourls admin  |         |
| `YOURLS_PASS`    | password for yourls admin  |         |

## Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description          |
| ----------- | --------------- | -------------------- |
| `yourls`    | `/var/www/html` | yourls specific html |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description       |
| -------------- | ------------------------ | -------- | ----------------- |
| `80`           | `80`                     | TCP      | dns protocol port |

## Rebuild

```shell
#!/bin/sh
docker-compose down
docker-compose up -d
```

## Docker-Compose.yml

```yml
version: "3.1"
services:
  yourls:
    image: yourls
    restart: unless-stopped
    ports:
      - 7006:80
    environment:
      YOURLS_DB_PASS: mysql_pw
      YOURLS_SITE: https://domain.tld
      YOURLS_USER: admin_username
      YOURLS_PASS: admin_password
      YOURLS_PRIVATE: "true"
    volumes:
      - yourls:/var/www/html

  mysql:
    image: mysql:5.7
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: mysql_pw
    volumes:
      - mysql:/var/lib/mysql

volumes:
  yourls:
    driver: local
  mysql:
    driver: local
```
