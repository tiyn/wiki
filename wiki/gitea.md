# Gitea

Gitea is a selfhostable git server with a web interface.
It is similar to GitHub but opensource.

## Setup

Gitea as a [Git](/wiki/git_%28general%29.md) service consists of a [client](#client) and a
[server](#server).

### Server

The software can be setup via [Docker](/wiki/docker.md) with the
[gitea image](/wiki/docker/gitea_-_gitea.md).
Additionally to this a client is needed on the system that need access to the
server software.

### Client

If you want to use all features in addition to the basic client described in
[the git entry](/wiki/git_%28general%29.md) but don't want to use the web-interface all the time you
can get [tea](https://gitea.com/gitea/tea) the official cli-tool for gitea.
