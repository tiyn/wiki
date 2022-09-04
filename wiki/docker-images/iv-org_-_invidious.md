# iv-org - invidious

This is a docker container for [Invidious](../invidious.md).
The official container and documentation was made by [invidious](https://github.com/iv-org/invidious).
This docker-rebuild is made up by a `docker-compose.yml` file.
There is no official pre-build on docker-hub.

## Set-up for building process

First of all create a folder for your `rebuild.sh`.
After that clone invidious from github into a folder within the just created folder.
Set the variables, volumes and ports according and run the `rebuild.sh`

## Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                   | Usage                                                      | Default |
| ---------------------- | ---------------------------------------------------------- | ------- |
| `channel_threads`      | numer of threads to use for refreshing channels            | `1`     |
| `check_tables`         | check channel integrity                                    | `false` |
| `db: user`             | user of database to access                                 |         |
| `db: password`         | password of database to access                             |         |
| `db: host`             | ip of database to access                                   |         |
| `db: port`             | port of database to access                                 |         |
| `db: dbname`           | name of database to access                                 |         |
| `domain`               | set domain if using a reverse proxy                        |         |
| `feed_threads`         | number of threads to use for refreshing subscription feeds | `1`     |
| `full_refresh`         | refresh all videos of a channel when crawled               | `false` |
| `https_only`           | use this flag to configure https reverse proxies           | `false` |
| `popular_enabled`      | enable the popular section                                 | `true`  |
| `registration_enabled` | enable registration for new users                          | `true`  |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `3000`         | `3000`                   | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
cd invidious
docker-compose down
docker pull postgres:10
docker-compose up -d
cd ..
```

## docker-compose.yml

```yml
version: "3"
services:
  postgres:
    image: postgres:10
    restart: unless-stopped
    volumes:
      - postgresdata:/var/lib/postgresql/data
      - ./config/sql:/config/sql
      - ./docker/init-invidious-db.sh:/docker-entrypoint-initdb.d/init-invidious-db.sh
    environment:
      POSTGRES_DB: invidious
      POSTGRES_PASSWORD: kemal
      POSTGRES_USER: kemal
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]
  invidious:
    build:
      context: .
      dockerfile: docker/Dockerfile
    restart: unless-stopped
    ports:
      - "3000:3000"
    environment:
      # Adapted from ./config/config.yml
      INVIDIOUS_CONFIG: |
        channel_threads: 1
        check_tables: true
        feed_threads: 1
        db:
          user: kemal
          password: kemal
          host: postgres
          port: 5432
          dbname: invidious
        full_refresh: false
        https_only: false
        registration_enabled: false
        popular_enabled: false
        domain: yt.home.server
    depends_on:
      - postgres

volumes:
  postgresdata:
```
