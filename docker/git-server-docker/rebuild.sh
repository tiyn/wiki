#!/bin/sh
docker stop git-server
docker rm git-server
docker pull jkarlos/git-server-docker:latest
docker run --name git-server \
	--restart unless-stopped \
	-p 2222:22 \
	-v git-server_repos:/git-server/repos \
	-v git-server_keys:/git-server/keys \
	-d jkarlos/git-server-docker
