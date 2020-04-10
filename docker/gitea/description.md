# Gitea
This is a dockerized version of an gitea server.
The official container and documentation was made by [gitea](https://hub.docker.com/gitea/gitea).
This docker-rebuild is made up by a ```docker-compose.yml``` file.
The services in this files are explained seperately.

## Gitea

### Environment-variables
Set the following environment-variables in the ```environment:``` section of the docker-compose file.

| Name                | Usage                          | Default |
| ------------------- | ------------------------------ | ------- |
| USER_UID            | User userid to run gitea       |         |
| USER_GID            | User groupid to run gitea      |         |
| DB_TYPE             | Specify database type          |         |
| DB_HOST             | Specify database host and port |         |
| DB_NAME             | Specify Name of the database   |         |
| DB_USER             | Username for the database      |         |
| DB_PASSWD           | Password for the database      |         |


### Volumes
Set the following volumes in the ```volumes:``` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                    |
| ---------------- | ---------------------- | ------------------------------ |
| data             | /data                  | storage for data of git server |
| /etc/timezone    | /etc/timezone:ro       | link timezone                  |
| /etc/localtime   | /etc/localtime         | link localtime                 |

### Ports
Set the following ports in the ```ports:``` section.

| Container Port | Recommended outside port | Protocol | Description            |
| -------------- | ------------------------ | -------- | ---------------------- |
| 3000           | 3000                     | TCP      | WebUI                  |
| 22             | 222                      | TCP      | ssh port of git server |

### Networks
Set the following networks in the ```networks:`` section of the docker-compose file.

| Name  | Usage                 |
| ----- | --------------------- |
| gitea | connect db with gitea |

### Dependencies
Set the following dependencies in the ```depends_on:``` section of the docker-compose file.

| Name  | Usage                 |
| ----- | --------------------- |
| db    | Ensure db is running  |

## MySql

### Environment-variables
Set the following environment-variables in the ```environment:``` section of the docker-compose file.

| Name                | Usage                         | Default |
| ------------------- | ----------------------------- | ------- |
| MYSQL_ROOT_PASSWORD | set the mysql admin password  |         |
| MYSQL_USER          | set the mysql username        |         |
| MYSQL_PASSWORD      | set the mysql user password   |         |
| MYSQL_Database      | specify mysql database to use |         |

### Volumes
Set the following volumes in the ```volumes:``` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| mysql            | /var/lib/mysql         | storage for owncloud data    |

### Networks
Set the following networks in the ```networks:`` section of the docker-compose file.

| Name  | Usage                 |
| ----- | --------------------- |
| gitea | connect db with gitea |
