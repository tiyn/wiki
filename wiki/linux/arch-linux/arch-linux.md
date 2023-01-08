# Arch Linux

[Arch Linux](https://archlinux.org/) is a rolling-release, general-purpose Linux
distribution.
Arch Linux uses the [pacman](./pacman_and_yay.md) package manager.
The Arch User Repositories (AUR) features community-made packages that can be
installed with different
[package manager that inlcude access to the AUR](/wiki/linux/arch-linux/pacman_and_yay.md).

## Installation Medium

For the installation usage of a simple USB key is advised.
This has to be flashed with the Arch ISO.
The ISO file can be found on the
[official website](https://www.archlinux.org/download/).
The iso can be written on an USB-stick using the command
`dd bs=4M if=<path to ISO> of=/dev/sdx conv=fsync oflag=direct status=progress`.
`<path to ISO>` points the command to the location of the ISO file
