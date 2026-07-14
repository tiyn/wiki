# Wayland

[Wayland](https://wayland.freedesktop.org/) is a replacement for the
[X11 window system](/wiki/linux/x_window_system.md).

## Setup

For Wayland to work properly the following is needed.

- a Wayland [compositor](#compositors)
- `wayland`
- `wayland-protocols`
- optionally `xwayland` for running [X11](/wiki/linux/x_window_system.md) applications
- optionally `xdg-desktop-portal` and a suitable backend (e.g. `xdg-desktop-portal-wlr`) for screen
    sharing and desktop integration

Wayland is then started via the Compositor.

When migrating from X11 to Wayland additional steps may have to be taken.
Since the start is done via the compositor some settings – especially potential `startx` statements
in the `.profile` or other files that are run on login (e.g. by [systemd](/wiki/linux/systemd.md))
to start X11 need to be removed.
In the correponding places statements to start the Wayland compositor may be put.

## Statusbar

This section focuses on Wayland statusbars.

### Waybar

Waybar is a simple status bar which in most [Linux distributions](/wiki/linux.md#distributions) can
simply be installed via the [package](/wiki/linux/package_manager.md) `waybar`.
It can then be started using the `waybar` command after choosing the settings inside
`.config/waybar`.

## Compositors

The following is a list of Wayland compositors.

- [dwl](/wiki/linux/suckless.md) is a compositor which is similar to
    [suckless'](/wiki/linux/suckless.md) X11 window manager called dwm.
    To make dwl start additional software the `-s` flag followed by a [shell](/wiki/linux/shell.md)
    file can be used.
    This will run all commands within the file.
    An example may look similar to `dwl -s ~/.config/wayland/wayland.conf`.
    For toggling the touchpad the patch called
    [inputdevicerules](https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/inputdevicerules/inputdevicerules-v0.6.patch)
    can be used.
- [mango](https://github.com/mangowm/mango) is a feature-rich Wayland compositor built on dwl.

## Programs

This section contains Wayland-native alternatives to common X11 programs.

Further alternatives can be found in the
[Sway migration guide](https://github.com/swaywm/sway/wiki/i3-Migration-Guide).

### Background

`swaybg` can be used to set the desktop background.

### Hotkey Daemon

`swhkd` is a Wayland alternative to [sxhkd](/wiki/linux/sxhkd.md).

After installation create the configuration file
`~/.config/swhkd/swhkdrc` and mark the binary as setuid.

```sh
sudo chmod u+s $(which swhkd)
```

The daemon can then be started using

```sh
swhks && swhkd
```

### Lock Screen

`swaylock` can be used as a lock screen.

Configuration is stored in `~/.config/swaylock/config`.

A lock screen can then be activated using

```sh
swaylock
```

### Idle Daemon

`swayidle` is a Wayland replacement for idle management.

### Screenshots

Wayland screen capture can be achieved using

- `grim` for taking screenshots
- `slurp` for selecting a region
- `wl-clipboard` for clipboard integration

Together these can replace tools such as `maim`.

### Display Configuration

`wlr-randr` can be used instead of `xrandr` for wlroots-based compositors.

Many Wayland compositors configure displays automatically, making manual configuration unnecessary
in many cases.

### Input Events

`wev` is a Wayland alternative to `xev`.

### Window Information

The functionality of `xprop` can be replaced by a combination of `lswt`, `wlrctl`
(`wlrctl toplevel list`) as well as compositor-specific IPC interfaces.

### Color Temperature

`wlsunset` provides functionality similar to `redshift`.

### Image Viewer

[imv](https://sr.ht/~exec64/imv/) is a Wayland-native [image viewer](/wiki/image.md#viewer) and can
be used instead of `sxiv`.

### Desktop Managers

There are many [display managers](/wiki/linux/display_managers.md) which support Wayland
compositors.
[LightDM](/wiki/linux/lightdm.md) is especially easy to use and the corresponding entry contains a
[setup section for dwl](/wiki/linux/lightdm.md).

## Usage

This section addresses the usage of Wayland.

### Display wlroots Screens

To list all the attached screens and displays the following command can be used.
For this to work the compositor needs to use wlroots.

```sh
wlr-randr
```

### Setup Screen Capture

Many Wayland applications access [screen capture](/wiki/screen_capture.md) or
[sharing](/wiki/screen_sharing.md) through `xdg-desktop-portal`.
This setup is required by applications such as [Discord](/wiki/discord.md) and [OBS](/wiki/obs.md).

Install the following packages.

- `xdg-desktop-portal-gtk`
- `xdg-desktop-portal-wlr`
- `qt5-wayland`
- `qt6-wayland`

Set the following environment variables.

```sh
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=wlroots
```

Import the variables into the user systemd instance during startup.

```sh
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
```

Create the file `~/.config/xdg-desktop-portal/portals.conf` with the following contents.

```ini
[preferred]
default=gtk
org.freedesktop.impl.portal.Screenshot=wlr
org.freedesktop.impl.portal.ScreenCast=wlr
```

Afterward, restart the system.
Then screen capture and sharing should be available.

## Troubleshooting

This section addresses problems that can occur when using Wayland and ways to solve them.

### Invisible Notifications and Pop-Ups

There is a chance that notifications and pop-ups are not displayed correctly at some time when
using Wayland.
To fix this the most simple way is to just restart the compositor that is currently used.
