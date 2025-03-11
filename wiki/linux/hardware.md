# Hardware 

This entry focusses on various hardware components of a desktop PC or a laptop.

## Battery 

The battery of a notebook can be inspected by using the `upower` command.
To use it the tool needs to be installed.
In most [Linux](/wiki/linux.md) distributions this is bundled in a package of the same name.
A usage example is shown in the following command.
It will show the state, voltage, percentage and many other information about a given battery.

```sh
upower -i /org/freedesktop/UPower/devices/battery_BAT0
```

## (Liquid) Coolers

The viewing of temperatures of coolers aswell as the selection of RGB-settings can be achieved by
using [liquidctl](https://github.com/liquidctl/liquidctl).
