# nginx

This is a [Docker](/wiki/docker.md) container for an
[nginx server](../nginx.md).
The official container and documentation was made by
[nginx](https://hub.docker.com/_/nginx).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount      | Description                 |
| ------------------------- | -------------------- | --------------------------- |
| `nginx`                   | `/etc/nginx/conf.d/` | directory for nginx configs |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `80`           | `80`                     | TCP      | http port   |
| `443`          | `443`                    | TCP      | https port  |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull nginx:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "2"
services:
  nginx:
    image: nginx:latest
    restart: unless-stopped
    volumes:
      - nginx:/etc/nginx/conf.d/
    ports:
      - 80:80
      - 443:443

volumes:
  nginx:
    driver: local
```
