# Flatpak

Flatpak is a cross-distribution package manager for linux systems.

## Setup

The `flatpak` package can be installed by most distribution specific package
managers (e.g. [pacman or yay](./arch-linux/pacman_and_yay.md)).
After installation it is important to add [flathub](https://flathub.org/home),
a source for many flatpak packages.
The addition of this can be done by running
`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`.

## Installing software

When software installation is done with Flatpak it is recommended to pass the
`--user` so the software is not installed system-wide but for the user only.
In practice it looks like the following:
`flatpak install --user <package to install>`.

## Running software

Software installed via flatpak can be run by typing the full package path into
the command line, for example `com.makemkv.MakeMKV`.
