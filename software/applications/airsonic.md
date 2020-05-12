# Airsonic

## Setup Server

### Docker

The official container and documentation was made by [linuxserver](https://hub.docker.com/r/linuxserver/airsonic).

#### Environment-variables

Set the following variables with the -e tag.

| Name | Usage    | Default |
| ---- | -------- | ------- |
| PUID | UserID   |         |
| PGID | GroupID  |         |
| TZ   | Timezone |         |

#### Volumes

Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description             |
| ---------------- | --------------- | ----------------------- |
| airsonic\_config  | /config         | Configuration files     |
| airsonic\_media   | /media          | Various other media     |
| media\_playlists  | /playlists      | Location for playlists  |
| media\_music      | /music          | Location for music      |
| media\_audiobooks | /audiobooks     | Location for audiobooks |
| media\_podcasts   | /podcasts       | location for podcasts   |

#### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 4040           | 4040                     | TCP      | WebUI       |

#### Rebuild

```
#!/bin/sh
docker stop airsonic
docker rm airsonic
docker pull linuxserver/airsonic
docker run --name=airsonic \
	--restart unless-stopped \
	-p 4040:4040 \
	-v airsonic_config:/config \
	-v airsonic_media:/media \
	-v media_playlists:/playlists \
	-v media_music:/music \
	-v media_audiobooks:/audiobooks \
	-v media_podcasts:/podcasts \
	-e PUID=0 \
	-e PGID=0 \
	-e TZ=Europe/Berlin \
	-d linuxserver/airsonic
```
