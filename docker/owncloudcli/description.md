# DockerOwncloudClient
This is a dockerized version of a OwnCloud Client.
The original container and documentation are made by [tiynger](https://hub.docker.com/r/tiynger/owncloudclient)

## Environment-variables
Set the following variables with the -e tag.

| Name		  | Usage                                               | Default   |
| ----------- | --------------------------------------------------- | --------- |
| USER		  | username of OwnCloud server                         | admin     |
| PASSWORD    | password of OwnCloud server                         | admin     |
| URL	      | url of OwnCloud server (dont forget the http(s)://) | localhost |

## Volumes
Set the following volumes with the -v tag.

| Volume-Name | Container mount | Description                         |
| ----------- | --------------- | ----------------------------------- |
| data	      | /data			| directory for the owncloud contents |
