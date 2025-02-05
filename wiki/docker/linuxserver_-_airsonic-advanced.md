# linuxserver - airsonic-advanced

This is a [Docker](/wiki/docker.md) container for a
[Airsonic-Advanced](../airsonic-advanced.md) server.
The official container and documentation was made by
[linuxserver](https://github.com/linuxserver/docker-airsonic-advanced).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following variables with the -e tag.

| Name   | Usage    | Default |
| ------ | -------- | ------- |
| `PUID` | UserID   |         |
| `PGID` | GroupID  |         |
| `TZ`   | Timezone |         |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description             |
| ------------------------- | --------------- | ----------------------- |
| `airsonicadv_config`      | `/config`       | Configuration files     |
| `airsonic_media`          | `/media`        | Various other media     |
| `media_playlists`         | `/playlists`    | Location for playlists  |
| `media_music`             | `/music`        | Location for music      |
| `media_audiobooks`        | `/audiobooks`   | Location for audiobooks |
| `media_podcasts`          | `/podcasts`     | location for podcasts   |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `4040`         | `4040`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker stop airsonicadv
docker rm airsonicadv
docker pull lscr.io/linuxserver/airsonic-advanced:latest
docker run --name=airsonicadv \
  --restart unless-stopped \
  -p 4040:4040 \
  -v airsonicadv_config:/config \
  -v media_music:/music \
  -v media_playlists:/playlists \
  -v media_podcasts:/podcasts \
  -v media_audiobooks:/media \
  -e PUID=0 \
  -e PGID=0 \
  -e TZ=Europe/Berlin \
  -d lscr.io/linuxserver/airsonic-advanced:latest
```
