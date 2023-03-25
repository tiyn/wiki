# kylemanna - openvpn

This is a [Docker](/wiki/docker.md) container for an
[OpenVPN server](/wiki/vpn.md).
The official container and documentation was made by
[kylemanna](https://hub.docker.com/r/kylemanna/openvpn).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs.

Then run the following commands.
Change `<VPN.SERVERNAME.COM>` to the URL the VPN is accessible at.
If not already done set a port forward or something similar.

```sh
docker volume create --name openvpn
docker run -v openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://<VPN.SERVERNAME.COM>
docker run -v openvpn:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
```

Afterwards run `./rebuild.sh`.

## Usage

### Create Certificates

Each device that connects to the [OpenVPN](/wiki/vpn.md#openvpn) server should
have a certificate to connect by.
Create a certificate and retrieve it by running the following commands.
Change all occurences of `<CLIENTNAME>` to the name of the client.

```sh
docker run -v openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full <CLIENTNAME> nopass
docker run -v openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient <CLIENTNAME> > <CLIENTNAME>.ovpn
```

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

```sh
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
