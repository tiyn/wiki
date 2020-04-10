# Owncloud
This is a dockerized version of an owncloud server.
The official container and documentation was made by [owncloud](https://hub.docker.com/_/owncloud).
This docker-rebuild is made up by a ```docker-compose.yml``` file.
The services in this files are explained seperately.

## Owncloud

### Volumes
Set the following volumes in the ```volumes:``` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| owncloud         | /var/www/html          | storage for owncloud plugins |
| config           | /var/www/html/config   | storage for owncloud config  |

### Ports
Set the following ports in the ```ports:``` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 80             | 80                       | TCP      | WebUI       |

## Maria DB

### Environment-variables
Set the following environment-variables in the ```environment:``` section of the docker-compose file.

| Name                | Usage                        | Default |
| ------------------- | ---------------------------- | ------- |
| MYSQL_ROOT_PASSWORD | set the mysql admin password |         |

### Volumes
Set the following volumes in the ```volumes:``` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| mariadb          | /var/lib/mysql         | storage for owncloud data    |
