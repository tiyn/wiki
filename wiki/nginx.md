# Nginx

## Docker

The easiest way to configure and run nginx is
[ncdt](https://github.com/nasourso/nginx-certbot-docker-tui) by nasourso.
So the first step is downloading it.

`wget https://raw.githubusercontent.com/nasourso/nginx-certbot-docker-tui/master/src/ncdt.sh`

You can just run the script and it will install all needed dependencies.
After that just go ahead and start the container.
You can then configure reverse proxies by adding websites.

### Block remote port access

If you configured a reverse proxy to a port chances are you don't want the port
to be accessed outside of the proxy.
Especially if you set up a authentication over nginx the open port will avoid
the authentication.
This can be changed at the forwarded docker-service by replacing for example
`-p 7000:7000` with `-p 172.17.0.1:7000:7000`.
This forces the docker container to only expose the port in the docker bridge
network, effectively banning remote access.

### Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull nginx:latest
docker pull certbot/certbot:latest
docker-compose up -d
```
