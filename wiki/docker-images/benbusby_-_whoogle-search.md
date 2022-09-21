# benbusby - whoogle-search

This is a docker container for a [whoogle](../whoogle.md) meta-search machine.
The official container and documentation was made by
[benbusby](https://github.com/benbusby/whoogle-search).

## Set-up

First of all create a folder for your `rebuild.sh`.
After that clone whoogle from
[github](https://github.com/benbusby/whoogle-search) into a folder within the
just created folder.
You can find the `docker-compose.yml` in the cloned directory.
Set the variables, volumes and ports according and run the `rebuild.sh`.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount  | Description      |
| ------------------------- | ---------------- | ---------------- |
| `searx_config`            | `/config`        | configurations   |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `5000`         | `8000`                   | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
cd whoogle-search
docker-compose down
docker-compose up -d
cd ..
```

## docker-compose.yml

```yml
version: "2.2"

services:
  whoogle-search:
    image: ${WHOOGLE_IMAGE:-benbusby/whoogle-search}
    container_name: whoogle-search
    restart: unless-stopped
    user: whoogle
    security_opt:
      - no-new-privileges
    cap_drop:
      - ALL
    tmpfs:
      - /config/:size=10M,uid=927,gid=927,mode=1700
      - /var/lib/tor/:size=15M,uid=927,gid=927,mode=1700
      - /run/tor/:size=1M,uid=927,gid=927,mode=1700
    volumes:
        - config:/config
    ports:
      - 8000:5000

volumes:
    config:
```
