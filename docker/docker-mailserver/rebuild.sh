#!/bin/sh
docker-compose down
docker pull tvial/docker-mailserver:latest
docker-compose up -d
