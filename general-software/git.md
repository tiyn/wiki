# Git

Git is probably the best version control system (VCS) there is.
It's easy and can be lightweight, but also has tons of possibilities for using graphical (/web) user interfaces.

## Client

The Client is pretty simple to understand.
With only a handfull of commands you should be able to get your versioning going.

- Arch based systems: `pacman -S git`

There is also an interactive [fixup guide by Seth Robertson](https://sethrobertson.github.io/GitFixUm/fixup.html).

## Server with web interface

Web interfaces for git are quite useful for easily showing code to other people.
Additionally it is easy to collaborate together.

- [Gitea](applications/gitea.md) is an open-source and selfhosted and can be dockerized.

## Server without graphical interface

If you don't need a bloated web-interface a more basic approach is more than enough.

- [git-server-docker](setups/bare-git.md) is a pretty basic docker-container for git.

