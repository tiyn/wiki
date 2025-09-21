# open-webui - open-webui

This is a [Docker](/wiki/docker.md) container for a Open WebUI server.
The official container and documentation was made by
[open-webui](https://github.com/open-webui/open-webui).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `11434`        | `8080`                   | TCP       | WebUI         |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount     | Description     |
| ------------------------- | ------------------- | --------------- |
| `open-webui`              | `/app/backend/data` | Open WebUI data |

## rebuild.sh

```sh
#!/bin/sh
docker stop openwebui
docker rm openwebui
docker pull ghcr.io/open-webui/open-webui:main
docker run --name openwebui \
    --restart unless-stopped \
    -p 11434:8080 \
    -v open-webui:/app/backend/data \
    -d ghcr.io/open-webui/open-webui:main

```
