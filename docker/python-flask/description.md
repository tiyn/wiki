# DockerPythonFlask
This is a dockerized version of a Python3 Flask Server.
The original container and documentation are made by [tiynger](https://hub.docker.com/r/tiynger/pythonflask).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                     |
| ----------- | --------------- | ------------------------------- |
| app		  | /flask			| directory for flask application |

## Ports
Set the following volumes with the -p tag.

| Container-Port | Recommed outside port | Protocol | Description |
| -------------- | --------------------- | -------- | ----------- |
| 5000		     | 80		             | TCP      | HTTP port   |
