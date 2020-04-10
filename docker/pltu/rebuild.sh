#!/bin/sh
docker stop pltu
docker rm pltu
docker pull nasourso/pltu:latest
docker run --name pltu \
	--restart unless-stopped \
	--privileged \
	-p 32400:80 \
	-v pltu:/cert/ \
	-d nasourso/pltu:latest
