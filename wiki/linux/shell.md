# Shell

A shell is a command-line interpreter that provides a command-line interface to
interact with the many unix-like system.

## Change the standard shell

The Shell in some distributions is made up by a POSIX compliant mode of bash.
Problem with that is the speed.
A shell like dash would be much faster.
This is a guide on how to persistently change the symlink /bin/sh from bash to
dash.

- `yay -S dash` - Install dash
- `sudo ln -sfT /bin/dash /bin/sh` - link /bin/sh to dash
- `sudo vim /usr/share/libalpm/hooks/bash-update.hook` - setup a hook to avoid
bash resetting the symlink

## Disown a Command

This section is based on a guide by
[baeldung](https://www.baeldung.com/linux/detach-process-from-terminal).
Disowning a command removes it from the current shell.
Commands that are detached from a shell will not terminate upon its closure.
A command can be disowned simply by appending `& disown` at the end of it.
It will then provide the PID of the command that got disowned.

## Silencing a Command

This section is based on a guide by
[baeldung](https://www.baeldung.com/linux/silencing-bash-output).
If the output of a command is unwanted it can be silenced.
There are two parts that can be silenced independently.
Non-error outputs (stdout) can be silenced by appending `1> /dev/null` to the
command.
Due to the `1` being ommitable `> /dev/null` has the same effect.
Error outputs (stderr) can be silenced by appending `2> /dev/null`.
The complete output of both stderr and stdout can be silenced by appending
`> /dev/null 2>&1` to the command.
A shortened version of it not possible on all shells is `&> /dev/null`.

