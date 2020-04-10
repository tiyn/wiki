# Cups
This is a dockerized version of a cups server.
The official container and documentation was made by [olbat](https://hub.docker.com/r/olbat/cupsd).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                     |
| ---------------- | --------------- | ------------------------------- |
| cups             | /etc/cups       | configuration for printers, etc |
| /var/run/dbus    | /var/run/dbus   | connection to host dbus         |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description        |
| -------------- | ------------------------ | -------- | ------------------ |
| 631            | 631                      | TCP      | cups server  webui |

## Additional
The default username is ```print```, the default password is ```print```.
