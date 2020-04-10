#!/bin/sh
docker stop homer
docker rm homer
docker pull b4bz/homer:latest
docker run --name homer \
	--restart unless-stopped \
	-p 8080:8080 \
	-v /root/docker/homer/config.yml:/www/config.yml \
	-v homer:/www/assets \
	-d b4bz/homer:latest

