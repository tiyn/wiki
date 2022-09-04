# zedeus - nitter

This is a docker container for the alternative Twitter frontend
[nitter](../nitter.md).
The official container and documentation was made by
[zedeus](https://github.com/zedeus/nitter).

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description               |
| ------------------------- | --------------- | ------------------------- |
| `nitter`                  | `/data`         | storage for all of nitter |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker stop nitter
docker rm nitter
docker pull zedeus/nitter:latest
docker run --name nitter \
        --restart unless-stopped \
        -v <path to nitter conf folder>/nitter.conf:/src/nitter.conf \
        -v nitter:/data \
        -p 8080:8080 \
        -d zedeus/nitter:latest
```

## nitter.conf

```txt
[Unit]
Description=Nitter (An alternative Twitter frontend)
After=syslog.target
After=network.target

[Service]
Type=simple

# set user and group
User=nitter
Group=nitter

# configure
WorkingDirectory=/home/nitter/nitter
ExecStart=/home/nitter/nitter/nitter

Restart=always
RestartSec=15

[Install]
WantedBy=multi-user.target
```
