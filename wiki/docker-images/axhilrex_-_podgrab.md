# axhilrex - podgrab

This is a [Docker](/wiki/docker.md) container for a [Podgrab](../podgrab.md)
server.
The official container and documentation was made by
[axhilrex](https://github.com/akhilrex/podgrab).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment-variables

Set the following variables with the -e tag.

| Name       | Usage                         | Default |
| ---------- | ----------------------------- | ------- |
| `PASSWORD` | Password for `podgrab` user   |         |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description             |
| ------------------------- | --------------- | ----------------------- |
| `podgrab_config`          | `/config`       | Configuration files     |
| `media_podcasts`          | `/assets`       | location for podcasts   |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
docker stop podgrab
docker rm podgrab
docker pull akhilrex/podgrab
docker run --name=podgrab \
  --restart unless-stopped \
  -p 8000:8080 \
  -v "media_podcasts:/assets" \
  -v "podgrab_config:/config" \
  -d akhilrex/podgrab
```
