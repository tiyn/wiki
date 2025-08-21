# Shell

A shell is a command-line interpreter that provides a command-line interface to
interact with the many unix-like system.

## Unix Shells

The following is a list of Unix shells that are POSIX compliant.

- [Bash](https://www.gnu.org/software/bash/) is the GNU Projects shell.
  It is probably the most used and well known shell.
- [DASH](http://gondor.apana.org.au/~herbert/dash/) is a small implementation of
  `/bin/sh`. It is significantly faster than Bash and it is recommende to set
  DASH to be [the system shell](#changing-the-system-shell-binsh).
- [Zsh](https://www.zsh.org/) is a shell designed to be interactive but also a
  powerful scripting language. It is often set to be the
  [default user shell](#changing-the-default-user-shell) because of its user
  friendliness and a more features like the possibility for
  [syntax highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
  and [auto suggestions](https://github.com/zsh-users/zsh-autosuggestions) and even an improved
  version of [auto completion](https://github.com/marlonrichert/zsh-autocomplete).

## Usage

This section addresses various different functions by and actions that can be
taken with shell commands.
The focus is mostly on POSIX-compliant shells and scripts that are compatible with POSIX.

A helpful resource for shell scripts is
[the pure sh bible](https://github.com/dylanaraps/pure-sh-bible).
There are similar repositories and resources for functions that are outside the scope of POSIX
shells.
Because of that and their issue regarding compatibility they will not be mentioned here.

### Symbolic Links using `ln`

`ln` is a command to create links between files and folders.
The most simple way to create a link between two folders or files is running the following
command.
Replace `<source folder/file>` and `<target folder/file>` as needed.

```sh
ln -s <source folder/file> <target folder/file>
```

### `ls` and its Alternatives

`ls` is a command to list files and directories.
Its most important flags are the `-l` option to create a list view and `-a` to show files that are
normally hidden.

A popular alternative until its discontinuation was [exa](https://github.com/ogham/exa).
A fork of it called [eza](https://github.com/eza-community/eza) is still actively maintained.

### Renaming Files

Files can be renamed by using the `mv` command like in the following example.

```sh
mv old_name.ext new_name.ext
```

Another way to rename files that is especially useful if renaming a lot of files is needed is done
by using the command-line utility `rename`.
In the following example the string `string1` will be substituted by `string2` for a given file
`file.ext`.

```sh
rename 's/string1/string2/g' file.ext
```

Additionally `find` can be used to recursively substitute substrings in all files inside a folder
`folder` (including subfolders).

```sh
find folder -type f -exec rename 's/string1/string2/g' {} +
```

For renaming many files in bulk the `qmv` to move or `qcp` or copy can be used.
Usually both of these commands are packaged withing the `renameutils` package.
For more information visit the [renameutils website](https://www.nongnu.org/renameutils/).

Another option for bulk renaming is `vidir` which is part of the `moreutils` package for most
[distributions](/wiki/linux.md#distributions).
vidir is able to create folders which qmv is not.
More information can be found on the [moreutils website](https://joeyh.name/code/moreutils/).

### Expansion

This section is based on the
[TLDP Bash guide for beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_04.html).
Although it is centered on Bash it can also be used in other shells (Zsh) while being unsupported
by others (DASH).

In most shells curly braces can be used to expand a term.
Commands can be expanded like the following example.

```sh
echo sp{el,il,al}l
```

The previous command will expand to the following command.

```sh
echo spell spill spall
```

The example shows a brace expansions of depth `1`.
Using multiple curly brace pairs the depth can be increased as needed.

### For Loops

For loops can be especially useful when scripting.
A function could be called on all the files in a directory.
The following command shows the basic functionality and syntax of a for loop in
a POSIX compliant shell.
The command appends `-1` to all files in the current working directory.
It consists of the loop structure that cycles through all files `*`.
and appends `-1` using `mv "$f" "${f}-1"`.
The command aswell as the scope could be change to only cycle through specific
filetypes or use another command.

```sh
for f in *
  do mv "$f" "${f}-1"
done
```

This command can also be shortened to a single line by using `;` like the
following shows.

```sh
for f in *; do mv "$f" "${f}-1"; done
```

### Changing the Default User Shell

The default user shell can be changed with the following command.
Change `<path to shell>` according to the shell to set.
For [ZSH](#unix-shells) this would be `/bin/zsh`.

```sh
chsh -s <path to shell>
```

### Changing the System Shell /bin/sh

The system shell in some distributions is made up by a POSIX compliant mode of
Bash.
This can be slow at times and a shell like
A shell like [DASH](#unix-shells) would be much faster.
This is a guide on how to persistently change the symlink /bin/sh from Bash to
DASH.
Run the following commands to install and link `/bin/sh` to the DASH shell.

```sh
yay -S dash
sudo ln -sfT /bin/dash /bin/sh
```

Afterwards create the file `/usr/share/libalpm/hooks/bash-update.hook` and fill
it with the following text.

```txt
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Target = bash

[Action]
Description = Re-pointing /bin/sh symlink to dash...
When = PostTransaction
Exec = /usr/bin/ln -sfT dash /usr/bin/sh
Depends = dash
```

### Disown a Command

This section is based on a guide by
[baeldung](https://www.baeldung.com/linux/detach-process-from-terminal).
Disowning a command removes it from the current shell.
Commands that are detached from a shell will not terminate upon its closure.
A command can be disowned simply by appending `& disown` at the end of it.
It will then provide the PID of the command that got disowned.

### Silencing a Command

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

### `cd` Into Next Or Previous Sibling Directory

Quickly switching to the alphabetically next or previous directory can in some cases be useful.
For this the following commands can be used.
The first one navigates to the alphabetically previous sibling directory.
The second one to the next.

```sh
cd ../"$(ls -F .. | grep '/' | grep -B1 -xF "${PWD##*/}/" | head -n 1)"
cd ../"$(ls -F .. | grep '/' | grep -A1 -xF "${PWD##*/}/" | tail -n 1)"
```

## Error solving

This section addresses various problems that can occur and are related to the shell.

### Pressing Enter Produces `^M`

This error can easily be fixed by running the following command.
It is related to a terminal line setting problem.

```sh
stty sane
```

### Error `cannot open shared object file: No such file or directory`

This section is based on a
[Github issue by stephenson](https://github.com/rubygems/rubygems/issues/7523).
This error can occur for many different programs and with many different commands which is why it
is listed in the shell entry.
To fix it the most common and most effective way is to [reinstall](/wiki/linux/package_manager.md)
the program that throws the error.
