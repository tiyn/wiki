# dyonr - jackettvpn

This is a [Docker](/wiki/docker.md) container for a [OpenVPN](/wiki/openvpn.md)
protected [Jackett](/wiki/jackett.md) server.
The official container and documentation was made by
[dyonr](https://github.com/DyonR/docker-Jackettvpn).

## Set-up

Create the file `rebuild.sh` and set `<username>` and `<password>` according to
your openvpn.
Additionally change the `LAN_NETWORK` if it differs for your local area network.
Run `./rebuild.sh` afterwards to create the volumes.
Place the openvpn certificate in the `jacket_config` docker volume inside the
`openvpn` folder.
After that rerun `./rebuild.sh` to make update your config.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description            |
| ------------------------- | --------------- | ---------------------- |
| `jackett_config`          | `/config`       | storage for configs    |
| `jackett_blackhole`       | `/blackhole`    | storage for magnets    |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `9117`         | `9117`                   | TCP      | WebUI       |

## rebuild.sh

```sh
docker stop jackett
docker rm jackett
docker pull dyonr/jackettvpn
docker run --name jackett \
    --restart unless-stopped \
    -p 9117:9117 \
    -v jackett_config:/config \
    -v jackett_blackhole:/blackhole \
    -e "VPN_ENABLED=yes" \
    -e "VPN_TYPE=openvpn" \
    -e "VPN_USERNAME=<username>" \
    -e "VPN_PASSWORD=<password>" \
    -e "LAN_NETWORK=192.168.178.0/24" \
    --privileged \
    -d dyonr/jackettvpn

```
