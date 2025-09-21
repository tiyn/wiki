# actualbudget - actual-server

This is a [Docker](/wiki/docker.md) container for an actualbudget server.
The official container and documentation was made by
[actualbudget](https://actualbudget.org/docs/install/docker/).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

Create the files `rebuild.sh`, `docker-compose.yml` at the same
place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `5006`         | `5006`                   | TCP       | WebUI         |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description        |
| ------------------------- | --------------- | ------------------ |
| `actual`                  | `/data`         | Actual Budget data |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker-compose up -d
```

### docker-compose.yml

```yml
version: '3'
services:
  actual_server:
    image: docker.io/actualbudget/actual-server:latest
    ports:
      # This line makes Actual available at port 5006 of the device you run the server on,
      # i.e. http://localhost:5006. You can change the first number to change the port, if you want.
      - '5006:5006'
    # environment:
      # Uncomment any of the lines below to set configuration options.
      # - ACTUAL_HTTPS_KEY=/data/selfhost.key
      # - ACTUAL_HTTPS_CERT=/data/selfhost.crt
      # - ACTUAL_PORT=5006
      # - ACTUAL_UPLOAD_FILE_SYNC_SIZE_LIMIT_MB=20
      # - ACTUAL_UPLOAD_SYNC_ENCRYPTED_FILE_SYNC_SIZE_LIMIT_MB=50
      # - ACTUAL_UPLOAD_FILE_SIZE_LIMIT_MB=20
      # See all options and more details at https://actualbudget.github.io/docs/Installing/Configuration
      # !! If you are not using any of these options, remove the 'environment:' tag entirely.
    volumes:
      # Change './actual-data' below to the path to the folder you want Actual to store its data in on your server.
      # '/data' is the path Actual will look for its files in by default, so leave that as-is.
      - actual:/data
    restart: unless-stopped

volumes:
   actual:
```
