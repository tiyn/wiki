# Dislocker

[Dislocker](https://github.com/Aorimn/dislocker) is a driver to read and write
Bitlocker-ed volumes under Linux systems.

## Setup

On most of the Linux distributions Dislocker is bundled with the `dislocker`
package.
The installation of the `mbedtls2` package as an open-source TLS library can be
of use.

## Usage

### Manual Mounting of Bitlocker Partition

For the [mounting](/wiki/linux/disk-management.md#mounting) to work two directories
are required.
One to mount the `dislocker-file` (`/mnt/bitlocker`) and one to mount the
[windows volume](/wiki/linux/ntfs.md#manual-mounting) (`/mnt/windows`).
The device which holds the windows partition is assumed to be calles
`/dev/sdc1`.

The following command mounts the `dislocker` file to `/mnt/bitlocker`.
Make sure to replace the password in the following command.
There is no gap between the `-u` and the password:
`sudo dislocker /dev/sdc1 -u<password> -- /mnt/bitlocker`.
If the Bitlocker partition is set up using a `.BEK` file then the follwing
command takes the path to the file in:
`sudo dislocker /dev/sdb2 -f <path to bek-file> -- /mnt/bitlocker`
Alternatively a recovery key can be used:
`sudo dislocker /dev/sdc1 -p<recovery password> -- /mnt/bitlocker`.

Afterwards the `dislocker-file` can be mounted to the `/mnt/windows` directory
or another mount point as described in the
[NTFS entry](/wiki/linux/ntfs.md#manual-mounting).

### Automatic Mounting at Boot

Using [fstab](/wiki/linux/disk-management.md#mounting) the partition encrypted with
Bitlocker can be automatically mounted.
The following lines have to be adapted and written into
[`/etc/fstab`](/wiki/linux/disk-management.md#mounting).
In this case the intermediary dislocker file `dislocker-file` is mounted to
`/mnt/bitlocker`.

```txt
UUID=<partition uuid> /mnt/bitlocker fuse.dislocker bekfile=<path to bek-file>,nofail 0 0
```

After that a line to mount the `dislocker-file` as a [NTFS](./ntfs.md) partition
has to be added as described in
[the NTFS entry](/wiki/linux/ntfs.md#automatic-mounting).
In this case the specified partition to mount is
`/mnt/bitlocker/dislocker-file`.
The mount point can be chosen according to preference - for example
`/mnt/windows`.
