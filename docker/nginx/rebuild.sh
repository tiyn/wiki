#!/bin/sh
docker-compose down
docker pull nginx:latest
docker pull certbot/certbot:latest
docker-compose up -d
