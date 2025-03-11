# X Window System

X Window System - also called X and X11 according to the current version - is a
protocoll for handling the display of the most unix-like operating systems.
[Xorg](https://www.x.org/wiki/) is the most used implementation of the X
protocoll.
It is maintained by the [X.Org Foundation](https://x.org/wiki/).

## Usage

This section addresses various usages of the X Window System.

### Display Managers

[Display managers](/wiki/linux/display_managers.md) are user interfaces displayed after booting.
They are featured in a [separate entry](/wiki/linux/display_managers.md).
This also includes any configuration needed for it like `xsession`.

### Screen Locker

The X Window System allows various screen lockers to be used.
One of them is `slock` by [suckless](/wiki/linux/suckless.md).
This will stand in as a screen locker for this section.
The screen can be run by simply running the following command.

```sh 
slock
```

By default this will not be run automatically when the computer goes into sleep.
This can be changed by installing and using `xss-lock` like the following example shows.

```sh 
xss-lock -- slock &
```

Run this command at startup if the automatic locking is wanted.

In this context it can be useful to enable the screensaver or set the computer to automatically go
to sleep after a certain amount of time.
For this navigate to the [corresponding section](#turning-off-the-screen).

### Kill Windows

Windows can be killed with the utility `xkill`.
Depending on the [distribution](/wiki/linux.md#distributions) used it maybe has to be installed.
It often is bundled in a package named `xorg-xkill`.
By running `xkill` the mouse cursor will turn into an x.
With the mouse the window to close can then be selected.

### Peripheral Devices

X also handles various options of peripheral devices.
In the files of the directory `/etc/X11/xorg.conf.d` and the file
`/etc/X11/xorg.conf` these settings can be found.

The handling of input devices is achieved by xinput.
For this the identifier of the device to show the options of is needed.
By running `xinput list` a list of all devices with identifiers handled by
xinput is printed.
Properties and options of a peripheral device can then be shown by running
`xinput list-props <id>` where `<id>` is the identifier of the
device.

#### Touchpad

This section describes the handling of touchpads by X.

##### Toggle the touchpad

To toggle the touchpad on or off
[a simple script](https://github.com/tiyn/dotfiles/blob/master/.local/bin/tools/dwm/toggletouchpad)
can be used that uses `synclient TouchpadOff=1` or `synclient TouchpadOff=0`.
This requires `xf86-input-synaptics` which is a synaptics driver for
notebook touchpads.

##### Enable Tap to Click 

On Touchpads the tap to click option can be enabled by adding the following lines to the config
file `/etc/X11/xorg.conf.d/99-synaptics-overrides.conf`.

```txt
Section "InputClass"
    Identifier  "touchpad overrides"
    MatchDriver "synaptics"
    Option      "TapButton1"            "1"
EndSection
```

#### Keyboard

This section describes the handling of keyboards by X.

##### Change Keyboardlayout

To temporarily change the layout of the keyboard just run
`setxkbmap <your preferred layout>`.
For a permanent change run `localectl set-x11-keymap <your preferred layout>`.

If there are two main layouts are used then the following command can be used to switch between
them.
Change `<layout 1>` and `<layout 2>` according to preferences.

`setxkbmap -query | grep -q '<layout 1>' && setxkbmap <layout 2> || setxkbmap <layout 1>

Using [SXHKD](/wiki/linux/sxhkd.md) a hotkey can be setup to seamlessly transition between the two
layouts.

#### Display

This section describes the handling of displays by X.
Additionally to the guides in this section that are independent of the used
graphics unit special configuration for [Nvidia](/wiki/linux/nvidia.md)
and [Intel](./intel.md) can be found in their respective entries in this wiki.

##### Turning Off the Screen

To save power the screen is set to turn black after a given amount of time.
Adding the following lines to your `/etc/X11/xorg.conf.d/dpms.conf` will permanently enable screen
blanking.

Configure the times of the following section (both `10` minutes at the moment) and add it to the
`ServerFlags` option of the file `/etc/X11/xorg.conf.d/dpms.conf` or alternatively add them into the
file `/etc/X11/xorg.conf`.
Set the time to `0` for disabling the turning off of the screen.

```txt
Section "ServerFlags"
    Option "OffTime" "10"
EndSection
```

This can be disabled temporarily by running `xset s off`.
The screen can also be turned off instantly with the command `xset dpms force off`.

If `OffTime` does not work add the following to the file `/etc/X11/xorg.conf.d/dpms.conf.

```txt
Section "ServerFlags"
  Option "BlankTime" "10"
EndSection
```

Another option to do this is by using the command `xset`.
An example for this are the follwing commands which will enable the screensaver to act upon 10
minutes of inactivity.

```sh 
xset s on 
xset s 600
```

For more informations on this visit the
[Arch wiki](https://wiki.archlinux.org/title/Session_lock#DPMS).

##### Adjust DPI and UI Scale

The dots per inch (DPI) is a measurement of spatial video dot density.
It has effect on the size of UI elements.
It is recommended to set the DPI inside the file `~/.config/xorg/xpcspec` with the following line.
The DPI number should be adjusted as needed.

```
Xft.dpi: 100
```

Afterwards `~/.config/xorg/xpcspec` needs to be sourced in the `~/.xinitrc` file.
For this to work the following line needs to be added into the `~/.xinitrc` file .

```sh
[ -f "$HOME/.config/xorg/xpcspec" ] && xrdb -merge "$HOME/.config/xorg/xpcspec"
```

#### Mouse

This section describes the handling of mouse by X.

##### Emulation of the Middle Mouse Button

If middle mouse button emulation is enabled the system will emulate a middle
mouse button click when clicking both left and right mouse button
simultaneously.
The middle mouse button emulation can be activated or deactivated.
First the current options have to be confirmed as explained in
[the peripheral section](#peripheral-devices).
Important is the property named `libinput Middle Emulation Enabled`.
To enable the usage of the middle mouse button it should be set to `1`.
As written by
[opinion_no9](https://askubuntu.com/questions/160164/how-do-i-enable-middle-mouse-button-emulation-in-12-04-lts/902976#902976)
there are two ways to change this property.
If the change is only needed temporarily
`xinput set-prop <id> "libinput Middle Emulation Enabled" <flag>` can be run.
`<id>` is the identifier of the mouse and <flag> is `0` for disabling and `1`
for enabling the middle mouse button.
For permanent change of the property a change or addition to
`/etc/X11/xorg.conf.d/40-libinput.conf` can be made.
If a section for the device is already present the line
`Option "MiddleEmulation" "true"` should be added to it.
Otherwise a catchall section for all types of mouses can be created like the
following:

```txt
Section "InputClass"
    Identifier "middle button emulation class"
    MatchIsPointer "on"
    Option "MiddleEmulation" "true"
EndSection
```
## Troubleshooting

This section addresses various errors that can happen when using the X window system.

### Error `Failed to initialize the NVIDIA kernel module`

When starting up the X server the error message `Failed to initialize the NVIDIA kernel module` can
appear.
This usually means that either the [Nvidia](/wiki/nvidia.md) kernel module is not installed.
This can be fixed by [installing Nvidia](/wiki/linux/nvidia.md#setup).
If this is not the problem then the [initial ramdisk](/wiki/linux/mkinitcpio.md) should be
[regenerated](/wiki/linux/mkinitcpio.md#manually-generate-initial-ramdisk).

### File Picker Doesn't Work

If the file picker doesn't work in applications like [Discord](/wiki/discord.md) for example first
check if the desktop portal is installed.
For that search for the package `xdg-desktop-portal` or a similar named one using your
[package manager](/wiki/linux/package_manager.md).
If it is installed check if it starts up correctly by using the command
`systemctl --user status xdg-desktop-portal` as described in the
[SystemD entry](/wiki/linux/systemd.md#startstopenabledisable-a-service-and-retrieve-its-logs).

A possible error is `cannot open display` as it was described and fixed by rockzombie2 and V1del in
an [Arch Linux](/wiki/linux/arch-linux.md)
[forum post](https://bbs.archlinux.org/viewtopic.php?id=294808).
To fix this you can run the following commands to temporarily make the file picker work.

```sh 
systemctl --user import-environment DISPLAY XAUTHORITY
systemctl --user restart xdg-desktop-portal
```

If that works make sure the Xorg configs are sourced for users aswell.
It is possible that the following code block is missing in the local `.xinitrc`.
This would create similar errors to the ones experienced.

```sh
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
```
