#!/bin/sh
docker stop bind
docker rm bind
docker pull ventz/bind:latest
docker run --name bind \
	--restart unless-stopped \
	--dns=1.1.1.1 --dns=8.8.8.8 \
	-p 53:53/udp \
	-p 53:53 \
	-v bind_cache:/var/cache/bind  \
	-v bind_etc:/etc/bind \
	-d ventz/bind:latest
