# mailserver – docker-mailserver

This is a [Docker](/wiki/docker.md) container for a mailserver.
The official container and documentation was made by
[mailserver](https://hub.docker.com/r/mailserver/docker-mailserver).
It contains dovecot, antispam, antivirus, ssl and many more features.

## Set-up

This section addresses the set-up of the docker-mailserver [Docker](/wiki/docker.md) container.

### Download

The configuration is done automatically using scripts by mailserver.
First you need to download the essential setup files.

```sh
wget -O .env https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master/compose.env
wget https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master/docker-compose.yml
wget https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master/mailserver.env
wget https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/v9.0.1/setup.sh
chmod a+x ./setup.sh
```

After that you need to edit the `docker-compose.yml` and the `mailserver.env` files to configure the
mailserver.

### Initial configuration

Create the file `rebuild.sh`.
You then need to start the container using `rebuild.sh`.

After the container is running create the desired mail accounts where `<user@domain>` is the desired
email account consisting of its parts and `<password>` is the password.
It is recommended to create a postmaster account aswell.
It can be either created as a secondary account or just linked to the first account as shown in the
following lines.

```sh
./setup.sh email add <user@domain.tld> (<password>)
./setup.sh alias add postmaster@<domain> <user@domain.tld>
```

Then generate the DKIM keys.

```sh
./setup.sh config dkim
```

Finally rebuild the container once again.

The required DNS configuration is explained in the
[corresponding section of the email wiki entry](/wiki/email.md#mail-server-records).
This needs to be set up for the email to work properly with most other providers.

For the DKIM record the generated configuration has to be retrieved from the following file.

```txt
config/opendkim/keys/<domain>/mail.txt
```

Afterward run the `rebuild.sh` file again.

### Reverse proxy

If setting up this mailserver with [Traefik](/wiki/traefik.md) as a reverse proxy some additional
steps should be taken.

Although SMTP, IMAP and POP3 do not pass through [Traefik](/wiki/traefik.md), a TLS certificate is
still required.
A simple way to automatically obtain and renew such a certificate is to expose a temporary HTTP
service.
In this case a simple [Traefik](/wiki/traefik.md) `whoami` container is used.

For a single mail domain the following service is sufficient.
In this case add the following lines to the file `docker-compose.yml` in the `services:` section and
adapt them according to your needs.

```yml
whoami:
  image: docker.io/traefik/whoami:latest
  networks:
    - proxy
  labels:
    - "traefik.enable=true"
    - "traefik.http.routers.whoami.rule=Host(`mail.<domain>`)"
    - "traefik.http.routers.whoami.tls=true"
    - "traefik.http.routers.whoami.tls.certresolver=letsencrypt"
```

The mailserver itself does not use this service.
It merely causes [Traefik](/wiki/traefik.md) to request and automatically renew the TLS certificate.

### Optional: Multiple Mail Domains

Multiple independent mail domains can share a single mailserver instance.
In this setup only one TLS certificate is used, containing all mail hostnames as Subject Alternative
Names (SANs).

For two domains the configuration could look as follows.

```yml
whoami:
  image: docker.io/traefik/whoami:latest
  networks:
    - proxy
  labels:
    - "traefik.enable=true"
    - "traefik.http.routers.whoami.rule=Host(`mail.example.com`) || Host(`mail.example.org`)"
    - "traefik.http.routers.whoami.tls=true"
    - "traefik.http.routers.whoami.tls.certresolver=letsencrypt"
    - "traefik.http.routers.whoami.tls.domains[0].main=mail.example.com"
    - "traefik.http.routers.whoami.tls.domains[0].sans=mail.example.org"
```

For three domains simply extend both the router rule and the SAN list.

```yml
- "traefik.http.routers.whoami.rule=Host(`mail.example.com`) || Host(`mail.example.org`) || Host(`mail.example.net`)"
- "traefik.http.routers.whoami.tls.domains[0].main=mail.example.com"
- "traefik.http.routers.whoami.tls.domains[0].sans=mail.example.org,mail.example.net"
```

[Traefik](/wiki/traefik.md) will then obtain a single certificate with the following names and keep
it updated in the future.

- `mail.example.com` as the Common Name (CN)
- `mail.example.org` as a Subject Alternative Name (SAN)
- `mail.example.net` as a Subject Alternative Name (SAN)

This single certificate is used by the mailserver for all configured mail domains.

For every additional domain  a DKIM key has to be generated.

```sh
docker exec mailserver setup config dkim domain '<domain>'
```

The required DNS records described in the
[corresponding section of the Email entry](/wiki/email.md#mail-server-records) also have to be
created as previously shown in [the previous section](#initial-configuration).

After that mail addresses for the additional domains can simply be created and used.
No further setup is needed and emails using the new domains can simply be created.

```sh
./setup.sh email add <user@domain.tld> (<password>)
```

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull mailserver/docker-mailserver:latest
docker-compose up -d
```
