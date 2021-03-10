# MariaDB

[MariaDB](https://www.mariadb.com) is an open-source database management system
forked from [mySQL](./mysql.md).

## Setup Server with Docker

The official container and documentation was made by [mariadb](https://hub.docker.com/_/mariadb).
The Docker container is mainly used in combination with other containers.
To achieve this in the easiest way use a docker-compose file

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

| Volume-Name | Container mount  | Description               |
| ----------- | ---------------- | ------------------------- |
| `mysql`     | `/var/lib/mysql` | storage for owncloud data |
