# b4bz - homer

This is a [Docker](/wiki/docker.md) container for a Homer static site.
The official container and documentation was made by [b4bz](https://hub.docker.com/r/b4bz/homer).

## Set-up

Create the file `rebuild.sh`.
Run `./rebuild.sh` afterwards to create the volumes.
Place the file `config.yml` in the `homer` docker volume and change it to your
needs.
After that rerun `./rebuild.sh` to make update your config.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description            |
| ------------------------- | --------------- | ---------------------- |
| `homer`                   | `/www/assets`   | storage for icons, etc |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
docker stop homer
docker rm homer
docker pull b4bz/homer:latest
docker run --name homer \
    --restart unless-stopped \
    -p 8080:8080 \
    -v homer:/www/assets \
    -d b4bz/homer:latest
```

## config.yml

```yml
title: "tmp"
subtitle: "tmp"
logo: "tmp"
footer: ""

message:
  style: ""
  title: "tmp"
  content: "tmp"

links:
  - name: "tmp"
    icon: "tmp"
    url: "tmp"
    target: "_blank"

services:
  - name: "tmp"
    icon: "tmp"
    items:
      - name: "tmp"
        logo: "tmp"
        subtitle: "tmp"
        tag: "tmp"
        url: "tmp"
        target: "_blank"
```
