# cloudrac3r - bibliogram

This is a docker container for the alternative Instagram frontend
[Bibliogram](../bibliogram.md).
The official container and documentation was made by
[cloudrac3r](https://github.com/cloudrac3r/bibliogram).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Set-up

First of all create a folder for your `rebuild.sh`.
After that clone bibliogram from [sr.ht](https://sr.ht/~cadence/bibliogram/) into
a folder within the just created folder.
You can find the `docker-compose.yml` in the cloned directory.
Set the variables, volumes and ports according and run the `rebuild.sh`.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                         |
| ------------------------- | --------------- | ----------------------------------- |
| `db`                      | `/app/db`       | storage for the bibliogram database |

## Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `10407`        | `10407`                  | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
cd /root/docker/bibliogram/bibliogram
docker-compose down
docker-compose up -d
cd ..
```

## docker-compose.yml

```yml
version: "3"
volumes:
  db:
services:
  bibliogram:
    build: .
    image: cloudrac3r/bibliogram
    volumes:
      - db:/app/db
    ports:
      - 10407:10407
    restart: unless-stopped
```
