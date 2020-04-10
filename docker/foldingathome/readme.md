# Folding-at-home
This is a dockerized version of a folding-at-home server.
The official container and documentation was made by [johnktims](https://hub.docker.com/r/johnktims/folding-at-home).

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 7396           | 7396                     | TCP      | WebUI       |

## Additional
There are some special variables to set.

| Flag    | Usage                                  |
| ------- | -------------------------------------- |
| --user  | set your username                      |
| --power | set the default power to fold at home  |
| --team  | set your teamid to contribute points   |

### GPU
To add a nvidia gpu add the ```nvidia-docker-toolkit``` or the recommended software for your gpu.
After that you can set you gpu to fold aswell by adding ```--gpus=all```.
