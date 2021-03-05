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
