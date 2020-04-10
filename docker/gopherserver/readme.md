# Gopherserver
This is a dockerized version of a gopher server.
The official container and documentation was made by [tiynger](https://hub.docker.com/r/tiynger/gopherserver).

## Environment-variables
Set the following variables with the -e tag.

| Name          | Usage                                               | Default   |
| ------------- | --------------------------------------------------- | --------- |
| SERVER_NAME   | set this to your IP/Domain (no "gopher://" needed!) | localhost |

## Volumes
Set the following volumes with the -v tag.

| Volume-Name          | Container mount | Description                   |
| -------------------- | --------------- | ----------------------------- |
| gopherwebdir         | /var/gopher     | directory for the gopher page |

## Ports
Set the following ports with the -p tag.

| Container port | Recommended outside port | Protocol   | Description                  |
| -------------- | ------------------------ | ---------- | ---------------------------- |
| 70             | 70                       | TCP        | port for the gopher-protocol |
