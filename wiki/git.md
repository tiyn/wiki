# Git

Git is probably the best version control system (VCS) there is.
It's easy and can be lightweight, but also has tons of possibilities for using graphical (/web) user interfaces.

## Setup

Git consists of two parts: [a client](#client) and [a server](#server)

### Client

The client is pretty simple to understand.
With only a handfull of commands you should be able to get your versioning going.
For servers with web interfaces there are different cli tools to control it
without using a browser.
For most linux distributions it is packaged with the `git` package.

### Server

The server hosts the data that is needed for the versioning.
A distinction can be made between
[GUI-less servers](#server-without-graphical-interface) and
[servers with a web-GUI](#server-with-web-interface).

#### Server with web interface

Web interfaces for git are quite useful for easily showing code to other people.
Additionally it is easy to collaborate together.

- [Gitea](gitea.md) is an open-source and selfhosted and can be dockerized.
- [Github](https://github.com) is the go to system for many people. Not
  selfhosted, owned by microsoft ([cli-tool](https://github.com/github/hub)).

#### Server without graphical interface

If you don't need a bloated web-interface a more basic approach is more than enough.

- [git-server-docker](./docker-images/jkarlos_-_git-server-docker.md) is a pretty
  basic docker-container for git.

## Usage

This section addresses various use cases and problems solvable with git.

There is also an interactive
[fixup guide by Seth Robertson](https://sethrobertson.github.io/GitFixUm/fixup.html).

For Linux specific usage refer to the [corresponding entry](git)

### Ignore files having local changes

If you need to make changes to a file that are local you can run
`config update-index --skip-worktree <file>`.
Following this the file won't show up as having changes from the upstream.
Note that files tagged with this command are checked out sparsly, so you need
to watch out for changes yourself if there are any.
To revert this run `config update-index --no-skip-worktree <file>`.

### Authentication via SSH

Authentication by default is done via a username and a password.
For some services such as Github.
it is not possible to use password as an authentication method.
The other possibility to authenticate to git is by using
[SSH](/wiki/linux/ssh.md).

For this a
[SSH certificate has to be created](/wiki/linux/ssh.md#generate-new-keys) and
[added to the authentication agent](/wiki/linux/ssh.md#adding-keys-to-authentication-agent).
Afterwards it the public SSH key to be added to the git server.
For Github there is
[a guide on that topic](https://docs.github.com/en/get-started/getting-started-with-git/why-is-git-always-asking-for-my-password).

Following these the git repositories have to be cloned in a special way to use
SSH instead of password and username.
The following shows both the normal way and the SSH way to clone git
repositories.

```ssh
git clone ssh://git@github.com:tiyn/wiki
git clone https://github.com/tiyn/wiki
```

By using the SSH config file the clone command can be shortened to
`git clone github:tiyn/wiki`.
For this follow the
[corresponding section in the SSH entry](/wiki/linux/ssh.md#shorten-ssh-connection-commands).
Set `Host` to `github`, `HostName` to `github.com` and `User` to `git`.
