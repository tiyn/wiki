#!/bin/sh
docker stop portainer
docker rm portainer
docker pull portainer/portainer:latest
docker run --name portainer \
	--restart unless-stopped \
	-p 9000:9000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer:/data \
	-d portainer/portainer
