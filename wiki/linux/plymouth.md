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

If the splash screen option was selected set a default theme.
A more detailed guide on this is available in [another section](#list-install-and-set-themes).

```sh
plymouth-set-default-theme bgrt
```

Alternatively another theme than `fade-in` can be set.
The listing of installed themes is featured in a [latter section](#list-available-themes).

Then inside the file `/etc/mkinitcpio.conf` add the hook under the `HOOKS` section.
Add `plymouth` after `systemd` (if available) and before `encrypt` and `lvm2` (if available.)

Finally regenerate the initial ramdisk as described
[in the mkinitcpio entry](/wiki/linux/mkinitcpio.md#manually-generate-initial-ramdisk).
For this run the following command.

```sh
mkinitcpio -p linux
```

## Usage

This section addresses the location and 

### List, Install and Set Themes

A list of installed themes can be listed by running the following.

```sh
plymouth-set-default-theme --list
```

One of the listed themes can then be installed like the following command does.
`<theme>` needs to be replaced with a theme that is included in the listed themes (like `fade-in`).

```sh
plymouth-set-default-theme <theme>
```

If this command is run the
[initramfs needs to be rebuild](/wiki/linux/mkinitcpio.md#manually-generate-initial-ramdisk).
A command that includes the rebuilding process is the following.

```sh
plymouth-set-default-theme -R <theme>
```

Other themes can be found in online sources like the
[AUR](/wiki/linux/arch-linux.md#package-manager-and-aur) or websites like
[Gnome-Look.org](https://www.gnome-look.org/browse?cat=108).
