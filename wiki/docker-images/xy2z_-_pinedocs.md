# xy2z - pinedocs

The official container and documentation was made by [xy2z](https://hub.docker.com/r/xy2z/pinedocs).

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description          |
| ------------------------- | --------------- | -------------------- |
| `pinedocs`                | `/data`         | storage for pinedocs |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

## Rebuild

```shell
#!/bin/sh
docker stop pinedocs
docker rm pinedocs
docker pull xy2z/pinedocs
docker run --name pinedocs \
    --restart unless-stopped \
    -p 80:80 \
    -v pinedocs:/data \
    -d xy2z/pinedocs
```
