# linuxserver - airsonic-advanced

This is a [Docker](/wiki/docker.md) container for a
[WireGuard](/wiki/wireguard.md) server.
The official container and documentation was made by
[linuxserver](https://hub.docker.com/r/linuxserver/wireguard).

## Set-Up

Create the file `rebuild.sh`.
Change the settings according to your needs.
Especially change `<VPN.SERVERNAME.COM>` to the URL the VPN is accessible at.
If not already done set a port forward or something similar.
`PEERS` is given the number of configs to create for different
[clients](/wiki/wireguard.md#client).
It is also possible to give a list of clients separated by commas
(`first,second,third`) to create.
The following shows the two options.
Then run `./rebuild.sh`

## Usage

### Retrieve Client Certificates by QR-Code

The client certificates can be retrieved with the following command.
`<peer-number>` is the number or identifier of the peer.

```sh
docker exec -it wireguard /app/show-peer <peer-number>
```

After running the command a QR-code should be displayed that describes the
certificate.

## Environment-Variables

Set the following variables with the -e tag.

| Name        | Usage           | Default |
| ----------- | --------------- | ------- |
| `PUID`      | UserID          |         |
| `PGID`      | GroupID         |         |
| `TZ`        | Timezone        |         |
| `SERVERURL` | URL of server   |         |
| `PEERS`     | Number of peers |         |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description             |
| ------------------------- | --------------- | ----------------------- |
| `wireguard`               | `/config`       | Configuration files     |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `51820`        | `51820`                  | UDP      | VPN port    |

## Additional

There are some special variables to set.

| Flag        | Usage                  |
| ----------- | ---------------------- |
| `--cap-add` | add linux capabilities |

## rebuild.sh

```sh
#!/bin/sh
docker stop wireguard
docker rm wireguard
docker pull lscr.io/linuxserver/wireguard:latest
docker run --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e SERVERURL=<VPN.SERVERNAME.COM> \
  -e PEERS=1 \
  -p 51820:51820/udp \
  -v wireguard:/config \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  -d lscr.io/linuxserver/wireguard:latest
```
