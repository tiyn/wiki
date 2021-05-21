# johnktims - folding-at-home

The official container and documentation was made by [johnktims](https://hub.docker.com/r/johnktims/folding-at-home).

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

GPU support is documented in [the docker entry](../docker.md).

## rebuild.sh

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
