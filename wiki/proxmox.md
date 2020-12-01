# Proxmox

Proxmox is an environment for virtual machines and containers.

## Disk Management

### Enlarging disk of a VM

SSH into Proxmox.
Enlarge a disk by using:

```shell
qm resize <vmid> <vm-disk-to-enlarge> <size>
```

For example:

```shell
qm resize 100 ide0 +100G
```

After that grow the filesystem as described in [the disk-management article](linux/disk-management.md).

## VM passthrough

### USB passthrough

On the host system find the usb you're looking to pass through with

```shell
lsusb
```

Then assign it to the vm using

```shell
qm set <vm-id> -usb<id-to-set> host=<id-of-the-usb>
```

for example

```shell
qm set 101 -usb0 host=aaaa:8816
```

### PCI/GPU passthrough

To use GPUs or other PCI devices you need to work with PCI passthrough.
For documentation you can look in the [Proxmox wiki](https://pve.proxmox.com/wiki/Pci_passthrough).
There is also an [article](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough)
on reddit, that focusses especially on windows 10 VMs with GPU passthrough.
