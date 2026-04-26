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
There are many different [server](#server) which also have
[distinct applications](#distinct-git-server-apps) other than the normal [client](#client).

#### Server

Web interfaces for git are quite useful for easily showing code to other people.
Additionally, it is easy to collaborate together.

- [Gitea](gitea.md) is an open-source and self-hosted git instance which can be
  [dockerized](/wiki/docker/gitea_-_gitea.md).
  It has a graphical user interface.
- [GitHub](https://github.com) is a popular git server.
  It is not self-hosted and owned by Microsoft.
  It has a graphical user interface.
- [GitLab](https://gitlab.com) is a self-hostable git instance which also has a default version
  available via their website.
  It has a graphical user interface.
- [git-server-docker](/wiki/docker/jkarlos_-_git-server-docker.md) is a pretty
  basic docker-container for git.
  It does not have a graphical user interface.

If a solution for storing datasets or AI models is needed [KohakuHub](/wiki/kohakuhub.md) is
available and uses similar techniques of storage and versioning although it is not a Git server.

#### Distinct Git Server Apps

Depending on the [specific server](#server) used there are many different apps
that can be used.
The normal git [clients](#client) can be used for all of them.

- [GitHub](https://github.com) features various apps with the same name for
  [Android](/wiki/android.md) and iOS devices.
- [hub](https://github.com/github/hub) is an official command-line tool for
  [GitHub](https://github.com).
- [GitNex](https://gitnex.com) is an app for [Android](/wiki/android.md) devices which can access
    [Gitea](/wiki/gitea.md) and Forgejo instances.
- [LabNex](https://labnex.app) is an app for [Android](/wiki/android.md) devices which can access
    [GitLab](https://gitlab.com) instances.
