#!/bin/sh
docker stop cups
docker rm cups
docker pull olbat/cupsd:latest
docker run --name cups \
	--restart unless-stopped \
	--net=host \
	-p 631:631 \
	-v /var/run/dbus:/var/run/dbus \
	-v cups:/etc/cups/ \
	-d olbat/cupsd:latest
