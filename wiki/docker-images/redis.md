# redis

This is a [Docker](/wiki/docker.md) container for a redis database.
The official container and documentation was made by
[redis](https://hub.docker.com/_/redis).
The Docker container is mainly used in combination with other containers.
To achieve this in the easiest way use a docker-compose file.

## Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount | Description          |
| ------------------------- | --------------- | -------------------- |
| `redis`                   | `/data`         | storage for all data |
