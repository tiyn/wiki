#!/bin/sh
docker stop todo
docker rm todo
docker pull prologic/todo
docker run --name todo \
	-p 8000:8000 \
	--restart unless-stopped \
	-v todo:/go/src/todo/todo.db \
	-d prologic/todo
