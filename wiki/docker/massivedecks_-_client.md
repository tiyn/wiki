# massivedecks - client

This is a [Docker](/wiki/docker.md) container for a [Massive Deecks](/wiki/games/massive_decks.md)
client.
Due to ease of use this entry will also feature the server container.
The official container and documentation was made by
[Lattyware](https://github.com/Lattyware/massivedecks).
This docker-rebuild is made up by a `docker-compose.yml` file.
In addition to the client and server containers a [postgres container](/wiki/docker/postgres.md)
needs to be connected.

## Set-up

Create the files `rebuild.sh`, `.env` and `docker-compose.yml` at the same
place.
Make sure to set `POSTGRES_PASSWORD`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name        | Usage                   | Default           |
| ----------- | ----------------------- | ----------------- |
| `NODE_ENV`  | Setting the environment | `production`      |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull postgres:14
docker pull ghcr.io/lattyware/massivedecks/server:latest-release
docker pull ghcr.io/lattyware/massivedecks/client:latest-release
docker-compose up -d
```

### docker-compose.yml

```yml
version: "3.3"
services:
  storage:
    image: "postgres:14"
    restart: unless-stopped
    environment:
      - POSTGRES_USER=massivedecks
      - POSTGRES_PASSWORD=<password>
    networks:
      - internal
    volumes:
      - storage-volume:/var/lib/postgresql/data

  server:
    image: "ghcr.io/lattyware/massivedecks/server:latest-release"
    restart: unless-stopped
    environment:
      - NODE_ENV=production
    depends_on:
      - storage
    networks:
      - internal
    configs:
      - source: md_server_config
        target: /md/config.json5

  client:
    image: "ghcr.io/lattyware/massivedecks/client:latest-release"
    restart: unless-stopped
    depends_on:
      - server
    networks:
      - internal
    ports:
      - "8080:8080"

networks:
  internal:
    external: false

volumes:
  storage-volume:
    driver: local

configs:
  md_server_config:
    external: true
```
