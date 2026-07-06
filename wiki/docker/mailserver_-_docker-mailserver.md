# mailserver – docker-mailserver

This is a [Docker](/wiki/docker.md) container for a mailserver.
The official container and documentation was made by
[mailserver](https://hub.docker.com/r/mailserver/docker-mailserver).
It contains dovecot, antispam, antivirus, ssl and many more features.

## Set-up

The configuration is done automatically using scripts by mailserver.
First you need to download the essential setup files.

```sh
wget -O .env https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master/compose.env
wget https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master/docker-compose.yml
wget https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master/mailserver.env
wget https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/v9.0.1/setup.sh
chmod a+x ./setup.sh
```

After that you need to edit the `.env` and the `mailserver.env<>` files to
configure the mailserver.

Create the file `rebuild.sh`.
You then need to start the container with the `rebuild.sh` and add email
accounts using the following command.

```sh
./setup.sh email add <user@domain> (<password>)
./setup.sh alias add postmaster@<domain> <user@domain>
```

And finally generate the DCIM keys and rebuild once again.

```
./setup.sh config dkim
```

In later steps the following command can be used to generate DKIM configuration for a given domain –
which in this case is set to the placeholder `<domain>`.

```sh
docker exec mailserver setup config dkim domain '<domain>'
```

Finally, if a reverse proxy is used check the
[traefik entry](/wiki/docker/traefik.md#setup-mailserver) or the [nginx entry](/wiki/nginx.md).

Afterward you're ready to go by once again running the `rebuild.sh` file.

If setting up this mailserver with [Traefik](/wiki/traefik.md) as a reverse proxy some additional
steps should be taken.
No http or https is needed.
But a certificate for the mailserver is needed regardless.
In this case add the following lines to the file `docker-compose.yml` in the
`services:` section and adapt them.

```yml
  whoami:
    image: docker.io/traefik/whoami:latest
    labels:
      – "traefik.enable=true"
      – "traefik.http.routers.whoami.rule=Host(`<subdomain>.<domain>`)"
```

To use the mail server multiple [DNS](/wiki/dns.md) [records](/wiki/dns.md#records) have to be
created.
This process is explained in the
[corresponding section of the email wiki entry](/wiki/email.md#mail-server-records)

For the [DKIM record](/wiki/email.md#dkim-record) the dkim configuration for a given domain has to be 
retrieved.
It can be found in the config directory under the following path.

```txt
config/opendkim/keys/<domain>/mail.txt
```

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull mailserver/docker-mailserver:latest
docker-compose up -d
```
