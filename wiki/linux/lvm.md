# LVM

`lvm` is a utility to create logical volumes.

## Usage

### Create Volume Group for Proxmox

We will use `/dev/sdb` as our drive.
Setup the disk for the physical volume with `sgdisk -N 1 /dev/sdb`.
Then create the physical volume `pvcreate /dev/sdb`.
The previous step can come to a halt when the device already contains an old
partition table and will display the error `Device /dev/sdb excluded by a filter`.
This can be solved by removing the old partition table with `wipefs -a /dev/sdb`.
And finally create the volume group `vgcreate vmdata /dev/sdb`.
Then follow the guide in proxmox on how to connect a `vg` to proxmox.

### Add Physical Volume to Existing Volume Group

First format the disk so that it has one partition (we will assume its called
`/dev/sdc1`).
To add the partition to a group run:

```sh
pvcreate /dev/sdc1
vgextend <name of your volume group> /dev/sdc1
```

### Remove Physical Volume

Before removing a physical volume it has to be confirmed that it is not part of
any volume group.
This can be done by running `sudo pvs` and confirm it is not listed for any
logical volumes.
If it is [a later section](#shrink-size-of-a-logical-volume) how the physical
volume can be completely emptied and removed from the logical volume.
A physical volume can be removed by running the following command:

```sh
sudo pvremove <path to physical volume>
```

`<path to physical volume>` is the physical volume that will get removed.


### Resize a Physical Volume

To increase the size of a physical volume you have to have free free space
in the partition containing the physical volume.
A guide to change 'normal' partitions can be found in the
[disk management article](./disk-management.md); if you have a volume that is
encrypted with LUKS a guide is available in
[the dm-crypt articel](./dm-crypt.md).

To resize the physical volume to the size of the containing volume run:
`pvresize /dev/mapper/<name of physical volume>`

### Increase Size of a Logical Volume

To increase the size of the logical volume you have to have free space in the
according volume group. You can check that by running: `vgdisplay`.
If you don't have enough space you have to resize the physical volume as
described in this article.
Then run:

```sh
lvextend -L +<size (e.g. 40G)> /dev/<volume groupt>/<logical volume>
```

If you want to allocate all the free space existing in a volume group run:

```sh
lvextend -l +100%FREE /dev/<volume group>/<logical volume>
```

Now you need to extend the filesystem with:

```sh
resize2fs /dev/<volume group>/<logical volume>
```

### Shrink Size of a Logical Volume

When trying to shrink a logical volume caution is advised as data can easily be
destroyed by mistyping commands of paths.
This section is based on a guide given by
[telcoM](https://unix.stackexchange.com/questions/591389/how-to-remove-a-disk-from-an-lvm-partition).
First of all the volumes have to be unmounted and not used by any programs or
services other than the following commands.

If the volume to shrink is the root volume it has to be done offline.
For that a simple installation stick is enough.
[The Arch Linux entry](/wiki/linux/arch-linux/arch-linux.md#installation-medium)
describes the creation of such a boot stick.
Afterwards the operating system has to be booted from the just created stick or
a comparable device.
For non-root volumes this extra step can be skipped.

The volume group needs to be activated by running the command
`sudo vgchange -ay <volume group>`.
`<volume group>` is the name of the volumegroup that features the logical volume
to shrink.
Then the file system needs to be resized.
For safety reasons make the file system exactly as big or smaller than the
future logical volume.
The process of shrinking a filesystem is explained in the
[file system entry](/wiki/linux/disk-management.md#shrinking-a-file-system).
The partition to shrink in this case is the logical volume.
This is the only step that needs to be done offline for root volumes.
Rebooting to the root volume at this moment is advised.

The next step will shrink the logical volume itself.
This will be done by running the following command:

```sh
sudo lvreduce -L <new size of logical volume> /dev/mapper/<volume group>-<logical volume>
```

Again this statement has to be adapted accordingly.
`new size of logical volume` describes the new size the logical volume will have
after successful completion of the command.
It is important for this to be exactly the same or larger than the size given
into the resizing of the file system with `resize2fs`.

### Remove Physical Volume from Volume Group

This section describes the removal of a physical volume from a logical volume.
First the command `vgs <volume group>` has to be run.
`<volume group>` is the name of the volume group belonging to the logical volume
a physical volume should be removed from.
It has to be ensured, that enough free space (`VFree`) on all physical volumes
(except the ones to remove) is available to remove a physical volume from the
volume group.
There has to be equal or more free space than the size (`VSize`) of the physical
volume that will be removed.
Otherwise an [earlier section](#shrink-size-of-a-logical-volume) explains how to
shrink a logical volume.
The logical volume has to be shrunk according to the described ration between
`VFree` and `VSize`.

The following command will distribute the contents of a physical volume onto
other physical volumes available:

```sh
sudo pvmove <path to physical volume>
```

`<path to physical volume>` is the physical volume that will get emptied and
later removed from the logical volume.
Afterwards the physical volume is emptied and can be removed from the logical
volume by running the following command:

```sh
sudo vgreduce <logical volume> <path to physical volume>
```

`<logical volume>` is the name of the logical volume.
After this command the physical volume is no longer a part of it.

If no longer used the empty physical volume can then be removed as described in
the [according section](#remove-physical-volume).

Afterwards the file system can be matched to the logical volume so it takes up
the full new size.
This is explained in

