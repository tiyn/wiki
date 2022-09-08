# sissbrueckner - linkding

This is a docker container for a [linkding](../linkding.md) bookmark and
archive service.
The official container and documentation was made by
[sissbrueckner](https://github.com/sissbruecker/linkding).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.
Afterwards you need to create a user.
This can be done by running the following line with changed credentials:

```sh
docker exec -it linkding python manage.py createsuperuser --username=joe --email=joe@example.com
```

You will be asked for a password via the commandline.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount        | Description                 |
| ------------------------- | ---------------------- | --------------------------- |
| `linkding`                | `/etc/linkding/data`   | storage for persistent data |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `9090`         | `9090`                   | TCP      | WebUI       |

## rebuild.sh

```shell
#!/bin/sh
docker stop linkding
docker rm linkding
docker pull sissbruecker/linkding:latest
docker run --name linkding \
        --restart unless-stopped \
        -p 9090:9090 \
        -v linkding:/etc/linkding/data \
        -d sissbruecker/linkding:latest
```
