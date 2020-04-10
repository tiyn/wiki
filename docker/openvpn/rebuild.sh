#!/bin/sh
docker stop openvpn
docker rm openvpn
docker pull kylemanna/openvpn
docker run --name openvpn \
	--restart unless-stopped \
	--cap-add=NET_ADMIN \
	-p 1194:1194/udp \
	-v ovpn:/etc/openvpn \
	-d kylemanna/openvpn
