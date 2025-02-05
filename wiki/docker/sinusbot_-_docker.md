# sinusbot - docker

This is a [Docker](/wiki/docker.md) container for a [Sinusbot](/wiki/sinusbot.md).
The Server consists of a single Docker container.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.

The `docker-compose.yml` file includes a network section.
This is only needed if the [Teamspeak](/wiki/teamspeak.md) server is set up on the same machine.
If it is not the network `teamspeak` may be removed.
If it Teamspeak and Sinusbot are set up on the same machine make sure to include the `teamspeak`
network in the [Teamspeak Docker container](/wiki/docker/teamspeak.md) and set an alias.
Include the follwing lines in your teamspeak `docker-compose.yml` file under the `teamspeak3`
service.

```yml
networks:
  teamspeak:
    aliases:
      - ts3.docker.local
```

Add the following lines at the end of the `docker-compose.yml` or add it to the definition of
already existing networks.

```yml
networks:
  teamspeak:
    external: true
```

Finally make sure to create the external network `teamspeak` before starting the containers.
This can be done by running the following command.

```sh
docker network create teamspeak
```

The Teamspeak server can then be found by Sinusbot under host `ts3.docker.local` and port `9987`.

Change the other settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name        | Usage                          | Default |
| ----------- | ------------------------------ | ------- |
| `UID`       | User userid to run gitea       |         |
| `GID`       | User groupid to run gitea      |         |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount         | Description                           |
| ------------------------- | ----------------------- | ------------------------------------- |
| `sinusbot_scripts`        | `/opt/sinusbot/scripts` | storage for the sinusbot scripts      |
| `sinusbot_data`           | `/opt/sinusbot/data`    | storage for the most of sinusbot data |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description            |
| -------------- | ------------------------ | -------- | ---------------------- |
| `8087`         | `8087`                   | TCP      | WebUI                  |

### Networks

Set the following networks in the `networks:` section of the docker-compose file.

| Name        | Usage                        |
| ----------- | ---------------------------- |
| `teamspeak` | connect with local teamspeak |


### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull sinusbot/docker:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "3.3"
services:
  sinusbot:
    image: "sinusbot/docker:latest"
    restart: unless-stopped
    environment:
      - UID=1000
      - GID=1000
    networks:
      - teamspeak
    volumes:
      - sinusbot_scripts:/opt/sinusbot/scripts
      - sinusbot_data:/opt/sinusbot/data

networks:
  teamspeak:
    external: true

volumes:
  sinusbot_scripts:
    driver: local
  sinusbot_data:
    driver: local
```
