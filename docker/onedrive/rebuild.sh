#!/bin/sh
docker stop onedrive
docker rm onedrive
docker pull oznu/onedrive:latest
docker run --name onedrive \
	--restart unless-stopped \
	-v onedrive_config:/config \
	-v onedrive_doc:/documents \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-d oznu/onedrive:latest
