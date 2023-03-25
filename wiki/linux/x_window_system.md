# X Window System

X Window System - also called X and X11 according to the current version - is a
protocoll for handling the display of the most unix-like operating systems.
[Xorg](https://www.x.org/wiki/) is the most used implementation of the X
protocoll.
It is maintained by the [X.Org Foundation](https://x.org/wiki/).

## Peripheral Devices

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

### Keyboard

This section describes the handling of keyboards by X.

#### Change Keyboardlayout

To temporarily change the layout of the keyboard just run
`setxkbmap <your preferred layout>`.
For a permanent change run `localectl set-x11-keymap <your preferred layout>`.

### Display

This section describes the handling of displays by X.
Additionally to the guides in this section that are independent of the used
graphics unit special configuration for [Nvidia](/wiki/linux/nvidia.md)
and [Intel](./intel.md) can be found in their respective entries in this wiki.

#### Screen Blanking

To save power the screen is set to turn black after a given amount of time.
This can be disabled temporarily by running `xset s off` or permanently by
adding the following lines to your `/etc/X11/xorg.conf`:

```txt
Section "ServerFlags"
    Option "BlankTime" "0"
EndSection
```

### Mouse

This section describes the handling of mouse by X.

#### Emulation of the Middle Mouse Button

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
