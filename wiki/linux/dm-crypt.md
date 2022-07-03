# DM-Crypt

`dm-crypt` can create and manage encrypted devices.

## Creating an encrypted devices

To create a encrypted device simply run:
`cryptsetup -y -v luksFormat /dev/sda2`.
Where `/dev/sda2` is the device you want to create.

## Open an encrypted device

To open and map a device run `cryptsetup -y -v luksFormat /dev/sda1 crypt0` where
`/dev/sda1` is your encrypted device and `crypt0` is where it will be mapped to
with `dev/mapper/crypt0`.

## Resize a LUKS encrypted volume

If you have volume groups on the encrypted volume make sure to close them
with the following command modified to your needs:
`vgchange -a n <volume group>`

Open the encrypted volume (assuming its stored at `/dev/sda2` and you map it
to `crypt-volume`):
`cryptsetup luksOpen /dev/sda2 crypt-volume`

Now resize the encrypted volume to all available space of the partition.
If you don't want to extend the encrypted volume to the whole partition
or the partition is to small for your purposes, make sure to resize the
partition first accordingly (see [disk management](./disk-management.md)).
`cryptsetup resize crypt-volume`

## Creating an automatic encryption key with an USB stick

This guide assumes you to have an Arch Linux System, as installed in
[this wikis arch linux installation](./arch-linux/installation.md).
This section is based on entries from the
[arch linux forum](https://forum.archlinux.de/d/28886-systementschluesselung-per-usb-stick).

Insert your USB stick.
This guide will assume its address is `/dev/sde`.

Fill in the first sectors (in this case 94, make sure this number is bigger
than skip sector count and size sector count combined) stick with a random
sequence:
`dd if=/dev/urandom of=/dev/sde bs=512 seek=1 count=94`.
Save the key to a keyfile (with offset 14848 = 29 x 512 and
keysize 2048 = 4 x 512):
`dd if=/dev/sde bs=512  skip=29 count=4 > key.bin`.

Add the keyfile to the encrypted partition (assuming the dm-crypted device is
called `/dev/sda2`):
`cryptsetup luksAddKey /dev/sda2 key.bin`.

Next it has to be made sure that the decryption key, is available at the same
position every time.
For this check the `serial` and `product` of your USB stick with the following
commands.

```sh
udevadm info -a -p `udevadm info -q path -n /dev/sde` | grep ATTRS{serial}
udevadm info -a -p `udevadm info -q path -n /dev/sde` | grep ATTRS{product}
```

The first line gives the `serial`, the second the `product`.
The `product` should match your USB stick.

After this create a file at `/etc/udev/rules.d/50-usbkey.rules` with the
following content.
Assuming the `serial` is `14AB0000000096`.

```txt
SUBSYSTEMS=="usb", ATTRS{serial}=="14AB0000000096", KERNEL=="sd*", SYMLINK+="usbkey%n"
```

Then reload the udev rules by running:
`udevadm control --reload-rules`.

Unplug the stick and plug it back in.
It should be available under `dev/usbkey`.

After that make sure in `/etc/mkinitcpio.conf` under the `HOOKS` section
`keymap encrypt lvm2` are written before `filesystems`.
Add `/etc/udev/rules.d/50-usbkey.rules` under the `FILES` section.

Then modify `/boot/loader/entries/arch.conf` and add
`cryptkey=/dev/usbkey:14848:2048` to the
end of the `options` line.

Finally run:
`mkinitcpio -p linux`.

Reboot the system with `reboot`.
Make sure the USB key for decryption is plugged in.
If so the encrypted partition should be decrypted automatically.
