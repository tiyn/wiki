# mariadb

This is a [Docker](/wiki/docker.md) container for a mariadb database.
The official container and documentation was made by [mariadb](https://hub.docker.com/_/mariadb).
The Docker container is mainly used in combination with other containers.
To achieve this in the easiest way use a docker-compose file.

## Set-Up

The mariadb Docker container is dependent on another container most of the time. 
The exact setup will be described in the regarding entry.
Nevertheless both environment variables and volumes are listed in the sections below.
Nevertheless both environment variables and volumes and networks are listed in the sections below.
These are needed most often.

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                  | Usage                         | Default |
| --------------------- | ----------------------------- | ------- |
| `MYSQL_ROOT_PASSWORD` | set the mysql admin password  |         |
| `MYSQL_USER`          | set the mysql username        |         |
| `MYSQL_PASSWORD`      | set the mysql user password   |         |
| `MYSQL_Database`      | specify mysql database to use |         |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount  | Description               |
| ------------------------- | ---------------- | ------------------------- |
| `mysql`                   | `/var/lib/mysql` | storage for owncloud data |

### Networks

You can set networks in the `networks:` part of a docker-compose file to connect
the database with other docker containers.
