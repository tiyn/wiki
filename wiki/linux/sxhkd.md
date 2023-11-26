# SXHKD

[SXHKD](https://github.com/baskerville/sxhkd) - short for Simple
[X](/wiki/linux/x_window_system.md) hotkey daemon - is a program to set hotkeys.

## Setup

On most linux distributions SXHKD can be installed with the `sxhkd`
package.
Alternatively it can be installed via
[GitHub](https://github.com/baskerville/sxhkd).

## Usage

### Setting a Hotkey

Configuration for setting hotkeys is done in the file `~/.config/sxhkd/sxhkdrc`.
A hotkey corresponds to typically two, sometimes more lines within this
configuration file.
The first line describes the keys that act as hotkeys and the second line
describes the commands that are run on pressing the hotkey.

There are simple hotkeys using only one key (in this case the Launch Button).

```txt
XF86LaunchB
	xdotool selectwindow | xsel -bi
```

And some commands use modifier keys or multiple keys.

```txt
super + shift + equal
	sxiv -rt "$HOME/image"
```

When using similar commands it can be useful to map multiple hotkeys in one
entry.

```txt
super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}
```

### Reload Hotkey Daemon

To reload the configuration file SXHKD needs to be restartet
It can be useful to [set this on a hotkey](#setting-a-hotkey).

```
super + shift + x
    pkill -usr1 -x sxhkd
```
