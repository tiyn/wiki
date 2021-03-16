# tiynger - owncloudclient

The original container and documentation are made by [tiynger](https://hub.docker.com/r/tiynger/owncloudclient)

## Environment-variables

Set the following variables with the -e tag.

| Name       | Usage                                               | Default     |
| ---------- | --------------------------------------------------- | ----------- |
| `USER`     | username of OwnCloud server                         | `admin`     |
| `PASSWORD` | password of OwnCloud server                         | `admin`     |
| `URL`      | url of OwnCloud server (dont forget the http(s)://) | `localhost` |

## Additional

There are some special variables to set.

| Flag                 | Usage                                                      |
| -------------------- | ---------------------------------------------------------- |
| `--opt-log max-size` | prevent log file from growing to large (`50m` recommended) |

## Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                         |
| ----------- | --------------- | ----------------------------------- |
| `data`      | `/data`         | directory for the owncloud contents |

## Rebuild

```shell
#!/bin/sh
docker stop owncloudcli
docker rm owncloudcli
docker pull tiynger/owncloudclient
docker run --name owncloudcli \
    --restart unless-stopped \
    -v owncloudcli:/data \
    -e USER='user' \
    -e PASSWORD='password' \
    -e URL='https://subdomain.domain.tld' \
    --log-opt max-size=50m \
    -d tiynger/owncloudclient
```
