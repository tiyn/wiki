# redis

This is a [Docker](/wiki/docker.md) container for a redis database.
The official container and documentation was made by
[redis](https://hub.docker.com/_/redis).
The Docker container is mainly used in combination with other containers.
To achieve this in the easiest way use a docker-compose file.

## Set-Up

The redis Docker container is dependent on another container most of the time. 
The exact setup will be described in the regarding entry.
Nevertheless both volumes and networks are listed in the sections below.
These are needed most often.

### Volumes


Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount | Description          |
| ------------------------- | --------------- | -------------------- |
| `redis`                   | `/data`         | storage for all data |

### Networks

You can set networks in the `networks:` part of a docker-compose file to connect
the database with other docker containers.
