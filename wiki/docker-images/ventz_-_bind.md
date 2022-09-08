# ventz - bind

This is a docker container for a [dns](../dns.md) resolver.
The official container and documentation was made by
[ventz](https://hub.docker.com/r/ventz/bind).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount   | Description           |
| ------------------------- | ----------------- | --------------------- |
| `bind_cache`              | `/var/cache/bind` | cache for dns         |
| `bind_etc`                | `/etc/bind`       | configuration for dns |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description       |
| -------------- | ------------------------ | -------- | ----------------- |
| `53`           | `53`                     | TCP      | dns protocol port |
| `53`           | `53`                     | UDP      | dns protocol port |

## Additional

There are some special variables to set.

| Flag    | Usage                                                   |
| ------- | ------------------------------------------------------- |
| `--dns` | set two of these flags for specific dns forward servers |

## Rebuild

```shell
#!/bin/sh
docker stop bind
docker rm bind
docker pull ventz/bind:latest
docker run --name bind \
    --restart unless-stopped \
    --dns=1.1.1.1 --dns=8.8.8.8 \
    -p 53:53/udp \
    -p 53:53 \
    -v bind_cache:/var/cache/bind  \
    -v bind_etc:/etc/bind \
    -d ventz/bind:latest
```
