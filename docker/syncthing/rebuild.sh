#!/bin/sh
docker stop syncthing
docker rm syncthing
docker pull linuxserver/syncthing
docker run --name syncthing \
	--restart unless-stopped \
	-p 8384:8384 \
	-p 22000:22000 \
	-p 21027:21027/udp \
	-v syncthing_config:/config \
	-e PUID=0 \
	-e PGID=0 \
	-e TZ=Europe/Berlin \
	-e UMASK_SET=022 \
	-d linuxserver/syncthing
