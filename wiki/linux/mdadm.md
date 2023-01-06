# MDADM

`mdadm` is a utility to create and manage raid devices.

## Usage

### Get information about a raid

To get an info for a running raid (assuming it is `/dev/md0`) run
`mdadm -D /dev/md0`.

### Add disk/partition to raid device

You can add a disk or partition to a raid device by running the following.
It is assumed you are adding a partition called `/dev/sdd1` but it could also
be a whole drive and the mdadm drive is called `/dev/md0`.

`mdadm --add /dev/md0 /dev/sdd1`

### Raid 1

Raid 1 creates a mirror with even amount of drives.

#### Create raid 1 device

You can create a Raid 1 device with
`mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb`
where `sda` and `sdb` are the disks you want to include in your raid.
You can increase the number of raid devices, but they have to be at least 2.
If it is an uneven amount of disks in the raid, a disk will act as a spare disk.

#### Convert raid 1 to raid 5

Assuming the raid device is called `/dev/md0`.
All other drives are part of the `md0` raid device.

- Remove all drives but 2 by running `mdadm /dev/md0 --fail /dev/sda1` and
  `mdadm /dev/md0 --remove /dev/sda1` where `sda1` is the drive to remove
- Make sure your raid 1 array has only 2 active drives by running
  `mdadm --grow /dev/md0 -n 2`
- Now convert your raid 1 to a raid 5 device with `mdadm --grow /dev/md0 -l5`
- Add the disks you removed back to the raid with
  `mdadm /dev/md0 --add /dev/sda1`
- Finally grow the active drive number to your needs (in this example 4)
  `mdadm --grow /dev/md0 -n4`
- `mdadm` now reshapes the raid. You can monitor it by running
  `watch cat /proc/mdstat`
