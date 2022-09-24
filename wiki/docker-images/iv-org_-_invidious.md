# iv-org - invidious

This is a docker container for [Invidious](../invidious.md).
The official container and documentation was made by [invidious](https://github.com/iv-org/invidious).
This docker-rebuild is made up by a `docker-compose.yml` file.
There is no official pre-build on docker-hub.
In addition to the main container you need to connect a
[postgres container](./postgres.md) to it.

## Set-up

First of all create a folder for your `rebuild.sh`.
After that clone invidious from
[github](https://github.com/iv-org/invidious) into a folder within the
just created folder.
You can find the `docker-compose.yml` in the cloned directory.
Set the variables, volumes and ports according and run the `rebuild.sh`.

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

```sh
#!/bin/sh
cd invidious
docker-compose down
docker pull quay.io/invidious/invidious:latest
docker pull docker.io/library/postgres:14
docker-compose up -d
cd ..
```

## docker-compose.yml

```yml
version: "3"
services:

  invidious:
    image: quay.io/invidious/invidious:latest
    restart: unless-stopped
    ports:
      - "3000:3000"
    environment:
      # Please read the following file for a comprehensive list of all available
      # configuration options and their associated syntax:
      # https://github.com/iv-org/invidious/blob/master/config/config.example.yml
      INVIDIOUS_CONFIG: |
        db:
          dbname: invidious
          user: kemal
          password: kemal
          host: invidious-db
          port: 5432
        check_tables: true
        # external_port:
        domain: sub.domain.tld
        https_only: false
        popular_enabled: false
        #registration_enabled: false
        # statistics_enabled: false
        default_user_preferences:
            dark_mode: true
            default_home: "Subscriptions"
    healthcheck:
      test: wget -nv --tries=1 --spider http://127.0.0.1:3000/api/v1/comments/jNQXAC9IVRw || exit 1
      interval: 30m
      timeout: 5m
      retries: 3
    depends_on:
      - invidious-db

  invidious-db:
    image: docker.io/library/postgres:14
    restart: unless-stopped
    volumes:
      - postgresdata:/var/lib/postgresql/data
      - ./config/sql:/config/sql
      - ./docker/init-invidious-db.sh:/docker-entrypoint-initdb.d/init-invidious-db.sh
    environment:
      POSTGRES_DB: invidious
      POSTGRES_USER: kemal
      POSTGRES_PASSWORD: kemal
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $$POSTGRES_USER -d $$POSTGRES_DB"]

volumes:
  postgresdata:
```
