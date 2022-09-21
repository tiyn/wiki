# rblsb - synctube

This is a docker container for the synchronized video platform synctube.
The official container and documentation was made by [rblsb](https://github.com/rblsb/synctube).
There is no official pre-build on docker-hub.

## Set-up

First of all create a folder for your `rebuild.sh`.
After that clone synctube from [github](https://github.com/rblsb/synctube) into
a folder within the just created folder.
Then build the image inside the git folder with `docker build -t synctube .`.
Set the variables, volumes and ports according and run the `rebuild.sh`.


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

## rebuild.sh

```sh
#!/bin/sh
docker stop synctube
docker rm synctube
docker run --name synctube \
        --restart unless-stopped \
        -p 4200:4200 \
        -v synctube:/usr/src/app/user \
        -d synctube
```
