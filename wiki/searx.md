# Searx

[Searx](https://searx.me) is a free metasearch engine.

## Setup

### Docker

The official container and documentation was made by [searx](https://hub.docker.com/r/searx/searx).

#### Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount  | Description      |
| ----------- | ---------------- | ---------------- |
| `searx_etc` | `/etc/searx`     | storage for etc  |
| `searx_log` | `/var/log/uwsgi` | storage for logs |

#### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

#### Rebuild

```shell
#!/bin/sh
docker stop searx
docker rm searx
docker pull searx/searx
docker run --name searx \
    --restart unless-stopped \
    -v searx_etc:/etc/searx \
    -v searx_log:/var/log/uwsgi \
    -p 8080:8080 \
    -d searx/searx
```

## Adding to Firefox

You can add Searx as your standard search engine with the addon `Add custom search engine`.
Follow the instructions by the addon and put searx with
`<url to searx instance>/search?q=%s` as search string.
Make sure to replace `<url to searx instance>` with the url of your instance.

It is possible to add it without an addon.
Navigate to the searx instance and click the `...` in the address bar.
Then click `Add Search Engine`
