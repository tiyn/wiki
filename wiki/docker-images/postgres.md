# Postgres

The official container and documentation was made by [Postgres](https://hub.docker.com/_/postgres).
The Docker container is mainly used in combination with other containers.
To achieve this in the easiest way use a docker-compose file

## Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                     | Usage                         | Default |
| ------------------------ | ----------------------------- | ------- |
| `POSTGRES_ROOT_PASSWORD` | set the postgres admin password  |         |
| `POSTGRES_USER`          | set the postgres username        |         |
| `POSTGRES_PASSWORD`      | set the postgres user password   |         |
| `POSTGRES_DB`            | specify postgres database to use |         |

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name       | Container mount            | Description                  |
| ----------------- | -------------------------- | ---------------------------- |
| `postgres`        | `/var/lib/postgresql/data` | storage for owncloud data    |
| `postgres_config` | `/config/sql`              | initial sql setup and config |

## Networks

You can set networks in the `networks:` part of a docker-compose file to connect
the database with other docker containers.
