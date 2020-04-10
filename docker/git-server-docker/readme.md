# git-server-docker
This is a dockerized version of a git server.
The official container and documentation was made by [jkarlos](https://hub.docker.com/r/jkarlos/git-server-docker).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount   | Description                 |
| ---------------- | ----------------- | --------------------------- |
| git-server-repos | /git-server/repos | storage for git repos       |
| git-server-keys  | /git-server/keys  | storage for user ssh keys   |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description                           |
| -------------- | ------------------------ | -------- | ------------------------------------- |
| 22             | 2222                     | TCP      | ssh port for accessing the git server |

