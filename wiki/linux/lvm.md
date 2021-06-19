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

## Add Drive to existing volume group

First format the disk so that it has one partition (we will assume its called
`/dev/sdc1`).
To add the partition to a group run:

```shell
pvcreate /dev/sdc1
vgextend <name of your volume group> /dev/sdc1
```

## Increase size of a logical volume

To increase the size of the logical volume you need to have free space in the
according volume group. You can check that by running: `vgdisplay`.
Then run:

```shell
lvextend -L +<size (e.g. 40G)> /dev/<volume groupt>/<logical volume>
```

If you want to allocate all the free space existing in a volume group run:

```shell
lvextend -l +100%FREE /dev/<volume group>/<logical volume>
```

Now you need to extend the filesystem with:

```shell
resize2fs /dev/<volume group>/<logical volume>
```
