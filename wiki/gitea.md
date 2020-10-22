# Gitea

## Setup Server

### Docker

#### Gitea

##### Environment-variables
Set the following environment-variables in the `environment:` section of the docker-compose file.

| Name                | Usage                          | Default |
| ------------------- | ------------------------------ | ------- |
| USER\_UID            | User userid to run gitea       |         |
| USER\_GID            | User groupid to run gitea      |         |
| DB\_TYPE             | Specify database type          |         |
| DB\_HOST             | Specify database host and port |         |
| DB\_NAME             | Specify Name of the database   |         |
| DB\_USER             | Username for the database      |         |
| DB\_PASSWD           | Password for the database      |         |


##### Volumes
Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                    |
| ---------------- | ---------------------- | ------------------------------ |
| data             | /data                  | storage for data of git server |
| /etc/timezone    | /etc/timezone:ro       | link timezone                  |
| /etc/localtime   | /etc/localtime         | link localtime                 |

##### Ports
Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description            |
| -------------- | ------------------------ | -------- | ---------------------- |
| 3000           | 3000                     | TCP      | WebUI                  |
| 22             | 222                      | TCP      | ssh port of git server |

##### Networks
Set the following networks in the `networks:` section of the docker-compose file.

| Name  | Usage                 |
| ----- | --------------------- |
| gitea | connect db with gitea |

##### Dependencies
Set the following dependencies in the `depends_on:` section of the docker-compose file.

| Name  | Usage                 |
| ----- | --------------------- |
| db    | Ensure db is running  |

#### MySql

##### Environment-variables
Set the following environment-variables in the `environment:` section of the docker-compose file.

| Name                | Usage                         | Default |
| ------------------- | ----------------------------- | ------- |
| MYSQL\_ROOT\_PASSWORD | set the mysql admin password  |         |
| MYSQL\_USER          | set the mysql username        |         |
| MYSQL\_PASSWORD      | set the mysql user password   |         |
| MYSQL\_Database      | specify mysql database to use |         |

##### Volumes
Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| mysql            | /var/lib/mysql         | storage for owncloud data    |

##### Networks
Set the following networks in the `networks:` section of the docker-compose file.

| Name  | Usage                 |
| ----- | --------------------- |
| gitea | connect db with gitea |

#### Rebuild

```
#!/bin/sh
docker-compose down
docker-compose up -d
```

#### Docker-Compose.yml

```
version: "2"

networks:
    gitea:
        external: false

services:
    server:
        image: gitea/gitea:latest
        environment:
            - USER_UID=1000
            - USER_GID=1000
              - DB_TYPE=mysql
              - DB_HOST=db:3306
              - DB_NAME=gitea
              - DB_USER=gitea
              - DB_PASSWD=gitea
        restart: unless-stopped
        networks:
            - gitea
        volumes:
            - data:/data
            - /etc/timezone:/etc/timezone:ro
            - /etc/localtime:/etc/localtime:ro
        ports:
            - "3000:3000"
            - "222:22"
        depends_on:
            - db
    db:
        image: mysql:5.7
        restart: unless-stopped
        environment:
            - MYSQL_ROOT_PASSWORD=gitea
            - MYSQL_USER=gitea
            - MYSQL_PASSWORD=gitea
            - MYSQL_DATABASE=gitea
        networks:
            - gitea
        volumes:
            - mysql:/var/lib/mysql

volumes:
    data:
        driver: local
    mysql:
        driver: local
```
