# ollama - ollama

This is a [Docker](/wiki/docker.md) container for an ollama server.
The official container and documentation was made by
[ollama](https://hub.docker.com/r/ollama/ollama).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description         |
| -------------- | ------------------------ | --------- | ------------------- |
| `11434`        | `11434`                  | TCP       | Communications port |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description   |
| ------------------------- | --------------- | ------------- |
| `ollama`                  | `/root/.ollama` | Ollama data |

## rebuild.sh

```sh
#!/bin/sh
docker stop ollama
docker rm ollama
docker pull ollama/ollama
docker run --name ollama \
    --restart unless-stopped \
    -p 11434:11434 \
    -v ollama:/root/.ollama \
    -d ollama/ollama
```
