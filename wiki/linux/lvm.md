# LVM

`lvm` is a utility to create logical volumes.

## Create VG for proxmox

Setup the disk for the physical volume with `sgdisk -N 1 /dev/sdb`.
Then create the physical volume `pvcreate --metadatasize 250k -y -ff /dev/sdb1`.
And finally create the volume group `vgcreate vmdata /dev/sdb1`.
Then follow the guide in proxmox on how to connect a `vg` to proxmox.
