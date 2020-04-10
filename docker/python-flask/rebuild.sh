#!/bin/sh
docker stop python-flask
docker rm python-flask
docker pull tiynger/pythonflask:latest
docker run --name python-flask \
	--restart unless-stopped \
	-p "5000:5000" \
	-v python-flask:/flask \
	-d tiynger/pythonflask:latest
