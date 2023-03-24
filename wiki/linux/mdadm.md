# MDADM

MDADM is a utility to create and manage raid devices.
For the rest of this entry `n` is the number of drives inside a raid device.

## Usage

### Get Information About a Raid

To get an info for a running raid (assuming it is `/dev/md0`) run
`mdadm -D /dev/md0`.

### Add Disk/Partition to Raid Device

You can add a disk or partition to a raid device by running the following.
It is assumed you are adding a partition called `/dev/sdd1` but it could also
be a whole drive and the mdadm drive is called `/dev/md0`.

`mdadm --add /dev/md0 /dev/sdd1`

This will add the disk as spare to the existing raid.
To make the disk active the raid needs to be grown as described in the
[regarding article](#growing-raid-device).

### Growing Raid Device

Growing a raid device will increase its number of active drives.
[Check the number of active drives](#get-information-about-a-raid).
Then change and run the following command accordingly.

```sh
mdadm --grow --raid-disks=5 /dev/md0
```

`/dev/md0` is the raid device.
`5` is the number of disks that should be active.
For adding disks view the [previous section](#add-diskpartition-to-raid-device).

### Raid 1

Raid 1 creates a mirror with even amount of drives.
For `n=2` [raid 5](#raid-5) and raid 1 are basically the same.
The space efficiency is `1/n` and the fault tolerance is `n-1` drive failure.
The read perfromance is `n` and the write performance `1`.

#### Create Raid 1 Device

You can create a Raid 1 device with
`mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb`
where `sda` and `sdb` are the disks you want to include in your raid.
You can increase the number of raid devices, but they have to be at least 2.
If it is an uneven amount of disks in the raid, a disk will act as a spare disk.

#### Convert Raid 1 to Raid 5

Assuming the raid 1 device is called `/dev/md0`.
All other drives are part of the `md0` raid device.
Note that mostly raid 1 devices consisting of 2 drives should be converted to
[raid 5](#raid-5).

- Remove all drives but 2 (if there are more drives than that) by running
  `mdadm /dev/md0 --fail /dev/sda1` and `mdadm /dev/md0 --remove /dev/sda1`
  where `sda1` is the drive to remove
- Make sure your raid 1 array has only 2 active drives by running
  `mdadm --grow /dev/md0 -n 2`
- Now convert your raid 1 to a raid 5 device with `mdadm --grow /dev/md0 -l5`
- Add the disks you removed back to the raid with
  `mdadm /dev/md0 --add /dev/sda1`
- Finally grow the active drive number to your needs (in this example 4)
  `mdadm --grow /dev/md0 -n4`
- MDADM now reshapes the raid. You can monitor it by running
  `watch cat /proc/mdstat`

### Raid 5

Raid 5 creates a raid device with distributed parity and is set to have at least
3 drives.
The space efficiency is `1-(1/n)` and the fault tolerance is `1` drive failure.
The read perfromance is `n` and the write performance `1/4` for single sector
and `n-1` for full stripe.

In the special case of 2 drives in a raid 5 it is functionally the same as
[raid 1](#raid-1).
