# ankitects - anki

This is a [Docker](/wiki/docker.md) container for a [Anki syncserver](/wiki/anki.md#setup-server).
The official container is part of the
[Anki GitHub repository](https://github.com/ankitects/anki/tree/main/docs/syncserver) and has to be
build manually.

The syncserver can be installed to handle the syncing of data in a self-hosted way.
It is described [on GitHub](https://github.com/ankitects/anki/tree/main/docs/syncserver) and can be
setup via [Docker](/wiki/docker.md).

## Set-up

Due to the syncserver having to be set up manually first navigate to the
[Anki syncserver GitHub subpage](/wiki/anki.md#setup-server).
From there download the `Dockerfile` and the `entrypoints.sh`.
Then create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.
Especially set the `<version>` (for example `24.11`) aswell as the `<user>` and `<password>`.

## Environment-variables

Set the following variables with the -e tag.

| Name           | Usage                                                    | Default |
| -------------- | -------------------------------------------------------- | ------- |
| `SYNC_USER1`   | contains the `<user>` and `<password>` of the first user |         |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `27701`        | `8080`                   | TCP       | Default port  |

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description   |
| ------------------------- | --------------- | ------------- |
| `akni-sync-server-data`   | `/anki-data`    | Data storage  |

## rebuild.sh

```sh
#!/bin/sh
docker stop anki-sync-server
docker rm anki-sync-server
docker build -f ./Dockerfile --no-cache --build-arg ANKI_VERSION=<version> -t anki-sync-server .
docker run -d \
    -e "SYNC_USER1=<user>:<password>" \
    -p 27701:8080 \
    --mount type=volume,src=anki-sync-server-data,dst=/anki_data \
    --name anki-sync-server \
    anki-sync-server
```
