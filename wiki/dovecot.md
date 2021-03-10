# Dovecot

## Setup with Docker

The official container and documentation was made by [tvial](https://hub.docker.com/r/tvial/docker-mailserver).
It contains dovecot, antispam, antivirus, ssl, etc.

The configuration is done automatically using scripts by tvial.
First you need to download the essential setup files.

```shell
curl -o setup.sh https://raw.githubusercontent.com/tomav/docker-mailserver/master/setup.sh; chmod a+x ./setup.sh
curl -o docker-compose.yml https://raw.githubusercontent.com/tomav/docker-mailserver/master/docker-compose.yml.dist
curl -o .env https://raw.githubusercontent.com/tomav/docker-mailserver/master/.env.dist
curl -o env-mailserver https://raw.githubusercontent.com/tomav/docker-mailserver/master/env-mailserver.dist
```

After that you need to edit the `.env` and the `env-mailserver` files to
configure the mailserver.

You then need to start the container with the `rebuild.sh` and add email
accounts using the following command.

`./setup.sh email add <user@domain> (<password>)`

And finally generate the DCIM keys and rebuild once again.

`./setup.sh config dkim`

Afterwards you're ready to go by once again running the `rebuild.sh` file.

### Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull tvial/docker-mailserver:latest
docker-compose up -d
```
