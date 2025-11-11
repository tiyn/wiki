# Proxmox

[Proxmox](https://proxmox.com/) is an environment for virtual machines and containers.
It is based on [Debian](/wiki/linux/debian.md) and uses the package manager
[APT](/wiki/linux/package_manager/apt.md).

## Usage

This section addresses the usage of Proxmox specific tasks.

### Retrieve PVE Version

The current version of the Proxmox Virtual Environment can be retrieved by running the following
command.

```sh
pveversion
```

### Upgrading to a Higher Major Version

The first step for a major upgrade usually is
[retrieving the current version](#retrieve-pve-version) to check the version that should be
installed.

The way of updating Proxmox is very similar to [Debian](/wiki/linux/debian.md) since it is also
based on it.
However there are some differences.
Therefore it is described here in detail.

If the user of the system to perform a major version upgrade on is using [Docker](/wiki/docker.md)
some additional steps have to be taken before the upgrade.
It is generally recommended to hold the Docker upgrade and performing it later.
For this reason the following command has to be run first.

```sh
apt-mark hold docker-ce docker-ce-cli containerd.io
```

First the packages of the current major release version have to be
[upgrading](/wiki/linux/package_manager/apt.md#updating-upgrading) using APTs `full-upgrade`
option.
Then a reboot is recommended.

At this point the state of the system can be checked this can be done by a special Proxmox command.
Depending on the version the system is on the command may differ.
If the system is for example running PVE 8 (based on [Debian 12](/wiki/linux/debian.md)) then the
following command can be used.
Similar commands exist for other versions (for example `pve7to8`).

```
pve8to9
```

This will check if the current state of the system is ready for the major version upgrade.
It is not recommended to continue with errors or without running these checks

Now APT needs to be assigned new sources.
This can be done by editing the file `/etc/apt/sources.list` and replacing everything within with
the new sources.
For PVE 8 - which corresponds to Debians 12th version called bookworm - this lines to add are the
following.

```txt
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
```

On Proxmox there are two additional source lists that need to be changed.

The first one is located at `/etc/apt/sources.list.d/pve-no-subscription.list` and should look
similar to the following.

```txt
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
```

The list placed at `/etc/apt/sources.list.d/pve-enterprise.list` should be commented out entirely
if the system is not running the enterprise version.

Following this a [full upgrade](/wiki/linux/package_manager/apt.md#updating-upgrading) has to be
performed.
Sometimes this process asks if the user wants to replace the local configuration files with newer
ones.
It is generally recommended to select `N` and reject these new configurations.

Finally another reboot is needed and the version number can be
[checked again](#retrieve-pve-version) confirming that the major version upgrade was
successfully performed.

When the system ran Docker and its upgrade was put on hold as described at the start of this
section the following commands have to be run to finalize the major upgrade, take Docker from the
hold list and upgrade it.

```sh
apt-mark unhold docker-ce docker-ce-cli containerd.io
apt update
apt install --only-upgrade docker-ce docker-ce-cli containerd.io
```

### Adding a LVM to Proxmox

Create a `pv` and `vg` according to [the LVM page](lvm.md) at subsection
`Create VG for proxmox`.
Then add the LVM via the web-interface.
Select Datacenter and Storage. The `Add` and choose `LVM`.
After that follow the instructions and fill in the fields to your liking.

### Enlarging Disk of a VM

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

Afterwards the partition of the VM needs to be enlarged.
For that
[the disk management article](/wiki/linux/disk-management.md#grow-non-lvm-partition)
can be used for non-LVM paritions.
Alternatively [the LVM article](/wiki/linux/lvm.md#increase-size-of-a-logical-volume)
can be referenced for LVM systems.
After that grow the filesystem in the vm as described in
[the disk management article](/wiki/linux/disk-management.md#growing-a-file-system).

### Remove Local-LVM and Add Its Size to Local

First remove `local-lvm` with `lvremove /dev/pve/data`.
Then remove `local-lvm` in the proxmox gui via `Datacenter/Storage/Remove`.
Change the `Content` of the remaining storage according to your needs.
Add the free storage to the remaining storage with `lvresize -rl +100%FREE /dev/pve/root`.
Finally extend the filesystem `resize2fs /dev/mapper/pve-root`.

### USB Passthrough

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

### PCI/GPU Passthrough

To use GPUs or other PCI devices you need to work with PCI passthrough.
For documentation you can look in the [Proxmox wiki](https://pve.proxmox.com/wiki/Pci_passthrough).
There is also an [article](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough)
on reddit, that focusses especially on windows 10 VMs with GPU passthrough.

### Increasing Backup-Limit of Proxmox Storage

The default limit for backup is 1.
This is a bit too low.
To increase it navigate to the webinterface and click on Datacenter and Storage
select the storage you want to save your backup to and change `Max Backups` to
your liking.

## Troubleshooting

This section addresses various errors that can happen when using Proxmox.

### No Internet After Mainboard Swap

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
