# haugene - transmission-openvpn

This is a [Docker](/wiki/docker.md) container for a
[transmission](../transmission.md) server that is connected to the internet via
an [openVPN tunnel](/wiki/openvpn.md).
The official container and documentation was made by
[haugene](https://github.com/haugene/docker-transmission-openvpn).

## Set-up

Create the file `rebuild.sh`.
To see which providers are supported take a look at the
[official documentation](https://haugene.github.io/docker-transmission-openvpn/supported-providers/).
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following variables with the -e tag.

| Name                | Usage                       | Default |
| ------------------- | --------------------------- | ------- |
| `OPENVPN_PROVIDER`  | Provider for OpenVPN        | ` `     |
| `OPENVPN_USERNAME`  | Username for OpenVPN        | ` `     |
| `OPENVPN_PASSWORD`  | Password for OpenVPN        | ` `     |
| `LOCAL_NETWORK`     | Subnet of the local network | ` `     |
| `CREATE_TUN_DEVICE` | Use a tunnel device         | ` `     |
| `WEBPROXY_ENABLES`  | Use a webproxy              | ` `     |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description             |
| ------------------------- | --------------- | ----------------------- |
| `transmission_config`     | `/config`           | Configuration files     |
| `transmission data`       | `/data`         | Storage for data        |
| `/etc/localtime`          | `/etc/localtime:ro` | Link to the systemtime  |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `9091`         | `9091`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker stop transmission
docker rm transmission
docker pull haugene/transmission-openvpn
docker run --name transmission \
        --restart unless-stopped \
        --cap-add NET_ADMIN \
        -v /etc/localtime:/etc/localtime:ro \
        -v transmission_data:/data \
        -v transmission_config:/config \
        -e OPENVPN_PROVIDER=<vpn provider> \
        -e OPENVPN_CONFIG=<vpn_-_country-udp> \
        -e OPENVPN_USERNAME=<username> \
        -e OPENVPN_PASSWORD=<password> \
        -e LOCAL_NETWORK=192.168.178.0/24 \
        -e CREATE_TUN_DEVICE=true \
        -e WEBPROXY_ENABLES=false \
        --log-driver json-file \
        --log-opt max-size=50m \
        -p 9091:9091 \
        -d haugene/transmission-openvpn
```
