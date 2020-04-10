#!/bin/sh
docker stop teamspeak3
docker rm teamspeak3
docker pull teamspeak:latest
docker run --name teamspeak3 \
	--restart unless-stopped \
	-p 9987:9987/udp \
	-p 10011:10011 \
	-p 30033:30033 \
	-v teamspeak3:/var/ts3server \
	-e TS3SERVER_LICENSE=accept \
	-d teamspeak:latest
