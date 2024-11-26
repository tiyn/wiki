# tombursch - kitchenowl

This is a [Docker](/wiki/docker.md) container for a [kitchenowl](/wiki/kitchenowl.md)
server.
The official container and documentation was made by
[tombursch](https://github.com/tombursch/kitchenowl).
This docker-rebuild is made up by a `docker-compose.yml` file.
The Server consists of two Docker containers, one is the kitchenowl frontend, another is a backend.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same
place.
Make sure to change `JWT_SECRET_KEY`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `7890`         | `80`                     | TCP      | WebUI       |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount            | Description              |
| ------------------------- | -------------------------- | ------------------------ |
| `kitchenowl_data`         | `/data`                    | storage for all data     |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull tombursch/kitchenowl-web:latest
docker pull tombursch/kitchenowl:latest
docker-compose up -d
```

### docker-compose.yml

```yml
version: "3"
services:
  kitchenowl:
    image: tombursch/kitchenowl-web:latest
    restart: unless-stopped
    depends_on:
      - back
    ports:
      - 7890:80
  back:
    image: tombursch/kitchenowl:latest
    restart: unless-stopped
    environment:
      - JWT_SECRET_KEY=changethis
    volumes:
      - kitchenowl_data:/data

volumes:
  kitchenowl_data:
    driver: local
```
