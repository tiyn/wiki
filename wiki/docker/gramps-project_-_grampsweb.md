# gramps-project - gramps

This is a [Docker](/wiki/docker.md) container for a [Gramps](../gramps.md)
server.
The Server consists of 2 Docker containers, one is the gramps main server and one a redis instance.
The main server is split into two subcontainers.
In addition to the main container you need to connect a [redis container](./redis.md) to it.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                                      | Usage                                | Default |
| ----------------------------------------- | ------------------------------------ | ------- |
| `GRAMPSWEB_TREE`                          | Will create a new tree if not exists | ``      |
| `GRAMPSWEB_CELERY_CONFIG__broker_url`     | Redis broker URL                     | ``      |
| `GRAMPSWEB_CELERY_CONFIG__result_backend` | Redis backend URL                    | ``      |
| `GRAMPSWEB_RATELIMIT_STORAGE_URI`         | Storage URI                          | ``      |

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount          | Description                 |
| ------------------------- | ------------------------ | --------------------------- |
| `gramps_users`            | `/app/users`             | storage for users           |
| `gramps_index`            | `/app/indexdir`          | storage for search index    |
| `gramps_thumb_cache`      | `/app/thumbnail_cache`   | storage for thumbnails      |
| `gramps_cache`            | `/app/cache`             | storage for cache           |
| `gramps_secret`           | `/app/users`             | storage for flask secret    |
| `gramps_db`               | `/root/.gramps/grampsdb` | Gramps database             |
| `gramps_media`            | `/app/media`             | storage for media           |
| `gramps_tmp`              | `/tmp`                   | storage for temporary files |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `5000`         | `80`                     | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull ghcr.io/gramps-project/grampsweb:latest
docker pull redis:alpine
docker-compose up -d
```

## docker-compose.yml

```yml
version: "3"

services:
  grampsweb: &grampsweb
    image: ghcr.io/gramps-project/grampsweb:latest
    restart: always
    ports:
      - "5051:5000"  # host:docker
    environment:
      GRAMPSWEB_TREE: "Gramps Web"  # will create a new tree if not exists
      GRAMPSWEB_CELERY_CONFIG__broker_url: "redis://grampsweb_redis:6379/0"
      GRAMPSWEB_CELERY_CONFIG__result_backend: "redis://grampsweb_redis:6379/0"
      GRAMPSWEB_RATELIMIT_STORAGE_URI: redis://grampsweb_redis:6379/1
    depends_on:
      - grampsweb_redis
    volumes:
      - gramps_users:/app/users
      - gramps_index:/app/indexdir
      - gramps_thumb_cache:/app/thumbnail_cache
      - gramps_cache:/app/cache
      - gramps_secret:/app/secret
      - gramps_db:/root/.gramps/grampsdb
      - gramps_media:/app/media
      - gramps_tmp:/tmp

  grampsweb_celery:
    <<: *grampsweb  # YAML merge key copying the entire grampsweb service config
    ports: []
    container_name: grampsweb_celery
    depends_on:
      - grampsweb_redis
    command: celery -A gramps_webapi.celery worker --loglevel=INFO

  grampsweb_redis:
    image: redis:alpine
    container_name: grampsweb_redis
    restart: always
    volumes:
      - redis:/data

volumes:
  gramps_users:
  gramps_index:
  gramps_thumb_cache:
  gramps_cache:
  gramps_secret:
  gramps_db:
  gramps_media:
  gramps_tmp:
  redis:
```
