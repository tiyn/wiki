#!/bin/sh
docker stop portainer_agent
docker rm portainer_agent
docker pull portainer/agent:latest
docker run --name portainer_agent \
	-p 9001:9001 \
	--restart unless-stopped \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/lib/docker/volumes:/var/lib/docker/volumes \
	-d portainer/agent:latest
