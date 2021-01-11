# MDADM

`mdadm` is a utility to create and manage raid devices.

## Raid 1

Raid 1 creates a mirror with even amount of drives.

### Create Raid 0 device

You can create a Raid 0 device with
`mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb`
where `sda` and `sdb` are the disks you want to include in your raid.
You can increase the number of raid devices, but they have to be at least 2.
If it is an uneven amount of disks in the raid, a disk will act as a spare disk.
