#!/bin/sh
docker-compose down
docker pull owncloud
docker pull mariadb
docker-compose up -d
