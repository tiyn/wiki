# vectorim - riot-web

This is a docker container for a [matrix](../matrix.md) client.
The official container and documentation was made by
[linuxserver](https://hub.docker.com/vectorim/riot-web).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount       | Description |
| ------------------------- | --------------------- | ----------- |
| `./config.json`           | `/app/config.json:ro` | config file |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull vectorim/riot-web:latest
docker-compose up -d
```

## docker-compose.yml

```yml
version: "2"
services:
  element:
    image: vectorim/riot-web:latest
    restart: unless-stopped
    volumes:
      - "./data/matrix/element/config.json:/app/config.json:ro"
    ports:
      - 80:80
```
