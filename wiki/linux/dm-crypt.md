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
