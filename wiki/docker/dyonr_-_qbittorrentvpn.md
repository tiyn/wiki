# dyonr – qbittorrentvpn

This is a [Docker](/wiki/docker.md) container for a
[qBittorrent](/wiki/qbittorrent.md) server that is connected to the internet via
an [openVPN tunnel](/wiki/openvpn.md).
The official container and documentation was made by
[dyonr](https://github.com/DyonR/docker-qbittorrentvpn).

## Set-up

Create a `rebuild.sh` from the given examples – either for [OpenVPN](#openvpn-rebuildsh) or
[Wireguard](#wireguard-rebuildsh), depending on the desired VPN protocol.
Change the settings according to your needs and run the corresponding script afterward.

For both variants, the default username of the web interface is `admin` and the default password is
`adminadmin`.
Both can be changed in the web interface after setup.

### Environment-variables

Set the following variables with the -e tag.


| Name                | Usage                       | Default |
| ------------------- | --------------------------- | ------- |
| `VPN_ENABLE`        | Enable VPN                  |      |
| `VPN_USERNAME`      | Username for OpenVPN        |      |
| `VPN_PASSWORD`      | Password for OpenVPN        |      |
| `LAN_NETWORK`       | Subnet of the local network |      |


### Volumes

Set the following volumes with the -v tag.


| Outside mount/volume name | Container mount     | Description             |
| ------------------------- | ------------------- | ----------------------- |
| `qbittorrentvpn_config`   | `/config`           | Configuration files     |
| `qbittorrentvpn_data`     | `/downloads`        | Storage for data        |


### Ports

Set the following ports with the -p tag.


| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `9091`         | `8080`                   | TCP      | WebUI       |


### Additional

There are some special variables to set.


| Flag        | Usage                  |
| ----------- | ---------------------- |
| `--cap-add` | add linux capabilities |
| `--device`  | connect devices        |
| `--sysctl`  | configure systemctl    |


### openvpn-rebuild.sh

```sh
#!/bin/sh
docker stop qbittorrentvpn
docker rm qbittorrentvpn
docker pull dyonr/qbittorrentvpn
docker run --name qbittorrentvpn \
        --restart unless-stopped \
        -p 9091:8080 \
        -v qbittorrentvpn_config:/config \
        -v qbittorrentvpn_data:/downloads \
        -e "VPN_ENABLED=yes" \
        -e "VPN_TYPE=openvpn" \
        -e "VPN_USERNAME=username" \
        -e "VPN_PASSWORD=password" \
        -e "LAN_NETWORK=192.168.0.0/16" \
        --cap-add NET_ADMIN \
        --device /dev/net/tun \
        --sysctl "net.ipv4.conf.all.src_valid_mark=1" \
        -d dyonr/qbittorrentvpn
```

### wireguard-rebuild.sh

```sh
#!/bin/sh
docker stop qbittorrentvpn
docker rm qbittorrentvpn
docker pull dyonr/qbittorrentvpn
docker run --name qbittorrentvpn \
        --restart unless-stopped \
        --cap-add NET_ADMIN \
        --sysctl "net.ipv4.conf.all.src_valid_mark=1" \
        --sysctl "net.ipv6.conf.all.disable_ipv6=0" \
        -p 9091:8080 \
        -v qbittorrentvpn_config:/config \
        -v qbittorrentvpn_data:/downloads \
        -e "VPN_ENABLED=yes" \
        -e "VPN_TYPE=wireguard" \
        -e "LAN_NETWORK=192.168.0.0/16" \
        -d dyonr/qbittorrentvpn
```
