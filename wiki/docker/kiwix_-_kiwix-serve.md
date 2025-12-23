# /maintainer/ - /name/

This is a [Docker](/wiki/docker.md) container for a [Kiwix](/wiki/kiwix.md) server.
The official container and documentation was made by
[kiwix](https://github.com/kiwix/kiwix-tools/pkgs/container/kiwix-serve).

## Set-up

Create the file `rebuild.sh`.
Make sure to place the `.zim` files inside the volume.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `80`           | `80`                     | TCP       | WebUI         |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description    |
| ------------------------- | --------------- | -------------- |
| `kiwix_data`              | `/data`         | Data directory |

## rebuild.sh

```sh
docker stop kiwix-serve
docker rm kiwix-serve
docker pull ghcr.io/kiwix/kiwix-serve
docker run  --name kiwix-serve \
    --restart unless-stopped \
    -v kiwix_data:/data \
    -p 80:80 \
    -d ghcr.io/kiwix/kiwix-serve \
    *.zim
```
