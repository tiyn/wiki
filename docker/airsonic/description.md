# Airsonic
This is a dockerized version of a airsonic server.
The official container and documentation was made by [linuxserver](https://hub.docker.com/r/linuxserver/airsonic).

## Environment-variables
Set the following variables with the -e tag.

| Name | Usage    | Default |
| ---- | -------- | ------- |
| PUID | UserID   |         |
| PGID | GroupID  |         |
| TZ   | Timezone |         |

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description             |
| ---------------- | --------------- | ----------------------- |
| airsonic_config  | /config         | Configuration files     |
| airsonic_media   | /media          | Various other media     |
| media_playlists  | /playlists      | Location for playlists  |
| media_music      | /music          | Location for music      |
| media_audiobooks | /audiobooks     | Location for audiobooks |
| media_podcasts   | /podcasts       | location for podcasts   |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 4040           | 4040                     | TCP      | WebUI       |

