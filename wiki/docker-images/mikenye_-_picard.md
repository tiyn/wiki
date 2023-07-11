# mikenye - airsonic-advanced

This is a [Docker](/wiki/docker.md) container for a
[Picard](/wiki/picard.md) instance accessible over the web and
[VNC](/wiki/vnc.md).
The official container and documentation was made by
[mikenye](https://github.com/mikenye/docker-picard).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment-variables

Set the following variables with the -e tag.

| Name             | Usage               | Default |
| ---------------- | ------------------- | ------- |
| `USER_ID`        | UserID              | `1000`  |
| `GROUP_ID`       | GroupID             | `1000`  |
| `DISPLAY_WIDTH`  | Width of software   | `1280`  |
| `DISPLAY_HEIGHT` | Height of software  | `768`   |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description               |
| ------------------------- | --------------- | ------------------------- |
| `config`                  | `/config`       | Configuration files       |
| `media_music`             | `/storage`      | Location for audio files  |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description                |
| -------------- | ------------------------ | -------- | -------------------------- |
| `5800`         | `5800`                   | TCP      | WebUI                      |
| `5900`         | `5900`                   | TCP      | VNC                        |
| `8000`         | `8000`                   | TCP      | Picard browser integration |

## rebuild.sh

```sh
#!/bin/sh
docker stop picard
docker rm picard
docker pull mikenye/picard
docker run --name=picard \
  --restart unless-stopped \
  -p 5800:5800 \
  -v media_music:/storage:rw \
  -v picard_config:/config:rw \
  -e USER_ID=0 \
  -e GROUP_ID=0 \
  -e DISPLAY_WIDTH=2560 \
  -e DISPLAY_HEIGHT=1440 \
  -d mikenye/picard
```
