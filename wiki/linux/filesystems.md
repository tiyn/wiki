# File Systems

File systems control how data on a drive is stored.

- [NTFS](./ntfs.md) is a proprietary file system used by Windows
- [Samba](./samba.md) is free windows interoperability software that is not a
  classic file system can be mounted so it will be mentioned here

## Mounting

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
The partition can be specified by UUID - which can be found at
`/dev/disk/by-uuid` or other identifiers aswell as the simple path to it (for
example `/dev/sda1`).
The file system varies and a file system specific guide on how to mount them
can be found in their respective entries.
The dump flag signals if the file system should be dumped.
The `fsck` order signals if a file system should be checked at boot.
Boot partitions should be flagged with a `1` for this reason, otherwise `0`.
