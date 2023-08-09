# searx - searx

This is a [Docker](/wiki/docker.md) container for a [searx](../searx.md)
meta-search machine.
The official container and documentation was made by
[searx](https://hub.docker.com/r/searx/searx).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount  | Description      |
| ------------------------- | ---------------- | ---------------- |
| `searx_etc`               | `/etc/searx`     | storage for etc  |
| `searx_log`               | `/var/log/uwsgi` | storage for logs |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
docker stop searx
docker rm searx
docker pull searx/searx
docker run --name searx \
    --restart unless-stopped \
    -v searx_etc:/etc/searx \
    -v searx_log:/var/log/uwsgi \
    -p 8080:8080 \
    -d searx/searx
```