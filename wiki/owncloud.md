# Owncloud

## Setup Server with Docker

The official container and documentation was made by [owncloud](https://hub.docker.com/_/owncloud).
This docker-rebuild is made up by a `docker-compose.yml` file.
The services in this files are explained seperately.
The main Docker container needs a database in form of a [MariaDB](./mariadb.md)
Docker container.

### Server: Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name | Container mount        | Description                  |
| ----------- | ---------------------- | ---------------------------- |
| `owncloud`  | `/var/www/html`        | storage for owncloud plugins |
| `config`    | `/var/www/html/config` | storage for owncloud config  |

### Server: Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

### Server: Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull owncloud
docker pull mariadb
docker-compose up -d
```

### Server: Docker-Compose.yml

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

## Setup Client with Docker

The original container and documentation are made by [tiynger](https://hub.docker.com/r/tiynger/owncloudclient)

### Client: Environment-variables

Set the following variables with the -e tag.

| Name       | Usage                                               | Default     |
| ---------- | --------------------------------------------------- | ----------- |
| `USER`     | username of OwnCloud server                         | `admin`     |
| `PASSWORD` | password of OwnCloud server                         | `admin`     |
| `URL`      | url of OwnCloud server (dont forget the http(s)://) | `localhost` |

### Client: Additional

There are some special variables to set.

| Flag                 | Usage                                                      |
| -------------------- | ---------------------------------------------------------- |
| `--opt-log max-size` | prevent log file from growing to large (`50m` recommended) |

### Client: Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                         |
| ----------- | --------------- | ----------------------------------- |
| `data`      | `/data`         | directory for the owncloud contents |

### Client: Rebuild

```shell
#!/bin/sh
docker stop owncloudcli
docker rm owncloudcli
docker pull tiynger/owncloudclient
docker run --name owncloudcli \
    --restart unless-stopped \
    -v owncloudcli:/data \
    -e USER='user' \
    -e PASSWORD='password' \
    -e URL='https://subdomain.domain.tld' \
    --log-opt max-size=50m \
    -d tiynger/owncloudclient
```

## Error handling

### Problems with a locked file

It is possible that you can't remove or move a locked file.
If this problem doesn't resolve after a restart you can try to disable locking
in the owncloud config.
This is done by adding the line `'filelocking.enabled' => false,` into the file `config/config.php`.
Then try to resolve the error.
Afterwards enable locking again by removing the added line.

The reason I choose this process over editing the database file, is ease of use.
The editing of the database is much more time consuming especially if run with docker.
