#!/bin/sh
docker-compose down
docker pull linuxserver/jellyfin:latest
docker-compose up -d
