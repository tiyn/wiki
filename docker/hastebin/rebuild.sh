#!/bin/sh
docker stop hastebin
docker rm hastebin
docker pull rlister/hastebin:latest
docker run --name hastebin \
	--restart unless-stopped \
	-p 7777:7777 \
	-v hastebin:/app/data \
	-e STORAGE_TYPE=file \
	-d rlister/hastebin:latest
