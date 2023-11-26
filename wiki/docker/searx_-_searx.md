# searx - searx

This is a [Docker](/wiki/docker.md) container for a [searx](../searx.md)
meta-search machine.
The official container and documentation was made by
[searx](https://hub.docker.com/r/searx/searx).

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
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
docker-compose down
docker-compose up -d
```

## docker-compose.yml

```sh
version: "2.1"
services:
  searx:
    image: searx/searx
    volumes:
      - etc:/etc/searx
      - log:/var/log/uwsgi
    restart: unless-stopped
    ports:
      - 8080:8080

volumes:
  etc:
    driver: local
  log:
    driver: local
```
