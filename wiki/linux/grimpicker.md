# grimpicker

[grimpicker](https://man.archlinux.org/man/grimpicker.1.en) is a color picker for
[Wayland](/wiki/linux/wayland.md) compositors based on wlroots.
It uses `grim` and `slurp` to select colors from the screen.

## Setup

grimpicker is part of [sway-contrib](https://github.com/OctopusET/sway-contrib).
On [Arch Linux](/wiki/linux/arch-linux.md) it can be installed using the
[package manager](/wiki/linux/package_manager.md) with the `sway-contrib` package.
The tools `grim` and `slurp` are required.

## Usage

This section addresses the usage of grimpicker.

### Selecting a Color

The selected color can be copied to the clipboard using the following command.
For this `wl-clipboard` has to be installed.

```sh
grimpicker --copy
```
