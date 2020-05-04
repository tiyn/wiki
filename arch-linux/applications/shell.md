# Shell

The Shell in Arch-Linux is made up by a POSIX compliant mode of bash.
Problem with that is the speed.
A shell like dash would be much faster.
This is a guide on how to persistently change the symlink /bin/sh from bash to dash.

## Setup

- `yay -S dash` - Install dash
- `sudo ln -sfT /bin/dash /bin/sh` - link /bin/sh to dash
- `sudo vim /usr/share/libalpm/hooks/bash-update.hook` - setup a hook to avoid bash resetting the symlink
