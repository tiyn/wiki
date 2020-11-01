# Folding-at-home

## Setup

### Docker

The official container and documentation was made by [johnktims](https://hub.docker.com/r/johnktims/folding-at-home).

#### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `7396`         | `7396`                   | TCP      | WebUI       |

#### Additional

There are some special variables to set.

| Flag      | Usage                                 |
| --------- | ------------------------------------- |
| `--user`  | set your username                     |
| `--power` | set the default power to fold at home |
| `--team`  | set your teamid to contribute points  |

##### GPU

To add a nvidia gpu add the `nvidia-docker-toolkit` or the recommended software
for your gpu.
After that you can set you gpu to fold aswell by adding `--gpus=all`.
GPU support is also mentioned in [the docker entry](docker.md).

#### Rebuild

```shell
#!/bin/sh
docker stop folding-at-home
docker rm folding-at-home
docker pull johnktims/folding-at-home
docker run --name folding-at-home \
    --restart unless-stopped \
    -it \
    -p 7396:7396 \
    -d johnktims/folding-at-home \
    --user=default \
    --power=full \
    --team=000000
```
