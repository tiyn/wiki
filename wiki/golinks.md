# Golinks

[Golinks](https://github.com/prologic/golinks) is a web app that can create and
use bookmarks and run different searches by prefixes.

## Setup

### Docker

#### Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                |
| ----------- | --------------- | -------------------------- |
| `golinks`   | `/search.db`    | database with all commands |

#### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8000`         | `8000`                   | TCP      | WebUI       |

#### Rebuild

```shell
#!/bin/sh
docker-compose down
docker pull prologic/golinks:latest
docker-compose up -d
```

#### Docker-Compose.yml

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

### Setup in Firefox

Add Golinks as a new search engine for firefox and set it as main search for the
address bar as described in [the Firefox article](./firefox.md).
Follow the instructions by the addon and put searx with
`<url to searx instance>/?q=%s` as search string.
