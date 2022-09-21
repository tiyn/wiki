# prologic - gopherproxy

This is a docker container for a gopher to http proxy.
The official container and documentation was made by
[prologic](https://hub.docker.com/r/prologic/gopherproxy).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description                              |
| -------------- | ------------------------ | -------- | ---------------------------------------- |
| `8000`         | `8000`                   | TCP      | port to proxy the gopher site as http to |

## Additional

There are some special variables to set.

| Flag   | Usage                                                         |
| ------ | ------------------------------------------------------------- |
| `-uri` | define the gopher site to proxy (just 'domain.tld' is enough) |

## rebuild.sh

```sh
#!/bin/sh
docker stop gopheroverhttp
docker rm gopheroverhttp
docker pull prologic/gopherproxy
docker run --name gopheroverhttp \
    --restart unless-stopped \
    -p 8000:8000 \
    -d prologic/gopherproxy \
    -uri 'domain.tld'
```
