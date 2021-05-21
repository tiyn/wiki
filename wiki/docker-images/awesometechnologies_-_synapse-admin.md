# awesometechnologies - synapse-admin

The official container and documentation was made by
[awesometechnologies](https://hub.docker.com/awesometechnologies/synapse-admin).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker-compose down
docker pull awesometechnologies/synapse-admin:latest
docker-compose up -d
```

## docker-compose.yml

```yml
version: "2"
services:
  synapse-admin:
    image: awesometechnologies/synapse-admin:latest
    restart: unless-stopped
    ports:
      - 80:80
```
