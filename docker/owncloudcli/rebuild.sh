#!/bin/sh
docker stop owncloudcli
docker rm owncloudcli
docker pull tiynger/owncloudclient
docker run --name owncloudcli \
	--restart unless-stopped \
	-v owncloudcli:/data \
	-e USER='user' \
	-e PASSWORD='password' \
	-e URL='https://subdomain.domain.tld' \
	-d tiynger/owncloudclient
