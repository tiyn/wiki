# Bind
This is a dockerized version of a bind server.
The official container and documentation was made by [ventz](https://hub.docker.com/r/ventz/bind).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description             |
| ---------------- | --------------- | ----------------------- |
| bind_cache       | /var/cache/bind | cache for dns           |
| bind_etc         | /etc/bind       | configuration for dns   |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description       |
| -------------- | ------------------------ | -------- | ----------------- |
| 53             | 53                       | TCP      | dns protocol port |
| 53             | 53                       | UDP      | dns protocol port |

## Additional
There are some special variables to set.

| Flag  | Usage                                                   |
| ----- | ------------------------------------------------------- |
| --dns | set two of these flags for specific dns forward servers |
