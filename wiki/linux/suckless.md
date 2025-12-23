# Suckless

[Suckless](https://suckless.org/) is a community that is best known for minimalist free software.
Notable works of Suckless are the following.

- [dmenu](https://tools.suckless.org/dmenu/) is a menu with prgram launcher functionality
- [dwm](https://dwm.suckless.org/) is a window manager
- [ii](https://tools.suckless.org/ii/) is an IRC client
- [slock](https://tools.suckless.org/slock/) is a screen locker
- [st](https://st.suckless.org/) is a [terminal](/wiki/linux/system_console.md)
- [dwl](https://codeberg.org/dwl/dwl) is a window manager similar to dwm that can be used on
  [Wayland](/wiki/linux/wayland.md) systems.
  For the IPC-patch [dwlmsg](https://codeberg.org/notchoc/dwlmsg) can also be used.

Additionally to this Suckless maintains a list of free and open-source software that is endorsed by
Suckless.
This list can be found on [Suckless' Website](https://suckless.org/rocks/).

## Setup

Programs written by the suckless community are minimal by default.
`.diff` files are available to patch functionality.
Configuring is done in the `config.h` file.
Expressions in `<>` may need replacement.

- If not already created initialize a git repository
- Create and switch to the `base` brach with `git branch base`
- Download the default version of the suckless program you want to patch
- Add and commit all the files in the `base` branch
- Clean the master branch
with `make clean & rm -f config.h & git reset --hard origin/base`
- Apply patches (this has to be done only once for each branch (except updates))
  - Create and switch to a new branch for the patch with `git branch <feature>`
  - Download the `.diff` file of the according feature into your directory
  - Apply the patch to the current directory with `git apply <feature>.diff`
  - Add and commit all the files in the `<feature>` branch
- Merge all branches into master branch (sometimes you can skip already merged
ones)
  - Merge each branch (except the new feature) into master with `git merge <feature>`
    - (maybe you have to manually merge some errors)
- If you have a `config` branch merge `config` into `master` before adding the
new `feature`
- Finally update the `config` branch
  - If not created already create a `config` branch from the `base` branch
  - Get the `config.def.h` of `master` into `config` with
  `git checkout master config.def.h`

## Troubleshooting

This section addresses various errors that can happen when using suckless programs.

### suckless program crashes or struggles with colored emojis

Suckless programs  especially `st` and `dmenu` can not display colored
emojis.
This is because of problems with libxft.
libxft is the client side font rendering library to display anti-aliased text.
To change this [libxft-bgra](https://github.com/uditkarode/libxft-bgra) needs
to be installed.
This is a patched version especially for running with the suckless programs.
