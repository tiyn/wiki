# rblsb - synctube

The official container and documentation was made by [rblsb](https://github.com/rblsb/synctube).
There is no official pre-build on docker-hub.

## Set-up for building process

First of all create a folder for your `rebuild.sh`.
After that clone synctube from github into a folder within the just created folder.
Then build the image inside the git folder with `docker build -t synctube .`.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount     | Description         |
| ------------------------- | ------------------- | ------------------- |
| `synctube`                | `/usr/src/app/user` | Configuration files |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `4200`         | `4200`                   | TCP      | WebUI       |

## Rebuild

```shell
#!/bin/sh
docker stop synctube
docker rm synctube
docker run --name synctube \
        --restart unless-stopped \
        -p 4200:4200 \
        -v synctube:/usr/src/app/user \
        -d synctube
```
