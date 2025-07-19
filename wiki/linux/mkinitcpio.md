# mkinitcpio

`mkinitcpio` is a script to create an initial ramdisk environment.

## Usage

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

