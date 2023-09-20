# Git (Client)

This entry deals with the Git client used in
[Linux-based systems](/wiki/linux.md).
The client is pretty simple to understand.
With only a handfull of commands you should be able to get your versioning going.
For servers with web interfaces there are different cli tools to control it
without using a browser.

## Setup

On most linux distributions Git can be installed with the `git` package.
The package provides a simple command line interface.

An alternative to the classical interface is the [lazygit](https://github.com/jesseduffield/lazygit)
terminal user interface.
Though it provides a new user interface it still uses the `git` package as a base.

## Usage

This section addresses various use cases of git.

There is also an interactive
[fixup guide by Seth Robertson](https://sethrobertson.github.io/GitFixUm/fixup.html).

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

### Improved `git diff`

[Diff So Fancy](https://github.com/so-fancy/diff-so-fancy) is a drop in
replacement for the default `git diff` look.
It can be installed via the
[repository](https://github.com/so-fancy/diff-so-fancy) or the `diff-so-fancy`
package.
Afterwards the following lines need to be run to complete the configuration.

```sh
# switch to diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

# color improvements
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
```
