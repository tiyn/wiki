# Pinedocs
This is a dockerized version of a pinedocs site.
The official container and documentation was made by [xy2z](https://hub.docker.com/r/xy2z/pinedocs).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description             |
| ---------------- | --------------- | ----------------------- |
| pinedocs         | /data           | storage for pinedocs    |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 80             | 80                       | TCP      | WebUI       |

