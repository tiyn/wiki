# Cloudflare DDNS

If you have a dynamic IP address, you will need to update your domain on cloudflare
regularly to ensure you're mapping onto the right address.
This service will do that for you.

## Docker

The official container and documentation was made by [oznu](https://github.com/oznu/docker-cloudflare-ddns).

### Environment variables

Set the following variables with the -e tag.

| Variable name | Description                                            |
| ------------- | ------------------------------------------------------ |
| `API_KEY=`    | append your API key that you retrieved from cloudflare |
| `ZONE=`       | append your domain (for example `main.com`)            |
| `SUBDOMAIN`   | append your subdomain (for example `dynamic`)          |

### Rebuild

```shell
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
