# dperson - torproxy

This is a [Docker](/wiki/docker.md) container for a [Tor](../tor.md) proxy.
The container and documentation was made by [dperson](https://hub.docker.com/r/dperson/torproxy).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                |
| ------------------------- | --------------- | -------------------------- |
| `tor_var`                 | `/var/lib/tor`  | Location for various files |
| `tor_etc`                 | `/etc/tor`      | Various other config       |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description          |
| -------------- | ------------------------ | -------- | -------------------- |
| `8118`         | `8118`                   | HTTP     | privoxy web proxy    |
| `9050`         | `9050`                   | SOCKS    | socks protocol proxy |

### rebuild.sh

```sh
#!/bin/sh
docker stop tor-proxy
docker rm tor-proxy
docker pull dperson/torproxy:latest
docker run --name tor-proxy \
        --restart unless-stopped \
        -p 8118:8118 \
        -p 9050:9050 \
        -v tor_var:/var/lib/tor \
        -v tor_etc:/etc/tor \
        -d dperson/torproxy
```
