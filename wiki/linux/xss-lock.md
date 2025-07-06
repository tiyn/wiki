# xss-lock

xss-lock is an external screen locker for [X11 Window Systems](/wiki/linux/x_window_system.md).
Using xwayland it can also be used for [Wayland](/wiki/linux/wayland.md) systems.

## Setup

On most Linux distributions swayidle can be installed with the `xss-lock` package.

## Usage

To run xss-lock it has to be called - preferably after the boot process.
An example of this will look like the following.
This command makes the system use `swaylock` if the system is put to
[sleep](/wiki/linux/systemd.md#change-suspend-and-hibernate-behaviour).

```sh
xss-lock -- swaylock
```
