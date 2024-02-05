# coturn - coturn

This is a [Docker](/wiki/docker.md) container for a TURN/STUN server.
A server like this can be used in a [Matrix](../matrix.md) server configuration.
The official container and documentation was made by
[coturn](https://github.com/coturn/coturn).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh`, `data/matrix/coturn/turnserver.conf` and `docker-compose.yml` at the
same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.
For the `data/matrix/coturn/turnserver.conf` file change the values for `static-auth-secret`,
`realm`, `cli-password` and `external-ip`.
For the passwords [OpenSSL](/wiki/linux/openssl.md#password-generator) can be used to create a
sufficiently random password.
The value of `external-ip` consists of the local IP (left side) and the public IP (right side).
To get the local IP the command `ip route get 1` can be used.
For the public IP the command `curl api.ipify.org` can be used.


## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `3478`         | `3478`                   | TCP/UDP  | TURN/STUN   |
| `5349`         | `5349`                   | TCP/UDP  | TURN/STUN   |
| `49152-65535`  | `49152-65535`            | UDP      | TURN/STUN   |

## rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull coturn/coturn:latest
docker-compose up -d
```

## docker-compose.yml

```yml
version: "2"
services:
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

## data/matrix/coturn/turnserver.conf

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
