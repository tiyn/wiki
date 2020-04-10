#!/bin/sh
docker stop folding-at-home
docker rm folding-at-home
docker pull johnktims/folding-at-home
docker run --name folding-at-home \
	--restart unless-stopped \
	-it \
	-p 7396:7396 \
	-d johnktims/folding-at-home \
	--user=default \
	--power=full \
	--team=000000
