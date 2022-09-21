# spikecodes - libreddit

This is a docker container for the alternative reddit frontend
[libreddit](../libreddit.md).
The official container and documentation was made by [spikecodes](https://github.com/spikecodes/libreddit).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

## rebuild.sh

```sh
#!/bin/sh
docker stop libreddit
docker rm libreddit
docker pull spikecodes/libreddit:latest
docker run --name libreddit \
        --restart unless-stopped \
        -p 8080:8080 \
        -d spikecodes/libreddit:latest
```
