#!/bin/sh
docker stop gopheroverhttp
docker rm gopheroverhttp
docker pull prologic/gopherproxy
docker run --name gopheroverhttp \
	--restart unless-stopped \
	-p 8000:8000 \
	-d prologic/gopherproxy \
	-uri 'domain.tld'
