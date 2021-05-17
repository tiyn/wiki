# matrixdotorg - synapse

The official container and documentation was made by
[matrixdotorg](https://hub.docker.com/matrixdotorg/synapse).

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Volume-Name | Container mount | Description                     |
| ----------- | --------------- | ------------------------------- |
| `matrix`    | `/data`         | storage for all homeserver data |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description                       |
| -------------- | ------------------------ | -------- | --------------------------------- |
| `3478`         | `3478`                   | TCP      | TURN over TLS                     |
| `5349`         | `5349`                   | TCP      | TURN over TLS                     |
| `8008`         | `8008`                   | TCP      | standard port for matrix protocol |

## Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull matrixdotorg/synapse
docker-compose up -d
```

## Docker-Compose.yml

```yaml
version: '3.3'

services:
  app:
    image: matrixdotorg/synapse
    restart: always
    volumes:
      - matrix:/data
    ports:
     - "3478:3478"
     - "5349:5349"
     - "8008:8008"
volumes:
    matrix:
        driver: local
```
