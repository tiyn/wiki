# mkinitcpio

`mkinitcpio` is a script to create an initial ramdisk environment.

## Troubleshooting

### '/lib/modules/xxxxxxx' is not a valid kernel module directory

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
