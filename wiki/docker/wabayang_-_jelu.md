# wabayang - jelu

This is a [Docker](/wiki/docker.md) container for a [Jelu](/wiki/jelu.md) server.
The official container and documentation was made by
[wabayang](https://github.com/bayang/jelu).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

The environment variables are set via the `.env` file and listed in the
[corresponding section](#env).

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `11111`        | `11111`                  | TCP       | WebUI         |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount    | Description         |
| ------------------------- | ------------------ | ------------------- |
| `config`                  | `/config`          | configuration files |
| `database`                | `/database`        | database            |
| `files_images`            | `/files/images`    | path for files      |
| `files_imports`           | `/files/imports`   | path for imports    |
| `/etc/timezone`           | `/etc/timezone:ro` | Timezone            |

### rebuild.sh

```sh
version: "2"
services:
  jelu:
    image: wabayang/jelu
    container_name: jelu
    volumes:
      - config:/config
      - database:/database
      - files_images:/files/images
      - files_imports:/files/imports
      - /etc/timezone:/etc/timezone:ro
    ports:
      - 11111:11111
    restart: unless-stopped

volumes:
    config:
        driver: local
    database:
        driver: local
    files_images:
        driver: local
    files_imports:
        driver: local
```

### docker-compose.yml

```yml
#!/bin/sh
docker-compose down
docker-compose up -d
```
