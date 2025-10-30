# Hardware (Linux)

This entry focusses on various hardware components of a [Linux](/wiki/linux.md) desktop PC or a
laptop.
For non-Linux specific or general topics in hardware see the
[correspoding entry](/wiki/hardware_%28general%29.md)

## Battery 

The battery of a notebook can be inspected by using the `upower` command.
To use it the tool needs to be installed.
In most [Linux](/wiki/linux.md) distributions this is bundled in a package of the same name.

This section is based on [a video by eKiwi](https://youtu.be/t9KMFDTb79E) which addresses battery
health.

To find out about a battery, its name needs to be known, which can be done using the following
command.

```sh
upower -e
```

Afterwards different values like the state, voltage, percentage and many other can be displayed.
Additionally it will show the original capacity (`energy-full-design`) and the current capacity
(`energy-full`), which can be used to determine the health of the battery.
The following is an example command where `<battery-name>` is the name of the batter returned from
the previous step.
This might by similar to `/org/freedesktop/UPower/devices/battery_BAT0`.

```sh
upower -i <battery-name>
```

Alternatively `acpi` can be used to achieve similar but less information.
It will show the state, the percentage and the time to load or unload.
For this run the following command.

```sh
acpi -b
```

## Power Management

Tools, programs and guides to manage the power usage and improve battery life are described in the
[power management entry](/wiki/linux/power_management.md).

## (Liquid) Coolers

The viewing of temperatures of coolers aswell as the selection of RGB-settings can be achieved by
using [liquidctl](https://github.com/liquidctl/liquidctl).

## Temperature 

To check the temperature the command `sensors` can be used which (on most distributions) is a part
of the `lm_sensors` package.
It will then display all the available temperature sensors available aswell as many other sensors
like the RPM for fans.

## ThinkPad TrackPoint

This section is based on a
[Reddit comment by zedbraxmen](https://www.reddit.com/r/thinkpad/comments/wjb8qz/configuring_trackpoint_in_wayland/).

The sensitivity and speed of the classic trackpoint on ThinkPads can be changed using UDEV rules.
The following lines are an example for a potential file `.rules` located at `/etc/udev/rules.d/`.
It could look something like the following.
The values for sensitivity and speed could be adjusted.

```txt
ACTION=="add",    
SUBSYSTEM=="input",    
ATTR{name}=="TPPS/2 IBM TrackPoint",    
ATTR{device/sensitivity}="275",
ATTR{device/speed}="215",
```
