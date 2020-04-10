#!/bin/sh
docker stop gopherserver
docker rm gopherserver
docker pull tiynger/gopherserver
docker run --name gopherserver \
	--restart unless-stopped \
	-p 70:70 \
	-v gopherserver:/var/gopher \
	-e SERVER_NAME='domain.tld' \
	-d tiynger/gopherserver
