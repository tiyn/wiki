# tiynger - pythonflask

The original container and documentation are made by [tiynger](https://hub.docker.com/r/tiynger/pythonflask).

## Volumes

Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                     |
| ----------- | --------------- | ------------------------------- |
| `app`       | `/flask`        | directory for flask application |

## Ports

Set the following volumes with the -p tag.

| Container-Port | Recommed outside port | Protocol | Description |
| -------------- | --------------------- | -------- | ----------- |
| `5000`         | `80`                  | TCP      | HTTP port   |

## Rebuild

```shell
#!/bin/sh
docker stop python-flask
docker rm python-flask
docker pull tiynger/pythonflask:latest
docker run --name python-flask \
    --restart unless-stopped \
    -p "5000:5000" \
    -v python-flask:/flask \
    -d tiynger/pythonflask:latest
```
