# kylemanna - openvpn

This is a docker container for an openvpn server.
The official container and documentation was made by [kylemanna](https://hub.docker.com/r/kylemanna/openvpn).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description              |
| ------------------------- | --------------- | ------------------------ |
| `ovpn`                    | `/etc/openvpn`  | storage for openvpn data |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description  |
| -------------- | ------------------------ | -------- | ------------ |
| `1194`         | `1194`                   | UDP      | openvpn port |

## Additional

There are some special variables to set.

| Flag        | Usage                  |
| ----------- | ---------------------- |
| `--cap-add` | add linux capabilities |

## rebuild.sh

```shell
#!/bin/sh
docker stop openvpn
docker rm openvpn
docker pull kylemanna/openvpn
docker run --name openvpn \
    --restart unless-stopped \
    --cap-add=NET_ADMIN \
    -p 1194:1194/udp \
    -v ovpn:/etc/openvpn \
    -d kylemanna/openvpn
```
