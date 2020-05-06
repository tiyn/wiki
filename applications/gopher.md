# Gopherproxy

## Setup Proxy

### Docker

The official container and documentation was made by [prologic](https://hub.docker.com/r/prologic/gopherproxy).

#### Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description                              |
| -------------- | ------------------------ | -------- | ---------------------------------------- |
| 8000           | 8000                     | TCP      | port to proxy the gopher site as http to |

#### Additional
There are some special variables to set.

| Flag | Usage                                                         |
| ---- | ------------------------------------------------------------- |
| -uri | define the gopher site to proxy (just 'domain.tld' is enough) |

#### Rebuild

```
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

## Setup Server

### Docker

The official container and documentation was made by [tiynger](https://hub.docker.com/r/tiynger/gopherserver).

#### Environment-variables
Set the following variables with the -e tag.

| Name          | Usage                                               | Default   |
| ------------- | --------------------------------------------------- | --------- |
| SERVER\_NAME   | set this to your IP/Domain (no "gopher://" needed!) | localhost |

#### Volumes
Set the following volumes with the -v tag.

| Volume-Name          | Container mount | Description                   |
| -------------------- | --------------- | ----------------------------- |
| gopherwebdir         | /var/gopher     | directory for the gopher page |

#### Ports
Set the following ports with the -p tag.

| Container port | Recommended outside port | Protocol   | Description                  |
| -------------- | ------------------------ | ---------- | ---------------------------- |
| 70             | 70                       | TCP        | port for the gopher-protocol |

#### Rebuild

```
#!/bin/sh
docker stop gopherserver
docker rm gopherserver
docker pull tiynger/gopherserver
docker run --name gopherserver \
	--restart unless-stopped \
	-p 70:70 \
	-v gopherserver:/var/gopher \
	-e SERVER_NAME='domain.tld' \
	-d tiynger/gopherserver
```
