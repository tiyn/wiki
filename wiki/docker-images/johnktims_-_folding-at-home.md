# johnktims - folding-at-home

This is a docker container for [Folding@home](https://foldingathome.org/).
The official container and documentation was made by [johnktims](https://hub.docker.com/r/johnktims/folding-at-home).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `7396`         | `7396`                   | TCP      | WebUI       |

## Additional

There are some special variables to set.

| Flag      | Usage                                 |
| --------- | ------------------------------------- |
| `--user`  | set your username                     |
| `--power` | set the default power to fold at home |
| `--team`  | set your teamid to contribute points  |

### GPU

GPU support is documented in [the docker article](../docker.md).

## rebuild.sh

```sh
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
