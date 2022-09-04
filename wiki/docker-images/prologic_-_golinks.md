# prologic - golinks

This is a docker container for golinks, a web app to create bookmarks,
commands and aliases.
The official container and documentation was made by
[prologic](https://git.mills.io/prologic/golinks).


## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                |
| ------------------------- | --------------- | -------------------------- |
| `golinks`                 | `/search.db`    | database with all commands |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8000`         | `8000`                   | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker-compose down
docker pull prologic/golinks:latest
docker-compose up -d
```

## docker-compose.yml

```yml
version: "3.1"
services:
  golinks:
    image: prologic/golinks:latest
    container_name: golinks
    restart: unless-stopped
    command:
      - "-url=http://search.home.server/search?q=%s"
      - "-suggest=https://suggestqueries.google.com/complete/search?client=firefox&q=%s"
    ports:
      - "8090:8000"
    volumes:
      - golinks:/search.db

volumes:
  golinks:
    driver: local
```
