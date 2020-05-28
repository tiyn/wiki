# Owncloud

## Setup Server

### Docker

The official container and documentation was made by [owncloud](https://hub.docker.com/_/owncloud).
This docker-rebuild is made up by a `docker-compose.yml` file.
The services in this files are explained seperately.

#### Owncloud

##### Volumes
Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| owncloud         | /var/www/html          | storage for owncloud plugins |
| config           | /var/www/html/config   | storage for owncloud config  |

##### Ports
Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 80             | 80                       | TCP      | WebUI       |

#### Maria DB

##### Environment-variables
Set the following environment-variables in the `environment:` section of the docker-compose file.

| Name                | Usage                        | Default |
| ------------------- | ---------------------------- | ------- |
| MYSQL\_ROOT\_PASSWORD | set the mysql admin password |         |

##### Volumes
Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name      | Container mount        | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| mariadb          | /var/lib/mysql         | storage for owncloud data    |

#### Rebuild

```
#!/bin/sh
docker-compose down
docker pull owncloud
docker pull mariadb
docker-compose up -d
```

#### Docker-Compose.yml

```
version: '3.1'

services:

  owncloud:
    image: owncloud
    restart: unless-stopped
    ports:
      - 80:80
    volumes:
      - owncloud:/var/www/html
      - config:/var/www/html/config

  mariadb:
    image: mariadb
    restart: unless-stopped
    environment:
        MYSQL_ROOT_PASSWORD: pass
    volumes:
      - mariadb:/var/lib/mysql

volumes:
  owncloud:
    driver: local
  mariadb:
    driver: local
  config:
    driver: local
```

## Setup Client

### Docker

The original container and documentation are made by [tiynger](https://hub.docker.com/r/tiynger/owncloudclient)

#### Environment-variables
Set the following variables with the -e tag.

| Name		  | Usage                                               | Default   |
| ----------- | --------------------------------------------------- | --------- |
| USER		  | username of OwnCloud server                         | admin     |
| PASSWORD    | password of OwnCloud server                         | admin     |
| URL	      | url of OwnCloud server (dont forget the http(s)://) | localhost |

#### Volumes
Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                         |
| ----------- | --------------- | ----------------------------------- |
| data	      | /data			| directory for the owncloud contents |

#### Rebuild

```
#!/bin/sh
docker stop owncloudcli
docker rm owncloudcli
docker pull tiynger/owncloudclient
docker run --name owncloudcli \
	--restart unless-stopped \
	-v owncloudcli:/data \
	-e USER='user' \
	-e PASSWORD='password' \
	-e URL='https://subdomain.domain.tld' \
	-d tiynger/owncloudclient
```