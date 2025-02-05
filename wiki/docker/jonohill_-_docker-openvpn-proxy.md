# jonohill - docker-openvpn-proxy

This is a [Docker](/wiki/docker.md) container for an
[OpenVPN proxy](/wiki/openvpn.md#proxy).
The official container and documentation was made by
[jonohill](https://github.com/jonohill/docker-openvpn-proxy).

## Set-Up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description              |
| ------------------------- | --------------- | ------------------------ |
| `ovpn-proxy`              | `/config`       | storage for openvpn data |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description  |
| -------------- | ------------------------ | -------- | ------------ |
| `9050`         | `8080`                   | HTTP     | proxy port   |

### Environment-Variables

Set the following variables with the -e tag.

| Name                | Usage                       | Default |
| ------------------- | --------------------------- | ------- |
| `LOCAL_NETWORK`     | Set local network subnet    | ` `     |
| `OPENVPN_USERNAME`  | username for OpenVPN        | ` `     |
| `OPENVPN_PASSWORD`  | password for OpenVPN        | ` `     |

### Additional

There are some special variables to set.

| Flag                                       | Usage                  |
| ----------- | ---------------------- |
| `--cap-add` | add linux capabilities |
| `--device`  | connect devices        |
| `--sysctl`  | configure systemctl    |

### rebuild.sh

```sh
#!/bin/sh
docker stop openvpn-proxy
docker rm openvpn-proxy
docker pull jonoh/openvpn-proxy
docker run --name openvpn-proxy \
        --restart unless-stopped \
        -p "9050:8080" \
        -v "openvpn-proxy:/config" \
        -e LOCAL_NETWORK=192.168.178.0/24 \
        -e OPENVPN_USERNAME="<OVPN_USERNAME>" \
        -e OPENVPN_PASSWORD="<OVPN_PASSWORD>" \
        --cap-add=NET_ADMIN \
        --device /dev/net/tun \
        --sysctl net.ipv6.conf.all.disable_ipv6=0 \
        -d jonoh/openvpn-proxy

```
