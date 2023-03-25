# DM-Crypt

DM-Crypt can create and manage encrypted devices.

## Usage

### Creating an Encrypted Devices

To create a encrypted device simply run:
`cryptsetup -y -v luksFormat /dev/sda2`.
Where `/dev/sda2` is the device to be created.

### Create/Add a Key File to an encrypted volume

First a key file has to be created.
With the following lines a random file will be created that will later be used
as the key file.
If a key file already exists this part can be skipped.
The following command needs to be adapted.
It will create a key of bitlength 2048 (512 x 4).

```txt
dd bs=512 count=4 if=/dev/random of=<path to destination>
```

It is possible to increase the length to get a stronger key file.
Alternatively strong LUKS keys can be created using [OpenSSL](./openssl.md)
using  a bitlength of 4096:
`openssl genrsa -out <path to destination> 4096`.
The key file will then be saved  to `<path to destination>`.

Finally the key file can be added to an opened LUKS encrypted volume by running
the following command:
`cryptsetup luksAddKey <path to LUKS volume> <path to key file>`.

`<path to LUKS device>` is the encrypted device (for example `/dev/sda2`) and
`<path to key file>` is the location of the key file.

### Resize a LUKS Encrypted Volume

If volume groups on the encrypted volume are opened make sure to close them
with the following command modified to the present needs:
`vgchange -a n <volume group>`

Open the encrypted volume:
`cryptsetup luksOpen <path to LUKS volume> <mapper location>`.
`<path to LUKS device>` is the encrypted device (for example `/dev/sda2`) and
`<mapper location>` is where it will be mapped to with `dev/mapper/` prepended.

Now resize the encrypted volume to all available space of the partition.
If the encrypted volume should not be extended to the whole partition
or the partition is too small for its intended purposes, make sure to resize the
partition first accordingly (see [disk management](./disk-management.md)).
`cryptsetup resize crypt-volume`

### Open/Close an Encrypted Volume

To open and map a device using a set password run
`cryptsetup luksOpen <path to LUKS device> <mapper location>` where
`<path to LUKS device>`  is the encrypted device (for example `/dev/sda2`) and
`<mapper location>` is  where it will be mapped to with `dev/mapper/` prepended.
Using `secret` as a `<map location>` the opened drive is available at
`/dev/mapper/secret`.

Alternatively an encrypted volume can be decrypted using
[a key file](#createadd-a-key-file-to-an-encrypted-volume) if set up for it.
This can be achieved by running:
`cryptsetup luksOpen <path to LUKS volume> crypt-volume --key-file=<key file location>`.
`<path to LUKS device>` is the encrypted device (for example `/dev/sda2`).

Afterwards it can be closed by running `cryptsetup close /dev/mapper/crypt0`.

### Creating/Add a USB Decryption Key

This guide assumes an Arch Linux System, as installed in
[this wikis arch linux installation](./arch-linux/installation.md).
This section is based on entries from the
[arch linux forum](https://forum.archlinux.de/d/28886-systementschluesselung-per-usb-stick).
It uses a similar technique to the decryption of the encrypted volume via
[a key file](#createadd-a-key-file-to-an-encrypted-volume).

Insert the USB stick.
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
For this check the `serial` and `product` of the USB stick with the following
commands.

```sh
udevadm info -a -p `udevadm info -q path -n /dev/sde` | grep ATTRS{serial}
udevadm info -a -p `udevadm info -q path -n /dev/sde` | grep ATTRS{product}
```

The first line gives the `serial`, the second the `product`.
The `product` should match the USB stick.

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

With the following command an encrypted device can be decrypted with the usb
stick.
Use this to confirm the correct setup of the decryption key and the encrypted
device.
Make sure to edit `--key-file`, `--keyfile-offset` and `--keyfile-size` to
match the settings used in the creation of the USB key.

```sh
cryptsetup luksOpen /dev/sda2 crypt-volume --key-file=/dev/usbkey --keyfile-offset=14848 --keyfile-size=2048
```

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

### Automatical Mounting of an Encrypted Volume

For automatic mounting of an encrypted volume a keyfile is needed.
This will be achieved by entries in the file`/etc/fstab` aswell as the file
`/etc/crypttab`.
First adapt and insert the following lines into `/etc/fstab`:

```txt
/dev/mapper/<mapping location>    <mount location>       ext4    defaults   0 0
```

`<mapping location>` is a freely choosable identificator and while the
`<mount location>` is an existing directory for the volume to be mounted on.

Additionally the following lines has to be adapted and added to the file
`/etc/crypttab`:

```txt
<mapping location>    UUID=<UUID of encrypted volume>           <location of key file>
```

`<mapping location>` has to be the same as chosen in the step before.
`<UUID of encrypted volume>` is the
[universally unique identifier](/wiki/linux/disk-management.md#universally-unique-identifier)
of the volume.
`<location of key file>` describes the location where to find the key file
created in the previous step.
