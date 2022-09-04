# rlister - hastebin

This is a docker container for a hastebin server.
The official container and documentation was made by [rlister](https://hub.docker.com/r/rlister/hastebin).

## Environment-variables

Set the following variables with the -e tag.

| Name           | Usage                   | Default |
| -------------- | ----------------------- | ------- |
| `STORAGE_TYPE` | Type to store the datas | `file`  |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                |
| ------------------------- | --------------- | -------------------------- |
| `hastebin`                | `/app/data`     | storage directory for data |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `7777`         | `7777`                   | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker stop hastebin
docker rm hastebin
docker pull rlister/hastebin:latest
docker run --name hastebin \
    --restart unless-stopped \
    -p 7777:7777 \
    -v hastebin:/app/data \
    -e STORAGE_TYPE=file \
    -d rlister/hastebin:latest
```
