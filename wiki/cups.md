# Cups

## Setup Server

### Docker

The official container and documentation was made by [olbat](https://hub.docker.com/r/olbat/cupsd).

#### Volumes

Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                     |
| ---------------- | --------------- | ------------------------------- |
| cups             | /etc/cups       | configuration for printers, etc |
| /var/run/dbus    | /var/run/dbus   | connection to host dbus         |

#### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description        |
| -------------- | ------------------------ | -------- | ------------------ |
| 631            | 631                      | TCP      | cups server  webui |

#### Additional

The default username is `print`, the default password is `print`.

#### Rebuild

```shell
#!/bin/sh
docker stop cups
docker rm cups
docker pull olbat/cupsd:latest
docker run --name cups \
        --restart unless-stopped \
        --net=host \
        -p 631:631 \
        -v /var/run/dbus:/var/run/dbus \
        -v cups:/etc/cups/ \
        -d olbat/cupsd:latest
```

## Client Setup

- Install the cups-client package (in Arch Linux it is included in `cups`)
- Edit `/etc/cups/client.conf` and insert `ServerName <ip to print-server>:631`
- Restart the cups service: `systemctl restart cups`
- Test connectivity: `lpstat -r`
- Check the detected printers with: `lpstat -v`
