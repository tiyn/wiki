# Nginx

## Server

A server can be setup via docker with the [nasourso image](./docker-images/nasourso_-_nginx-certbot-docker-tui.md).

### Block remote port access

If you configured a reverse proxy to a port chances are you don't want the port
to be accessed outside of the proxy.
Especially if you set up a authentication over nginx the open port will avoid
the authentication.
This can be changed at the forwarded docker-service by replacing for example
`-p 7000:7000` with `-p 172.17.0.1:7000:7000`.
This forces the docker container to only expose the port in the docker bridge
network, effectively banning remote access.
