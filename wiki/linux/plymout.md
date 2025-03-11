# Plymouth 

[Plymouth](https://www.freedesktop.org/Software/Plymouth) is a software that provides a better
graphical boot process.
It can change the native resolution early in the boot process and display splash screens.

## Setup

On most linux distributions LightDM can be installed with the `plymouth` package.

Afterwards the kernel options need to be changed.
On [Arch Linux](/wiki/linux/arch-linux.md) systems this can be done by editing the file located at
`/boot/loader/entries/arch.conf`.
In the options line append `quiet` if you want to use the quiet-mode and `splash` if you want to 
add a splash screen.

If the splash screen option was selected edit the file `/etc/plymouth/plymouthd.conf` and ensure it
looks like the following lines.

```txt
[Daemon]
Theme=fade-in
```

Then inside the file `/etc/mkinitcpio.conf` add the hook under the `HOOKS` section.
Add `plymouth` after `systemd` (if available) and before `encrypt` and `lvm2` (if available.)

Finally regenerate the initial ramdisk as described
[in the mkinitcpio entry](/wiki/linux/mkinitcpio.md#manually-generate-initial-ramdisk).
For this run the following command.

```sh
mkinitcpio -p linux
```
