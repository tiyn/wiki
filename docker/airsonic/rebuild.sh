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
