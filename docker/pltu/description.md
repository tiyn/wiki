# PLTU
This is a dockerized version of a plex vpn tunnel.
The official container and documentation was made by [nasourso](https://hub.docker.com/r/nasourso/pltu).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                                         |
| ---------------- | --------------- | --------------------------------------------------- |
| pltu             | /cert           | storage for openvpn certificate of server with plex |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 80             | 32400                    | TCP      | Plex webUI  |

## Additional
There are some special variables to set.

| Flag         | Usage                    |
| ------------ | ------------------------ |
| --privileged | is needed due to openvpn |
