#/bin/sh
docker stop radicale
docker rm radicale
docker pull tomsquest/docker-radicale:2.1.11.4
docker run --name radicale \
	--restart unless-stopped \
	--read-only \
    -p 5232:5232 \
    -v radicale_data:/data \
	-v radicale_config:/config \
    -d tomsquest/docker-radicale:2.1.11.4
