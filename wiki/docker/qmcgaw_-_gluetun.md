# qmcgaw – gluetun

This is a [Docker](/wiki/docker.md) container for a [Gluetun](/wiki/gluetun.md) [VPN](/wiki/vpn.md)
client.
The official container and documentation was made by [qmcgaw](https://github.com/qdm12/gluetun).

## Setup

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterward.

## Environment-variables

Set the following variables with the `-e` tag.

| Name                     | Usage                                        | Default |
| ------------------------ | -------------------------------------------- | ------- |
| `VPN_SERVICE_PROVIDER`   | VPN provider                                 |         |
| `VPN_TYPE`               | VPN type (`wireguard` or `openvpn`)          |         |
| `VPN_ENDPOINT_IP`        | VPN server IP address                        |         |
| `VPN_ENDPOINT_PORT`      | VPN server port                              |         |
| `WIREGUARD_PUBLIC_KEY`   | WireGuard server public key                  |         |
| `WIREGUARD_PRIVATE_KEY`  | WireGuard client private key                 |         |
| `WIREGUARD_ADDRESSES`    | WireGuard client IP address                  |         |
| `HTTPPROXY`              | Enable HTTP proxy                            | `false` |
| `HTTPPROXY_STEALTH`      | Hide proxy-related headers                   | `false` |

## Ports

Set the following ports with the `-p` tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8888`         | `9050`                   | TCP      | HTTP proxy  |

## Capabilities

The following Linux capabilities have to be added.

| Capability |
| ---------- |
| `NET_ADMIN` |

## rebuild.sh

```sh
#!/bin/sh
docker stop gluetun
docker rm gluetun
docker pull qmcgaw/gluetun

docker run --name gluetun \
    --restart unless-stopped \
    --cap-add=NET_ADMIN \
    -e VPN_SERVICE_PROVIDER=custom \
    -e VPN_TYPE=wireguard \
    -e VPN_ENDPOINT_IP="<server-ip>" \
    -e VPN_ENDPOINT_PORT="<server-port>" \
    -e WIREGUARD_PUBLIC_KEY="<public-key>" \
    -e WIREGUARD_PRIVATE_KEY="<private-key>" \
    -e WIREGUARD_ADDRESSES="<client-address>/32" \
    -e HTTPPROXY=true \
    -e HTTPPROXY_STEALTH=true \
    -p 9050:8888 \
    -d qmcgaw/gluetun
```
