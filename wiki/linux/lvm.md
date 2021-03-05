# LVM

`lvm` is a utility to create logical volumes.

## Create VG for proxmox

We will use `/dev/sdb` as our drive.
Setup the disk for the physical volume with `sgdisk -N 1 /dev/sdb`.
Then create the physical volume `pvcreate /dev/sdb`.
The previous step can come to a halt when the device already contains an old
partition table and will display the error `Device /dev/sdb excluded by a filter`.
This can be solved by removing the old partition table with `wipefs -a /dev/sdb`.
And finally create the volume group `vgcreate vmdata /dev/sdb`.
Then follow the guide in proxmox on how to connect a `vg` to proxmox.
