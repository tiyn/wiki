# DM-Crypt

`dm-crypt` can create and manage encrypted devices.

## Creating an encrypted devices

To create a encrypted device simply run:
`cryptsetup -y -v luksFormat /dev/sda2`.
Where `/dev/sda2` is the device you want to create.
