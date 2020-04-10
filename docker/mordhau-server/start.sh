#!/bin/sh

docker pull tetricz/mordhau-server
docker run --name=mordhau \
 --restart=unless-stopped \
 -p 27015:27015/udp \
 -p 7777:7777/udp \
 -p 15000:15000/udp \
 -v mordhau:/serverdata/mordhau \
 -v mordhau_steamcmd:/serverdata/steamcmd \
 -e QUERYPORT=27015 \
 -e GAME_PORT=7777 \
 -e BEACONPORT=15000 \
 -e STEAM_CONNECT=True \
 -e STEAMID64="tmp" \
 -e UID=99 \
 -e GID=100 \
 -e GAME_MODE=SKM \
 -e PLAYER_COUNT="16" \
 -e SERVER_NAME="tmp" \
 -e SERVER_PASSWORD="tmp" \
 -e ADMIN_PASSWORD="tmp" \
 tetricz/mordhau-server
