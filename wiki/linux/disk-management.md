# Disk Management

This article focusses on non-LVM and non-MDADM storage.
For [LVM](lvm.md), [MDADM](./mdadm.md) and [LUKS volumes](./dm-crypt.md) there
are separate entries.

## Create Partition

In the following it is assumed that the disk is `/dev/sda`

- open up parted with `parted /dev/sdd`
- if not already done create a partition table with `mklabel GPT`
- create a primary partition (ext4 format) with `mkpart primary 2048s 100%`
- `quit` parted

## Grow non-LVM ext4 partition

ATTENTION: Please note that the partition to enlarge has to be the last one with
the free space after it.

In the following it is assumed that the partition to enlarge is `/dev/sda2`

- change the size of the partition with `parted /dev/sda`
- inside of parted run `print free` and check where the free space after your
partition ends
- run `resizepart` and follow the instructions; End is the number you checked in
the last step
- `quit` parted

Now you need to resize the filesystem with `resize2fs /dev/sda2`.

## Error solving

### sudo: unable to open ... Read-only file system

Ususally the filesystem will go into read-only mode whe the system is running
and there is a consistency error.
To fix it run:

- `sudo fsck -Af -M` - check all filesystems
  If `fsck` gets stuck after its version banner:
  `fsck from util-linux 2.20.1`
  you may want to try using the ext4-specific fsck:
- `fsck.ext4 -f /dev/sda1`
