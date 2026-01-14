# Disk Management

This article focusses on non-LVM and non-MDADM storage including swap.
For [LVM](lvm.md), [NTFS](./ntfs.md), [Samba](./samba.md), [MDADM](./mdadm.md) and [LUKS volumes](./dm-crypt.md) there
are separate entries.

## Usage

This section focusses on various usages for disk management related topics.

### Increasing Swap File Size

The size of a swap file can easily be increased using the following steps.
Using the following commands currently active swaps can be shown and the usage of them can be
checked.

```sh
swapon --show
free -h
```

Then the swap file can be changed using the following commands.
`<location>` is the location of the swap file (for example `/swap.img`).
`<size>` describes the new size of the swap file (for example `16G`)

```sh
swapoff <location>
fallocate -l <size> <location>
chmod 600 <location>
mkswap <location>
swapon <location>
```

Finally the swap can be checked again to confirm that it is online and has the correct size

```sh
swapon --show
```

### Benchmarking Data Transfer Rates

Real data transfer rates can easily be checked using the program `pv`.
The following command will create a file on the target drive and show the data transfer rate while
writing.
In the following case `/mnt/usb1/tmp` is the path of the target file.

```sh
cat /dev/zero | pv > /mnt/usb1/tmp
```

After this the read speed can be checked by using the just created temporary file.
The following command will display the read speed.

```sh
cat /mnt/usb1/tmp | pv > /dev/zero
```

### Universally Unique identifier

Universally Unique identifier (UUID) are identifiers for informations on
computer systems.
Most notably they are used to identify file systems.
This way the UUID of a file system can be used to identify and
[mount it](#mounting) persistently and correctly.

By listing the directory `/dev/disk/by-partuuid` all mappings of devices to a
UUID are displayed.

### Mounting

Mounting a file system makes the files of it accessible to the user.
The command `mount` is used to manually and temporarily mount file systems.
Automatic mounting is done by changing the file `/etc/fstab`.

The exact guide on how to mount specific file systems can be found in their
respecitive wiki entries.
The following describes the general basics of mounting temporarily and
persistently.

The basic mount command for temporarily accessing a file system is the
following:
`mount <path to partition> <path to mount point>`
All partitions can be found at `/dev` and the standard mount point is `/mnt` and
its subfolders.

For automatic mounting the following line has to be adapted and added to the
file `/etc/fstab`
`<specified partition>	<path to mount point>   <file system> <additional options>  <dump flag> <fsck order>`
The partition can be specified by [UUID](#universally-unique-identifier).
The file system varies and a file system specific guide on how to mount them
can be found in their respective entries.
The dump flag signals if the file system should be dumped.
The `fsck` order signals if a file system should be checked at boot.
Boot partitions should be flagged with a `1` for this reason, otherwise `0`.

For undoing the mount the `umount` command can be used.
The following is a command to unmount a device from a specified directory.

```sh
umount <path to mount point>
```

A special case is the `.iso` format.
It can be mounted too.
A guide on how this is done can be found in the [ISO entry](/wiki/linux/iso_image.md#mounting).

### Create Partition

In the following it is assumed that the disk is `/dev/sda`

- open up parted with `parted /dev/sdd`
- if not already done create a partition table with `mklabel GPT`
- create a primary partition (ext4 format) with `mkpart primary 2048s 100%`
- `quit` parted

`<path to partition>` points to the partition that will be enlarged (for
example `/dev/sda2`).

### Grow non-LVM partition

ATTENTION: Please note that the partition to enlarge has to be the last one with
the free space after it.

In the following it is assumed that the partition to enlarge is `/dev/sda2`

- change the size of the partition with `parted /dev/sda`
- inside of parted run `print free` and check where the free space after your
  partition ends
- run `resizepart` and follow the instructions; End is the number you checked in
  the last step (alternatively you can insert `100%` as end, if you want to add all
  the available free space to the partition)
- `quit` parted

Afterwards the file system need to be resized as described in a
[later section](#growing-a-file-system).

### Growing a File System

A file system can easily be resized if free space is available on the partition
it is stored in.
The free space has to be placed behind the partition.
This can be done by running the following command:

```sh
sudo resize2fs <path to partition>
```

### Shrinking a File System

To shrink a file system the `resize2fs` command will be used aswell as `e2fsck`.
First the file system needs to be checked for size aswell as data distribution.
This can be done using the command `sudo e2fsck -f <path to partition>`.
`<path to partition>` directs to the volume whose file system should be
shrinked - for example `/dev/sda1`.
It has to be the same for the next step aswell.
Afterwards the file system can be shrinked with the command
`sudo resize2fs <path to partition> <new size of the file system>`.
`<new size of the file system>` is the size that the file system will be
shrunken to in the usual notation (for example `12G`).
Especially for large file systems this might take a while.

### Clearing System Trash Bin

The system trash bin by default can be found at `~/.local/share/Trash`.
The system moves deleted files there automatically.
It can be deleted by hand, deleting all files from the subdirectories of the trash folder
Another option is to use the tool `trash-cli` with the command `trash-empty`.

### Removing Unused Files

There are various files that are unused but saved by default.
The following list shows some options to quickly clean up space.

- [System Trash](#clearing-system-trash-bin)
- [Package Mangers](/wiki/linux/package_manager.md)
- [ViFM Trash Bin](/wiki/linux/vifm.md#empty-trash)

## Accessing Disks as User

Sometimes - for example when flashing an SD card for a
[Raspberry Pi](/wiki/linux/raspberry_pi.md#setup) - it may be useful to do so with your default
user and not using the root user.
For this to work the user can be added to the `disk` group permanently.
Please note that this however reduces the systems security.
A command to do so, may look like the following (given the `$USER` variable is set correctly).

```sh 
usermod -a -G disk $USER
```

## Error solving

This section addresses various problems that can occur and are related to
disk-management.

### `sudo: unable to open ... Read-only file system`

Ususally the filesystem will go into read-only mode whe the system is running
and there is a consistency error.
To fix it run:

- `sudo fsck -Af -M` - check all filesystems
  If `fsck` gets stuck after its version banner:
  `fsck from util-linux 2.20.1`
  you may want to try using the ext4-specific fsck:
- `fsck.ext4 -f /dev/sda1`

### `cannot access: Transport endpoint is not connected`

This error message can occur if a mounted directory is left mounted due to a
crash of the filesystem but not accessible anymore.
This error can be fixed and the directory made accessible again by running the
following command.

```sh
fusermount -u <path to mount point>
```

If this does not work the following command can be used to unmount the device.

```sh
umount -l <path to mount point>
```

This section is based on a reply by
[Jonathan Brown on Stack Overflow](https://stackoverflow.com/questions/16002539/fuse-error-transport-endpoint-is-not-connected).
