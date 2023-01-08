# NTFS

NTFS is the proprietary [file system](./disk-management.md) of Windows.

## Setup

For the usage of NTFS file systems the `ntfs-3g` package - available on most
distributions - has to be installed.

## Usage

When [mounting](/wiki/linux/disk-management.md#mounting) a
[Bitlocker encrypted drive](./dislocker.md) there are additional steps that have
to be taken to decrypt the device.

### Manual Mounting

Partitions using NTFS can be mounted on Linux based operating systems by
running the following command:
`mount -t ntfs-3g -o loop <path to partition> <path to mount point>`.
If the partition to mount is bootable or contains a windows system the
hibernation and fast boot have to be disabled to mount the partition with write
access.

### Automatic Mounting

For the usage of NTFS file systems the `ntfs-3g` package - available on most
distributions - has to be installed.
To automount partitions with NTFS the following line has to be adapted and added
to `/etc/fstab`:

```txt
<specified partition> <path to mount point> ntfs-3g nofail,windows_names,big_writes 0 0
```

If the partition to mount is bootable or contains a windows system the
hibernation and fast boot have to be disabled to mount the partition with write
access.
