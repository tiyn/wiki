# nasourso - nginx-certbot-docker-tui

The official script/image and documentation [nasourso](https://github.com/nasourso/nginx-certbot-docker-tui).
The first step is downloading it.

`wget https://raw.githubusercontent.com/nasourso/nginx-certbot-docker-tui/master/src/ncdt.sh`

You can just run the script and it will install all needed dependencies.
After that just go ahead and start the container.
You can then configure reverse proxies by adding websites.

## rebuild.sh

```shell
#!/bin/sh
docker-compose down
docker pull nginx:latest
docker pull certbot/certbot:latest
docker-compose up -d
```
