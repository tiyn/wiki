# zedeus - nitter

This is a [Docker](/wiki/docker.md) container for the alternative Twitter
frontend [nitter](../nitter.md).
The official container and documentation was made by
[zedeus](https://github.com/zedeus/nitter).

## Set-up

Create the file `rebuild.sh`, `docker-compose.yml` and `nitter.conf` at the same
place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description               |
| ------------------------- | --------------- | ------------------------- |
| `nitter`                  | `/data`         | storage for all of nitter |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8080`         | `8080`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull awesometechnologies/synapse-admin:latest
docker-compose up -d
```

### docker-compose.yml

```txt
version: "3"

services:
  nitter:
    image: zedeus/nitter:latest
    container_name: nitter
    ports:
      - "8080:8080"
    volumes:
      - ./nitter.conf:/src/nitter.conf:Z,ro
    depends_on:
      - nitter-redis
    restart: unless-stopped
    healthcheck:
      test: wget -nv --tries=1 --spider http://127.0.0.1:8080/Jack/status/20 || exit 1
      interval: 30s
      timeout: 5s
      retries: 2
    user: "998:998"
    read_only: true
    security_opt:
      - no-new-privileges:true
    cap_drop:
      - ALL

  nitter-redis:
    image: redis:6-alpine
    container_name: nitter-redis
    command: redis-server --save 60 1 --loglevel warning
    volumes:
      - nitter-redis:/data
    restart: unless-stopped
    healthcheck:
      test: redis-cli ping
      interval: 30s
      timeout: 5s
      retries: 2
    user: "999:1000"
    read_only: true
    security_opt:
      - no-new-privileges:true
    cap_drop:
      - ALL

volumes:
  nitter-redis:

```


### nitter.conf

```txt
[Server]
address = "0.0.0.0"
port = 8080
https = false  # disable to enable cookies when not using https
httpMaxConnections = 100
staticDir = "./public"
title = "nitter"
hostname = "nitter.net"

[Cache]
listMinutes = 240  # how long to cache list info (not the tweets, so keep it high)
rssMinutes = 10  # how long to cache rss queries
redisHost = "nitter-redis"
redisPort = 6379
redisPassword = ""
redisConnections = 20  # connection pool size
redisMaxConnections = 30
# max, new connections are opened when none are available, but if the pool size
# goes above this, they're closed when released. don't worry about this unless
# you receive tons of requests per second

[Config]
hmacKey = "secretkey"  # random key for cryptographic signing of video urls
base64Media = false  # use base64 encoding for proxied media urls
enableRSS = true  # set this to false to disable RSS feeds
enableDebug = false  # enable request logs and debug endpoints
proxy = ""  # http/https url, SOCKS proxies are not supported
proxyAuth = ""
tokenCount = 10
# minimum amount of usable tokens. tokens are used to authorize API requests,
# but they expire after ~1 hour, and have a limit of 187 requests.
# the limit gets reset every 15 minutes, and the pool is filled up so there's
# always at least $tokenCount usable tokens. again, only increase this if
# you receive major bursts all the time

# Change default preferences here, see src/prefs_impl.nim for a complete list
[Preferences]
theme = "Nitter"
replaceTwitter = "nitter.net"
replaceYouTube = "piped.video"
replaceReddit = "teddit.net"
proxyVideos = true
hlsPlayback = false
infiniteScroll = false
```
