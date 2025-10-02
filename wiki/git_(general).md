# Git (Server)

Git is probably the best version control system (VCS) there is.
It's easy and can be lightweight, but also has tons of possibilities for using graphical (including
web) user interfaces.

## Setup

Git consists of two parts: [a client](#client) and [a server](#server).

### Client

The Git package which can be used as a client for [Linux-based operating systems](/wiki/linux.md)
has a [separate article](/wiki/linux/git_%28package%29.md).

### Server

The server hosts the data that is needed for the versioning.
A distinction can be made between
[GUI-less servers](#server-without-graphical-interface) and
[servers with a web-GUI](#server-with-web-interface).

#### Server with web interface

Web interfaces for git are quite useful for easily showing code to other people.
Additionally it is easy to collaborate together.

- [Gitea](gitea.md) is an open-source and selfhosted and can be dockerized.
- [GitHub](https://github.com) is the go to system for many people. Not
  selfhosted, owned by microsoft ([cli-tool](https://github.com/github/hub)).

#### Server without graphical interface

If you don't need a bloated web-interface a more basic approach is more than enough.

- [git-server-docker](./docker/jkarlos_-_git-server-docker.md) is a pretty
  basic docker-container for git.
