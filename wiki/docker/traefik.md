# traefik

This is a [Docker](/wiki/docker.md) container for a traefik edge router.
The official container and documentation was made by
[traefik](https://hub.docker.com/_/traefik).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
In that folder create the directories `data/config`.
Place the files `data/traefik.yml` and `data/config/dynamic.yml` in the
according directories.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount           | Description                             |
| ------------------------- | ------------------------- | --------------------------------------- |
| `/etc/localtime`          | `/etc/localtime:ro`       | get the system time                     |
| `/var/run/docker.sock`    | `/var/run/docker.sock:ro` | get access to view docker container     |
| `./data/traefik.yml`      | `/traefik.yml:ro`         | basic traefik config                    |
| `./data/acme.json`        | `/acme.json`              | place to store certificates for https   |
| `./data/config`           | `/configurations`         | place for dynamically changable configs |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | http        |
| `443`          | `443`                    | TCP      | https       |

## Networks

Set the following networks in the `networks:` section of the docker-compose file.

| Name    | Usage                                  |
| ------- | -------------------------------------- |
| `proxy` | network to expose http and https ports |

## Labels

Set the following labels in the `labels:` section.

```yml
  - "traefik.enable=true"
  - "traefik.docker.network=proxy"
  - "traefik.http.routers.traefik-secure.entrypoints=websecure"
  - "traefik.http.routers.traefik-secure.service=api@internal"
  - "traefik.http.routers.traefik-secure.rule=Host(`traefik.<domain>`)"
  - "traefik.http.routers.traefik-secure.middlewares=user-auth@file"
```

The first five lines are for publishing traefik under `traefik.<domain>`.
The last line is to add authentication.

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull traefik:v2.4
docker-compose up -d
```

## docker-compose.yml

```yml
version: "3"

services:
  traefik:
    image: traefik:v2.4
    container_name: traefik
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    networks:
      - proxy
    ports:
      - 80:80
      - 443:443
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./data/traefik.yml:/traefik.yml:ro
      - ./data/acme.json:/acme.json
      - ./data/config:/configurations
    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=proxy"
      - "traefik.http.routers.traefik-secure.entrypoints=websecure"
      - "traefik.http.routers.traefik-secure.rule=Host(`traefik.<domain>`)"
      - "traefik.http.routers.traefik-secure.service=api@internal"
      - "traefik.http.routers.traefik-secure.middlewares=user-auth@file"

networks:
  proxy:
    external: true

```

## data/traefik.yml

```yml
api:
  dashboard: true

entryPoints:
  web:
    address: :80
    http:
      redirections:
        entryPoint:
          to: websecure

  websecure:
    address: :443
    http:
      middlewares:
        - secureHeaders@file
      tls:
        certResolver: letsencrypt

providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
  file:
    filename: /configurations/dynamic.yml

certificatesResolvers:
  letsencrypt:
    acme:
      email: <email address>
      storage: acme.json
      keyType: EC384
      httpChallenge:
        entryPoint: web
```

## data/config/dynamic.yml

In the config replace `username:htpasswd` with the output of
`echo $(htpasswd -nb <user> <pasword>) | sed -e s/\\$/\\$\\$/g`.

```yml
http:
  middlewares:
    secureHeaders:
      headers:
        sslRedirect: true
        forceSTSHeader: true
        stsIncludeSubdomains: true
        stsPreload: true
        stsSeconds: 31536000

    user-auth:
      basicAuth:
        users:
          - "username:htpasswd"

    redirect-non-www-to-www:
      redirectregex:
        permanent: true
        regex: "^https?://(?:www\\.)?(.+)"
        replacement: "https://www.${1}"

    redirect-www-to-non-www:
      redirectregex:
        permanent: true
        regex: "^https?://www\\.(.+)"
        replacement: "https://${1}"

tls:
  options:
    default:
      cipherSuites:
        - TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
        - TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        - TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
        - TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        - TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305
        - TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305
      minVersion: VersionTLS12
```

The sections called `redirect-non-www-to-www` and `redirect-www-to-non-www` are adapted from a
article by Benjamin Rancourt on his
[website](https://www.benjaminrancourt.ca/how-to-redirect-from-non-www-to-www-with-traefik/).

## Create reverse proxies

To create a reverse proxy from a docker container add the following lines in the
`labels:` section of the `docker-compose.yml` of the service to proxy.

```yml
  - "traefik.enable=true"
  - "traefik.docker.network=proxy"
  - "traefik.http.routers.<service name>-secure.entrypoints=websecure"
  - "traefik.http.routers.<service name>-secure.rule=Host(`<subdomain>.<domain>`)"
  - "traefik.http.routers.<service name>-secure.service=<service name>"
  - "traefik.http.services.<service name>.loadbalancer.server.port=<port>"
```

This configuration automatically redirects http to https.
When using this configuration the port specified in the latter lines can be
ommitted in the `ports:` section if not used directly.
This ensures access only via https and restricts access via ip and port.
Change `<service name>` according to the service you want to publish and `<subdomain>` aswell as
`<domain>` to the domain you intent to publish the service to.
Additionally if you want to redirect domains not starting with `www` to one that does not append
the following line.

```yml
  - "traefik.http.routers.<service name>.middlewares=redirect-non-www-to-www"
```

If the opposite is the case and it should always be redirected to a domain not starting with `www`
add the following line.

```yml
  - "traefik.http.routers.<service name>.middlewares=redirect-www-to-non-www"
```

In both of those cases the line of the first code block in this section that specifies the domain
and subdomain needs to include both the www and the non-www domains.
This should look something like the following

Make sure to add the domain that will be redirected to the labels aswell.
For redirection to www domains this will look something like the following.

```yml
  - "traefik.http.routers.<service name>.rule=Host(`<subdomain>.<domain>`)"
```

In the opposite case the domain will be `www.<subdomain>.<domain>`.

## Setup Mailserver

If setting up a
[docker-mailserver by mailserver](./mailserver_-_docker-mailserver.md) no http
or https is needed.
But a certificate for the mailserver is needed regardless.
In this case add the following lines to the file `docker-compose.yml` in the
`services:` section and adapt them.

```yml
  whoami:
    image: docker.io/traefik/whoami:latest
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.whoami.rule=Host(`<subdomain>.<domain>`)"
```
