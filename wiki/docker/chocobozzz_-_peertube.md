# chocobozz - peertube

This is a [Docker](/wiki/docker.md) container for a [PeerTube](../peertube.md)
server.
The official container and documentation was made by
[chocobozz](https://github.com/chocobozzz/peertube).
This docker-rebuild is made up by a `docker-compose.yml` file.
In addition to the main container you need to connect a
[redis container](./redis.md) to it.

## Set-up

Create the files `rebuild.sh`, `.env` and `docker-compose.yml` at the same
place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `9000`         | `9000`                   | TCP      | WebUI       |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount            | Description            |
| ------------------------- | -------------------------- | ---------------------- |
| `assets`                  | `/app/client/dist`         | storage for icons, etc |
| `config`                  | `/config`                  | configuration data     |
| `data`                    | `/data`                    | further data storage   |

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker-compose up -d
```

## .env

```txt
TZ="Europe/Berlin"

PT_INITIAL_ROOT_PASSWORD=<root password>
PEERTUBE_ADMIN_EMAIL=<admin email>
PEERTUBE_WEBSERVER_HOSTNAME=<domain>
PEERTUBE_WEBSERVER_PORT=<port>



POSTGRES_USER=peertube
POSTGRES_PASSWORD=<postgres password>
POSTGRES_DB=peertube



PEERTUBE_DB_USERNAME=peertube
PEERTUBE_DB_PASSWORD=<db password>
PEERTUBE_DB_SSL=false
PEERTUBE_DB_HOSTNAME=postgres

PEERTUBE_TRUST_PROXY=["127.0.0.1", "loopback", "172.18.0.0/16"]

#  E-mail configuration
PEERTUBE_SMTP_USERNAME=<smtp email>
PEERTUBE_SMTP_PASSWORD=<smtp password>
PEERTUBE_SMTP_HOSTNAME=mail.<domain>
PEERTUBE_SMTP_PORT=587
PEERTUBE_SMTP_FROM=<smtp email>
PEERTUBE_SMTP_TLS=false
PEERTUBE_SMTP_DISABLE_STARTTLS=false
```

## docker-compose.yml

```yml
version: "3.3"

services:

  peertube:
    image: chocobozzz/peertube:production-bullseye
    ports:
        - "9000:9000"
    env_file:
      - .env
    volumes:
      - assets:/app/client/dist
      - data:/data
      - config:/config
    depends_on:
      - postgres
      - redis
    restart: unless-stopped

  postgres:
    image: postgres:13-alpine
    env_file:
      - .env
    volumes:
      - db:/var/lib/postgresql/data
    restart: unless-stopped

  redis:
    image: redis:6-alpine
    volumes:
      - redis:/data
    restart: unless-stopped

volumes:
  assets:
  data:
  config:
  db:
  redis:
```
