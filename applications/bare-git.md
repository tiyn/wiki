# Bare Git

## Setup Server

### Docker

The official container and documentation was made by [jkarlos](https://hub.docker.com/r/jkarlos/git-server-docker).

##### Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount   | Description                 |
| ---------------- | ----------------- | --------------------------- |
| git-server-repos | /git-server/repos | storage for git repos       |
| git-server-keys  | /git-server/keys  | storage for user ssh keys   |

##### Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description                           |
| -------------- | ------------------------ | -------- | ------------------------------------- |
| 22             | 2222                     | TCP      | ssh port for accessing the git server |

##### Rebuild

```
#!/bin/sh
docker stop git-server
docker rm git-server
docker pull jkarlos/git-server-docker:latest
docker run --name git-server \
	--restart unless-stopped \
	-p 2222:22 \
	-v git-server_repos:/git-server/repos \
	-v git-server_keys:/git-server/keys \
	-d jkarlos/git-server-docker
```
