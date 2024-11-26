# bbilly1 - tubearchivist

This is a [Docker](/wiki/docker.md) container for a [TubeArchivist](/wiki/tubearchivist.md)
server.
The Server consists of 3 Docker containers, one is the TubeArchivist main server, another is a
TubeArchivist specific version of Elasticsearch and one a [redis](/wiki/docker/redis.md) instance.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

The following table lists the environment variables for the image `bbilly1/tubearchivist`.

| Name               | Usage                                       | Default |
| -------------------| ------------------------------------------- | ------- |
| `ES_URL`           | Network address for elastic search instance | ``      |
| `REDIS_HOST`       | Redis broker URL                            | ``      |
| `HOST_UID`         | User ID of Host                             | ``      |
| `HOST_GID`         | Group ID of Host                            | ``      |
| `TA_HOST`          | Domain name for TubeArchivist               | ``      |
| `TA_USERNAME`      | User name for TubeArchivist                 | ``      |
| `TA_PASSWORD`      | Password for TubeArchivist                  | ``      |
| `ELASTIC_PASSWORD` | Password for Elasticsearch                  | ``      |
| `TZ`               | Timezone                                    | ``      |

The following table lists the environment variables for the image `bbilly1/tubearchivist-es`.

| Name               | Usage                                       | Default |
| -------------------| ------------------------------------------- | ------- |
| `ELASTIC_PASSWORD` | Password for Elasticsearch                  | ``      |
| `ES_JAVA_OPTS`     | Additional Java options                     | ``      |

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

The following table lists the environment variables for the image `bbilly1/tubearchivist`.

| Outside mount/volume name | Container mount          | Description                 |
| ------------------------- | ------------------------ | --------------------------- |
| `media`                   | `/youtube`               | storage for media           |
| `cache`                   | `/cache`                 | storage for cache           |

The following table lists the environment variables for the image `bbilly1/tubearchivist-es`.

| Outside mount/volume name | Container mount                 | Description                 |
| ------------------------- | ------------------------------- | --------------------------- |
| `es`                      | `/usr/share/elasticsearch/data` | storage for elasticsearch   |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8000`         | `8881`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker-compose up -d
```

### docker-compose.yml

```yml
version: '3.3'

services:
  ta:
    restart: unless-stopped
    image: bbilly1/tubearchivist
    ports:
      - 8881:8000
    volumes:
      - media:/youtube
      - cache:/cache
    environment:
      - ES_URL=http://es:9200     # needs protocol e.g. http and port
      - REDIS_HOST=redis          # don't add protocol
      - HOST_UID=1000
      - HOST_GID=1000
      - TA_HOST=subdomain.domain.tld        # set your host name
      - TA_USERNAME=admin                   # your initial TA credentials
      - TA_PASSWORD=admin                   # your initial TA credentials
      - ELASTIC_PASSWORD=verysecret         # set password for Elasticsearch
      - TZ=Europe/Berlin                    # set your time zone
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/health"]
      interval: 2m
      timeout: 10s
      retries: 3
    depends_on:
      - es
      - redis
  redis:
    image: redis/redis-stack-server
    restart: unless-stopped
    volumes:
      - redis:/data
    depends_on:
      - es
  es:
    image: bbilly1/tubearchivist-es         # only for amd64, or use official es 8.9.0
    restart: unless-stopped
    environment:
      - "ELASTIC_PASSWORD=verysecret"       # matching Elasticsearch password
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
      - "xpack.security.enabled=true"
      - "discovery.type=single-node"
      - "path.repo=/usr/share/elasticsearch/data/snapshot"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    volumes:
      - es:/usr/share/elasticsearch/data    # check for permission error when using bind mount, see readme

volumes:
  media:
  cache:
  redis:
  es:
```
