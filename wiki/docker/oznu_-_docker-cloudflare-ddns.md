# oznu - docker-cloudflare-ddns

This is a [Docker](/wiki/docker.md) container for dynamically updating
cloudflare dns entries.
The official container and documentation was made by
[oznu](https://github.com/oznu/docker-cloudflare-ddns).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Environment variables

Set the following variables with the -e tag.

| Variable name | Description                                            |
| ------------- | ------------------------------------------------------ |
| `API_KEY=`    | append your API key that you retrieved from cloudflare |
| `ZONE=`       | append your domain (for example `main.com`)            |
| `SUBDOMAIN`   | append your subdomain (for example `dynamic`)          |

## rebuild.sh

```sh
#!/bin/sh
docker stop ddns
docker rm ddns
docker pull oznu/cloudflare-ddns
docker run \
    --name ddns \
    -e API_KEY=1234567890 \
    -e ZONE=main.com \
    -e SUBDOMAIN=dynamic \
    -d oznu/cloudflare-ddns
```
