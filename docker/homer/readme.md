# Homer
This is a dockerized version of a homer server.
The official container and documentation was made by [b4bz](https://hub.docker.com/r/b4bz/homer).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name              | Container mount | Description                        |
| ------------------------ | --------------- | ---------------------------------- |
| /current/dir/config.yml | /www/config.yml | configuration file for static page |
| homer                    | /www/assets     | storage for icons, etc             |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 8080           | 8080                     | TCP      | WebUI       |
