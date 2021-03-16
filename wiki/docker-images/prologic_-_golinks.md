# prologic - golinks

## Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                |
| ----------- | --------------- | -------------------------- |
| `golinks`   | `/search.db`    | database with all commands |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8000`         | `8000`                   | TCP      | WebUI       |

## Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull prologic/golinks:latest
docker-compose up -d
```

## Docker-Compose.yml

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
