# immich-app - immich-server

This is a [Docker](/wiki/docker.md) container for a /service/ server.
The official container and documentation was made by
[immich](https://github.com/immich-app/immich).
This docker-rebuild is made up by a `docker-compose.yml` file.
In addition to the main container you need to connect a
[redis](/wiki/docker/redis.md) and a [postgres](/wiki/docker/postgres.md) container to it.

## Set-up

Create the files `rebuild.sh`, `.env` and `docker-compose.yml` at the same
place.
Please note that the `docker-compose.yml` file should be retrieved from the
[Github releases page](https://github.com/immich-app/immich/releases/)
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following variables with the -e tag.

| Name       | Usage         | Default |
| ---------- | ------------- | ------- |
| `/name/`   | /description/ |         |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `2283`         | `3001`                   | TCP       | WebUI         |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount       | Description   |
| ------------------------- | --------------------- | ------------- |
| `immich_library`          | `/usr/src/app/upload` | Library       |
| `/etc/timezone`           | `/etc/timezone:ro`    | Timezone      |

### rebuild.sh

```sh #!/bin/sh
docker-compose down
docker-compose up -d
```

### .env

```sh
# You can find documentation for all the supported env variables at https://immich.app/docs/install/environment-variables

# The location where your uploaded files are stored
UPLOAD_LOCATION=immich_library
# The location where your database files are stored
DB_DATA_LOCATION=immich_postgres

# To set a timezone, uncomment the next line and change Etc/UTC to a TZ identifier from this list: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
# TZ=Etc/UTC

# The Immich version to use. You can pin this to a specific version like "v1.71.0"
IMMICH_VERSION=release

# Connection secret for postgres. You should change it to a random password
# Please use only the characters `A-Za-z0-9`, without special characters or spaces
DB_PASSWORD=postgres

# Disable Machine Learning
IMMICH_MACHINE_LEARNING_ENABLED=false
IMMICH_MACHINE_LEARNING_URL=false

# The values below this line do not need to be changed
###################################################################################
DB_USERNAME=postgres
DB_DATABASE_NAME=immich
```
