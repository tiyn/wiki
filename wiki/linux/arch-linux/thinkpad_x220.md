# Thinkpad X220

These are a bunch of useful programs if you own a thinkpad X220.
This guide is done in collaboration with [rvbg.eu](https://wiki.rvbg.eu).

## Install Gfx drivers

`yay -S xf86-video-intel`

## Fan controlling

- `yay -S lm_sensors thinkfan` - Install the needed utilities

- `sudo modprobe thinkpad_acpi` - After that load the kernel module `thinkpad_acpi`

- `sudo cp /usr/share/doc/thinkfan/examples/thinkfan.conf.simple /etc/thinkfan.conf`
Copy and configure the config file

- `systemctl start thinkfan` - Start the thinkfan service

- `sudo thinkfan -n` - Check the output

`systemctl enable thinkfan.service` - enable the thinkfan service

## Change brightness via keyboard

- `sudo vim /boot/loader/entries/arch.conf` - Open the bootloader configuration
- Go to the `options` line.
Append the following.
`acpi_osi="!Windows 2012"`

- `shutdown -r now` - Reboot the system

## Activate battery options

- `yay -S tlp` - Install the service
- `yay -S acpi_call` - Enables battery charging stop at given capacity
- `sudo vim /etc/tlp.conf` - Open the battery options
- Change the following lines

```txt
START_CHARGE_THRESH_BAT0=80
STOP_CHARGE_THRESH_BAT0=90
```

The battery will start charging at 80 percent and stop charging at 90.

- `sudo tlp start` - Start service and save changed options
- `sudo systemctl enable tlp.service` - Enable the service

## Setup Thinkpad Dock

- `yay -S dockd` - Install the docking service
- `yay -S xrandr arandr` - Instll multimonitor tools
- Dock the system
- `arandr` - Setup the monitor configuration
- `dockd --config docked` - Save the changes (has to maybe be stopped by
`CTRL + C`)
- Undock the system
- `arandr` - Setup the monitor configuration
- `dockd --config undocked` - Save the changes (has to maybe be stopped by
`CTRL + C`)
- `systemctl enable acpid` - Activate ACPI listener
- `systemctl start acpid` - Start ACPI listener

Scripts to change configuration at docking/undocking

- For the docked configuration use `vim /etc/dockd/dock.hook`
- For the undocked configuration use `vim /etc/dockd/undock.hook`

## FN keys not working

If the fn keys are not working properly run
[a script](https://github.com/tiyn/dotfiles/blob/master/.local/bin/etc/fchange)
that changes the `sys/module/hid_apple/parameters/fnmode` file.
This toggles between the two different fn key functions.

## Toggle the touchpad

To toggle the touchpad on or off
[a simple script](https://github.com/tiyn/dotfiles/blob/master/.local/bin/tools/dwm/toggletouchpad)
can be used that uses `synclient TouchpadOff=1` or `synclient TouchpadOff=0`.
This requires `xf86-input-synaptics` which is a synaptics driver for
notebook touchpads.
