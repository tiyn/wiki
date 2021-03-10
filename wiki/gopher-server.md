# Gopher Server

## Setup with Docker

The official container and documentation was made by [tiynger](https://hub.docker.com/r/tiynger/gopherserver).

### Environment-variables

Set the following variables with the -e tag.

| Name          | Usage                                               | Default     |
| ------------- | --------------------------------------------------- | ----------- |
| `SERVER_NAME` | set this to your IP/Domain (no "gopher://" needed!) | `localhost` |

### Volumes

Set the following volumes with the -v tag.

| Volume-Name    | Container mount | Description                   |
| -------------- | --------------- | ----------------------------- |
| `gopherwebdir` | `/var/gopher`   | directory for the gopher page |

### Ports

Set the following ports with the -p tag.

| Container port | Recommended outside port | Protocol | Description                  |
| -------------- | ------------------------ | -------- | ---------------------------- |
| `70`           | `70`                     | TCP      | port for the gopher-protocol |

### Rebuild

```shell
#!/bin/sh
docker stop gopherserver
docker rm gopherserver
docker pull tiynger/gopherserver
docker run --name gopherserver \
    --restart unless-stopped \
    -p 70:70 \
    -v gopherserver:/var/gopher \
    -e SERVER_NAME='domain.tld' \
    -d tiynger/gopherserver
```
