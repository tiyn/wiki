# Wayland

[Wayland](https://wayland.freedesktop.org/) is a replacement for the
[X11 window system](/wiki/linux/x_window_system.md).

## Compositors

The following is a list of Wayland compositors.

- [dwl](/wiki/linux/suckless.md) is a compositor which is similar to suckless' X11 window manager
  called dwm.
- [mango](https://github.com/mangowm/mango) is a feature-rich Wayland compositor built on dwl.

## Usage

This section addresses the usage of Wayland.

### Display wlroots Screens

To list all the attached screens and displays the following command can be used.
For this to work the compositor needs to use wlroots.

```sh
wlr-randr
```

## Troubleshooting

This section addresses problems that can occur when using Wayland and ways to solve them.

### Invisible Notifications and Pop-Ups

There is a chance that notifications and pop-ups are not displayed correctly at some time when
using Wayland.
To fix this the most simple way is to just restart the compositor that is currently used.
