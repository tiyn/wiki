# Proxmox

Proxmox is an environment for virtual machines and containers.

## Disk Management

### Enlarging disk of a VM

ATTENTION: Please note that the partition to enlarge has to be the last one with the free space after it.
This guide does not consider LVMs and is written for partitions with ext4 filesystems.

SSH into Proxmox.
Enlarge a disk by using:
`qm resize <vmid> <vm-disk-to-enlarge> <size>`
For example:
`qm resize 100 ide0 +100G`

SSH into the VM.
- run `lsblk` check if the disk size has changed
- if not `reboot` the virtual machine

In the following it is assumed that the partition to enlarge is `/dev/sda2`
- change the size of the partition with `parted /dev/sda`
- inside of parted run `print free` and check where the free space after your partition ends
- run `resizepart` and follow the instructions; End is the number you checked in the last step
- `quit` parted

Now you need to resize the filesystem with `resize2fs /dev/sda2`.


