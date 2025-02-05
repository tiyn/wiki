# Matrix

[Matrix](https://matrix.org/) is an open network for secure, decentralized
[communication](/wiki/communication.md).

## Setup

The matrix server is a complex setup of servers and services.
Please note that this configuration is a composition of
[Docker](/wiki/docker.md) images.
Therefore a shared `docker-compose.yml` file is used.
This setup guide follows a modified version of the
[guide by matusnovak](https://gist.github.com/matusnovak/37109e60abe79f4b59fc9fbda10896da).
Furthermore this guide will assume you already have a
[traefik v2.4](./traefik.md) instance setup as described in the
[traefik docker image article](./docker/traefik.md).
The Matrix server created by this article will be able to use federation, VoIP using the
[TURN/STUN protocoll from a self-hosted server](#coturn), screen share and video telephony using
jitsi, [a web client using a self-hosted Element server](#element-web-client) and an
[administration interface thats also self-hosted](#administration-interface).

### DNS Records

You will need to create some [DNS](./dns.md) entries in order for synapse to
function correctly.
Additionally you will need 2 subdomains (this guide will assume you use the
domain `example.com` with the subdomains `matrix` and `synapse`).

Create the following DNS records.

```txt
example.com.        A      <ip of your server>
matrix.             A      <ip of your server>
synapse.            A      <ip of your server>
_matrix._tcp.matrix. <TTL> class SRV 1 10 443 synapse.example.com
```

### Synapse

The docker-image used for the synapse matrix server can be found in the
[docker-image directory](./docker/matrixdotorg_-_synapse.md).
Create the `docker-compose.yml` file at a location of your choice (this guide
will assume and recommend the file lies in a directory called matrix) with the
following contents.

```yml
version: "3.4"

services:
  synapse:
    image: "matrixdotorg/synapse:latest"
    restart: "unless-stopped"
    environment:
      SYNAPSE_CONFIG_DIR: "/data"
      SYNAPSE_CONFIG_PATH: "/data/homeserver.yaml"
      UID: "1000"
      GID: "1000"
      TZ: "Europe/London"
    volumes:
      - synapse:/data
    networks:
      - proxy
    labels:
      - "traefik.enable=true"
      - "traefik.http.services.synapse.loadbalancer.server.port=8008"
      - "traefik.http.routers.synapse.rule=Host(`synapse.example.com`)"
      - "traefik.http.routers.synapse.entrypoints=websecure"

networks:
  proxy:
    external: true

volumes:
  synapse:
    driver: local
```

Now manually create the synapse volume you referenced in this file by running.

```txt
docker volume create matrix_synapse
```

After that you will need to create the basic configuration files for synapse by
running.

```bash
docker run -it --rm \
    -v matrix_synapse:/data \
    -e SYNAPSE_SERVER_NAME=matrix.example.com \
    -e SYNAPSE_REPORT_STATS=no \
    -e UID=1000 \
    -e GID=1000 \
    matrixdotorg/synapse:latest generate
```

If you want to enable/disable registration go to the `homeserver.yaml`
and add the following line either set to `true` or `false`.

```txt
enable_registration: true
```

Additionally create the following lines.

```
federation_ip_range_blacklist:
  - '127.0.0.0/8'
  - '10.0.0.0/8'
  - '172.16.0.0/12'
  - '192.168.0.0/16'
  - '100.64.0.0/10'
  - '169.254.0.0/16'
  - '::1/128'
  - 'fe80::/64'
  - 'fc00::/7'
retention:
  enabled: true
```

If you start the docker container with `docker-compose up` and navigate to
`https://synapse.example.com` you should be redirected to
`https://synapse.example.com/_matrix/static` where a success message should be
given out.
If this is not the case please check your configuration.

Create an admin user in the docker containers shell with the command:
`register_new_matrix_user -c /data/homeserver.yaml https://synapse.example.com`

Finally shut down the container using `docker-compose down` to be able to keep
following the guide (this applies to any following step).

### Nginx

The docker-image used for the nginx instance can be found in the
[docker-image directory](./docker/nginx.md).
For federation to work properly an nginx container is needed aswell.
In the directory containing your `docker-compose.yml` create the file
`data/matrix/nginx/matrix.conf` and fill in the following lines.

```txt
server {
  listen         80 default_server;
  server_name    matrix.example.com;

 # Traefik -> nginx -> synapse
 location /_matrix {
    proxy_pass http://synapse:8008;
    proxy_set_header X-Forwarded-For $remote_addr;
    client_max_body_size 128m;
  }

  location /.well-known/matrix/ {
    root /var/www/;
    default_type application/json;
    add_header Access-Control-Allow-Origin  *;
  }
}
```

Create the file `data/matrix/nginx/www/.well-known/matrix/client` and set the
contents as follows.

```json
{
  "m.homeserver": {
    "base_url": "https://matrix.example.com"
  }
}
```

Create the file `data/matrix/nginx/www/.well-known/matrix/server` and set the
contents as follows.

```json
{
  "m.server": "synapse.example.com:443"
}
```

After that add the following lines in the `service` section in your
`docker-compse.yml`.

```yml
nginx:
    image: "nginx:latest"
    restart: "unless-stopped"
    volumes:
      - "./data/matrix/nginx/matrix.conf:/etc/nginx/conf.d/matrix.conf"
      - ./data/matrix/nginx/www:/var/www/
    networks:
      - proxy
    labels:
      - "traefik.enable=true"
      - "traefik.http.services.matrix.loadbalancer.server.port=80"
      - "traefik.http.routers.martix.rule=Host(`matrix.example.com`)"
      - "traefik.http.routers.matrix.entrypoints=websecure"

```

Now start the container again and navigate to
`https://matrix.example.com/.well-known/matrix/client` which should give you
back something like: `"base_url": "https://matrix.example.com"`.
If you navigate to `https://matrix.example.com/.well-known/matrix/server` you
should see: `"m.server": "synapse.example.com:443"`.
If you navigate to `https://matrix.example.com/_matrix/static/` you should see
the same page as shown at `https://synapse.example.com/_matrix/static/`.

If that works you can try to visit `https://federationtester.matrix.org/` to
check if your federation is working properly.
Your servername is `matrix.example.com` (do not include `https://`).
You should see a green sign that indicates success.

If one of these does not work (but synapse works) your nginx configuration is
not correctly set up.

### Element Web Client

The docker-image used for the web client can be found in the
[docker-image directory](./docker/vectorim_-_riot-web.md).
This section will add a self hosted Matrix web client in form of `Element`
(which was previously called `riot`).

First you will need to create another DNS record.

```txt
chat.            A      <ip of your server>
```

In the directory containing your `docker-compose.yml` file create the file
`data/matrix/element/config.json` with the contents as follows.

```json
{
  "default_server_config": {
    "m.homeserver": {
      "base_url": "https://matrix.example.com",
      "server_name": "matrix.example.com"
    },
    "m.identity_server": {
      "base_url": "https://vector.im"
    }
  },
  "disable_custom_urls": false,
  "disable_guests": false,
  "disable_login_language_selector": false,
  "disable_3pid_login": false,
  "brand": "Element",
  "integrations_ui_url": "https://scalar.vector.im/",
  "integrations_rest_url": "https://scalar.vector.im/api",
  "integrations_widgets_urls": [
    "https://scalar.vector.im/_matrix/integrations/v1",
    "https://scalar.vector.im/api",
    "https://scalar-staging.vector.im/_matrix/integrations/v1",
    "https://scalar-staging.vector.im/api",
    "https://scalar-staging.riot.im/scalar/api"
  ],
  "bug_report_endpoint_url": "https://riot.im/bugreports/submit",
  "defaultCountryCode": "GB",
  "showLabsSettings": false,
  "features": {
    "feature_new_spinner": "labs",
    "feature_pinning": "labs",
    "feature_custom_status": "labs",
    "feature_custom_tags": "labs",
    "feature_state_counters": "labs"
  },
  "default_federate": true,
  "default_theme": "light",
  "roomDirectory": {
    "servers": [
      "matrix.org"
    ]
  },
  "welcomeUserId": "@riot-bot:matrix.org",
  "piwik": {
    "url": "https://piwik.riot.im/",
    "whitelistedHSUrls": [
      "https://matrix.org"
    ],
    "whitelistedISUrls": [
      "https://vector.im",
      "https://matrix.org"
    ],
    "siteId": 1
  },
  "enable_presence_by_hs_url": {
    "https://matrix.org": false,
    "https://matrix-client.matrix.org": false
  },
  "settingDefaults": {
    "breadcrumbs": true
  },
  "jitsi": {
    "preferredDomain": "jitsi.riot.im"
  }
}
```

After that add the following lines to your `docker-compose.yml` in the `service`
section.

```yml
  element:
    image: vectorim/riot-web:latest
    restart: unless-stopped
    volumes:
        - "./data/matrix/element/config.json:/app/config.json:ro"
    networks:
      - proxy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.element-secure.entrypoints=websecure"
      - "traefik.http.routers.element-secure.rule=Host(`chat.example.com`)"
      - "traefik.http.routers.element-secure.service=element"
      - "traefik.http.services.element.loadbalancer.server.port=80"
```

Add the following line to the `homeserver.yaml` of the synapse server to
indicate your element domain.

```txt
web_client_location: https://chat.example.com
```

Start the container.
You should now be able to navigate to `https://chat.example.com` where you are
prompted with a log in window.
If you already created an account you should be able to log in.
If any of that is not working there is something wrong with your configuration.

### Administration Interface

The docker-image used for the administration interface can be found in the
[docker-image directory](./docker/awesometechnologies_-_synapse-admin.md).
This section will add a self hosted Matrix administration interface.
This is especially useful if you have `enable_registration` set to `false`
because you can dynamically create and administrate users and rooms.

First you will need to create another DNS record.

```txt
matrixadmin.            A      <ip of your server>
```

Add the following lines in the `service` section to your `docker-compose.yml`.

```yml
  synapse-admin:
    image: awesometechnologies/synapse-admin:latest
    restart: unless-stopped
    networks:
      - proxy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.synapse-admin-secure.entrypoints=websecure"
      - "traefik.http.routers.synapse-admin-secure.rule=Host(`matrixadmin.example.com`)"
      - "traefik.http.routers.synapse-admin-secure.service=synapse-admin"
      - "traefik.http.services.synapse-admin.loadbalancer.server.port=80"
```

Start the container.
After that you should be able to navigate to `https://matrixadmin.example.com`
and log into the interface with your administration account.
Your `Homeserver URL` in that case is `https://synapse.example.com`.

### Coturn

The docker-image used for the TURN/STUN Server can be found in the
[docker-image directory](./docker/coturn_-_coturn.md).
This section will add a self hosted TURN/STUN VoIP server.

In the directory containing your `docker-compose.yml` create the file
`data/matrix/coturn/turnserver.conf` and fill in the following lines.

```txt
use-auth-secret
static-auth-secret=SomeSecretPasswordForMatrix
realm=matrix.example.com
listening-port=3478
tls-listening-port=5349
min-port=49160
max-port=49200
verbose
allow-loopback-peers
cli-password=SomePasswordForCLI
external-ip=192.168.0.2/123.123.123.123
```

Make sure to change the values for `static-auth-secret`, `realm`, `cli-password` and `external-ip`.
For the passwords [OpenSSL](/wiki/linux/openssl.md#password-generator) can be used to create a
sufficiently random password.
The value of `external-ip` consists of the local IP (left side) and the public IP (right side).
To get the local IP the command `ip route get 1` can be used.
For the public IP the command `curl api.ipify.org` can be used.

Then navigate to the `homeserver.yaml` inside the [Synapse volume](#synapse).
Add the following lines.

```txt
turn_uris:
  - "turn:matrix.example.com:3478?transport=udp"
  - "turn:matrix.example.com:3478?transport=tcp"
  - "turns:matrix.example.com:3478?transport=udp"
  - "turns:matrix.example.com:3478?transport=tcp"

turn_shared_secret: "SomeSecretPasswordForMatrix"
turn_user_lifetime: 86400000
turn_allow_guests: True
```

Change `matrix.example.com` to match the value of `realm` in `data/matrix/coturn/turnserver.conf`.
Do the same for `turn_shared_secret` with the value of `static-auth-secret` in
`data/matrix/coturn/turnserver.conf`.

Finally add the following lines in the `service` section to your `docker-compose.yml`.

```yml
  coturn:
    image: "instrumentisto/coturn:latest"
    restart: "unless-stopped"
    volumes:
      - "./data/matrix/coturn/turnserver.conf:/etc/coturn/turnserver.conf"
    ports:
      - "49160-49200:49160-49200/udp"
      - "3478:3478"
      - "5349:5349"
```

Afterwards if not done already restart the Matrix server and all its services.
