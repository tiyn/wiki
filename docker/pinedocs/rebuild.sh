#!/bin/sh
docker stop pinedocs
docker rm pinedocs
docker pull xy2z/pinedocs
docker run --name pinedocs \
	--restart unless-stopped \
	-p 80:80 \
	-v pinedocs:/data \
	-d xy2z/pinedocs
