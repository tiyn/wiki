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
For most linux distributions it is packaged with the `git` package

There is also an interactive
[fixup guide by Seth Robertson](https://sethrobertson.github.io/GitFixUm/fixup.html).

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

### Ignore files having local changes

If you need to make changes to a file that are local you can run
`config update-index --skip-worktree <file>`.
Following this the file won't show up as having changes from the upstream.
Note that files tagged with this command are checked out sparsly, so you need
to watch out for changes yourself if there are any.
To revert this run `config update-index --no-skip-worktree <file>`.
