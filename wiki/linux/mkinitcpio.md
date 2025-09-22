# mkinitcpio

`mkinitcpio` is a script to create an initial ramdisk environment.
This environment provides the [Linux](/wiki/linux.md) kernel, containing essential drivers and
utilities required at boot.

## Kernel Versions

There are a few possible kernel version that can be used by `mkinitcpio`.

### Stable-Version: `linux`

The stable version of the [Linux](/wiki/linux.md) kernel can usually be found in a package called
`linux` and is usually installed from the start or in the recommended setup.

### Zen-Version: `linux-zen`

The zen kernel is a collaborative project of kernel hackers to provide the best
[Linux](/wiki/linux.md) kernel for everyday systems.
Especially the response time of the system under load
[is said to be better](https://github.com/zen-kernel/zen-kernel/wiki/Detailed-Feature-List#zen-kernel-improvements).
This will - for example - make the system less stuttery when something is compiled.
Desktop and gaming systems will benefit the most.

To setup the zen kernel do the following. Firstly install the packages `linux-zen` and
`linux-zen-header`.
Afterwards open the file `boot/loader/entries/arch.conf` and change the following lines. 

```txt 
linux /vmlinuz-linux
initrd /initramfs-linux.img
```

To look like the following lines.

```txt
linux /vmlinuz-linux-zen
initrd /initramfs-linux-zen.img
```

If you want to switch the backup to Zen too, the backup file in `boot/loader/entries/` has to be
changed too.
Afterwards the system should be rebooted for the change to take effect.

## Usage 

The following addresses various usage and configuration choices for mkinitcpio.

### Default and Fallback Images

It is recommended to have at least one default and one fallback version for kernels.
After the initial generation of the kernel the configuration file can be found in the
`/etc/mkinitcpio.d` directory.
For the [`linux`-kernel](#stable-version-linux) it would contain `linux.preset` and for the
[`linux-zen`-kernel](#zen-version-linux-zen) `linux-zen.preset`.
Inside these preset files the following line manages the generation of a default or fallback image.

```txt
PRESETS=('default'  'fallback')
```

Notice that the options are separated only by a space.
To just build a fallback image remove `'default'` or vice versa.

Afterwards the initial ramdisk has to be [rebuild](#manually-generate-initial-ramdisk).

### Manually Generate Initial Ramdisk

The following command will (re-)generate the initial ramdisk by a preset, which in this case is
`linux`.

```sh
mkinitcpio -p linux
```

Usually this command is the only one needed.
But it is also possible to (re-)generate all available presets with the following command.

```sh
mkinitcpio -P
```

### Enable/Disable Compression

To save space on the boot partition the kernel images can be compressed.
To enable compression activate it in `/etc/mkinitcpio.conf` under `COMPRESSION=`.
In the configuration file some compression algorithms are recommended.
Additionally compression options can be set under `COMPRESSION_OPTIONS=`.
An easily usable example for this is the following line.

```txt 
COMPRESSION_OPTIONS=(-v -5 --long)
```

To disable compression remove the corresponding lines.
After enabling and disabling of the compression the initial ramdisk has to be
[rebuild](#manually-generate-initial-ramdisk).

## Troubleshooting

This section addresses various errors that can happen when using mkinitcpio.

### `'/lib/modules/xxxxxxx' is not a valid kernel module directory`

When you encounter an error like the header of this section when running
`mkinitcpio` try first to reinstall the `linux`, `linux-headers` and
`filesystem` packages.
If that does not fix it continue.
Look into the `/lib/modules` directory.
There should be a directory called `4.9.8-1-ARCH` or similar.
Now run `mkinitcpio -k 4.9.8-1-ARCH -g /boot/image.img` and move the image
to the correct location `/boot/initramfs-linux.img` in the boot directory (back
up the old one).
After that reboot and it should again work fine (Source:
[Unix Stackexchange](https://unix.stackexchange.com/questions/395402/lib-modules-4-9-8-1-arch-is-not-a-valid-kernel-module-directory)).

### `WARNING: Possibly missing firmware for module: ...`

If the warning `WARNING: Possibly missing firmware for module: ...` is shown during the process of
rebuilding the initramfs there is a firmware package missing.
It is not necessarily needed to install them but is recommended for the hardware to run correctly.
A simple table that shows firmware modules and corresponding
[Arch Linux](/wiki/linux/arch-linux.md) packages is shown on the
[Arch Linux wiki](https://wiki.archlinux.org/title/Mkinitcpio#Possibly_missing_firmware_for_module_XXXX).

### `No space left on device`

If this error or one similar to this is shown the boot partition is filled up completely during the
generation of the initial ramdisk.
This can be fixed by either [compressing the image](#enabledisable-compression) or by 
[disabling unused fallbacks](#default-and-fallback-images).

### `WARNING: Possibly missing firmware for module`

If the warning `WARNING: Possibly missing firmware for module` is shown a firmware package is
missing for the hardware of the system.
Though it is not neccessary it is recommended to install ist.
To check which firmware package is needed for which firmware module check
[the Arch Linux wiki](https://wiki.archlinux.org/title/Mkinitcpio#Possibly_missing_firmware_for_module_XXXX).
