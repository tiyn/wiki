# Proxmox

Proxmox is an environment for virtual machines and containers.

## Disk Management

### Adding a LVM to Proxmox

Create a `pv` and `vg` according to [the LVM page](lvm.md) at subsection
`Create VG for proxmox`.
Then add the LVM via the web-interface.
Select Datacenter and Storage. The `Add` and choose `LVM`.
After that follow the instructions and fill in the fields to your liking.

### Enlarging disk of a VM

Make sure there is enough disk space available.
For further information see [the disk management article](./disk-management.md)

SSH into Proxmox.
Enlarge a disk by using:

```sh
qm resize <vmid> <vm-disk-to-enlarge> <size>
```

For example if you want to the disk 100 by 100G (100GibiByte):

```sh
qm resize 100 ide0 +100G
```

After that grow the filesystem in the vm as described in
[the disk management article](./disk-management.md).

## Remove local-lvm and add its size to local

First remove `local-lvm` with `lvremove /dev/pve/data`.
Then remove `local-lvm` in the proxmox gui via `Datacenter/Storage/Remove`.
Change the `Content` of the remaining storage according to your needs.
Add the free storage to the remaining storage with `lvresize -rl +100%FREE /dev/pve/root`.
Finally extend the filesystem `resize2fs /dev/mapper/pve-root`.

## VM passthrough

### USB passthrough

On the host system find the usb you're looking to pass through with

```sh
lsusb
```

Then assign it to the vm using

```sh
qm set <vm-id> -usb<id-to-set> host=<id-of-the-usb>
```

for example

```sh
qm set 101 -usb0 host=aaaa:8816
```

### PCI/GPU passthrough

To use GPUs or other PCI devices you need to work with PCI passthrough.
For documentation you can look in the [Proxmox wiki](https://pve.proxmox.com/wiki/Pci_passthrough).
There is also an [article](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough)
on reddit, that focusses especially on windows 10 VMs with GPU passthrough.

### Increasing backup-limit of Proxmox storage

The default limit for backup is 1.
This is a bit too low.
To increase it navigate to the webinterface and click on Datacenter and Storage
select the storage you want to save your backup to and change `Max Backups` to
your liking.

## Bugfixing

### No internet after mainboard swap

If you change the mainboard of your proxmox-virtual-environment it is possible,
that the NIC changes.
Find out the new interface name with `ip a`.
After that get all occurences of the interface (`eth0` in the example) with
`rgrep eth0 /etc` and change them to the new device with a text editor of your
choice.
It is possible that there are also files existing that need to be renamed.
Find them with `find /etc -change '*eth0*'` and move them to the new name.
After that `reboot` and the internet should be up again.
(sources: [debian website](https://wiki.debian.org/NetworkInterfaceNames) and
[proxmox forum](https://forum.proxmox.com/threads/upgrade-motherboard-reinstall.48630))
