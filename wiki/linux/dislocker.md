# Dislocker

[Dislocker](https://github.com/Aorimn/dislocker) is a driver to read and write
Bitlocker-ed volumes under Linux systems.

## Setup

On most of the Linux distributions Dislocker is bundled with the `dislocker`
package.

## Mounting Bitlocker-ed volume

For the mounting to work two directories are required.
One to mount the `dislocker-file` (`/mnt/bitlocker`) and one to mount the
windows volume (`/mnt/windows`).
The device which holds the windows partition is assumed to be calles
`/dev/sdc1`.

The following command mounts the `dislocker` file to `/mnt/bitlocker`.
Make sure to replace the password in the following command.
There is no gap between the `-u` and the password:
`sudo dislocker /dev/sdc1 -u<password> -- /mnt/bitlocker`

Alternatively a recovery key can be used:
`sudo dislocker /dev/sdc1 -p<recovery_password> -- /mnt/bitlocker`

Afterwards the `dislocker-file` can be mounted to the `/mnt/windows` directory.
`sudo mount -o loop /mnt/bitlocker/dislocker-file /mnt/windows`

Following these commands the windows partition can be found mounted on
`/mnt/windows`.
It is possible that the partition uses the NTFS which requires the `ntfs-3g`
package to be installed to work with linux.
