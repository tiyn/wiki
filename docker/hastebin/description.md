# Hastebin
This is a dockerized version of a hastebin server.
The official container and documentation was made by [rlister](https://hub.docker.com/r/rlister/hastebin).

## Environment-variables
Set the following variables with the -e tag.

| Name         | Usage                   | Default |
| ------------ | ----------------------- | ------- |
| STORAGE_TYPE | Type to store the datas | file    |

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                |
| ---------------- | --------------- | -------------------------- |
| hastebin         | /app/data       | storage directory for data |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 7777           | 7777                     | TCP      | WebUI       |
