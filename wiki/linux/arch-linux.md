# Arch Linux

[Arch Linux](https://archlinux.org/) is a rolling-release, general-purpose
[Linux](/wiki/linux.md)
distribution.

## Package Manager and AUR

Arch Linux uses the
[pacman](/wiki/linux/package_manager.md#arch-linux-pacman-and-yay) package
manager.
An additional repository for user made software exists.
It is called Arch User Repository (AUR).
The Arch User Repositories (AUR) features community-made packages that can be
installed with different
[package manager for that purpose](/wiki/linux/package_manager.md#arch-linux-pacman-and-yay).

## Installation

The installation of a basic Arch Linux system is described in the
[installation entry](/wiki/linux/arch-linux/installation.md).
The entry features a guide to install a system with a X server setup aswell as
programs for the most used tasks on a system.

### Create Installation Medium

For the installation usage of a simple USB key is advised.
This has to be flashed with the Arch ISO.
The ISO file can be found on the
[official website](https://www.archlinux.org/download/).
The iso can be written on an USB-stick using the command
`dd bs=4M if=<path to ISO> of=/dev/sdx conv=fsync oflag=direct status=progress`.
`<path to ISO>` points the command to the location of the ISO file.

Alternatively a [Ventoy stick can be created](/wiki/ventoy.md) which can contain multiple
[ISO images](/wiki/linux/iso_image.md) without flashing.

## Usage

The following section describes various ways to use and improve the usage of
the Arch Linux operating system.

### Recommended Practices

The following articles describe steps to undertake to harden the system security
or setups and installation that are recommended for Arch Linux.

#### Enable Microcode Updates

The microcode of Intel and AMD CPUs can be automatically updated by installing
the `amd-ucode` or `intel-ucode` package depending on your CPU.
Not all processors are supported, especially old ones can lead to problems.
It has to be confirmed that the processor is supported, if this is not the case
is possible for the next steps to break the functionality of the bootloader.

The following part assumes the system is installed with
[UEFI bootloader](/wiki/linux/arch-linux/installation.md#10-install-and-configure-uefi-bootloader)
similar to the [recommended guide](/wiki/linux/arch-linux/installation.md).
The microcode updates can then be enabled by adding the following line into
`/boot/loader/entries/arch.conf`:

```txt
initrd  /<installed microcode package>.img
```

`<installed microcode package>` is either `amd-ucode` or `intel-ucode`.

## Troubleshooting

This section addresses problems that can occur when using Arch Linux.

### Troubleshooting Setup for not Bootable Systems

This section focusses on a basic guide to troubleshoot systems that are not bootable.
To access the files of the system an Arch Linux boot stick has to be created as explained in
[a previous section](#create-installation-medium).
After booting into it set your keymap layout using the `loadkeys` setup similar to
[the installation preparation](/wiki/linux/arch-linux/installation.md#1-preparation).
Afterwards [mount](/wiki/linux/disk-management.md#mounting) the partition that contains the root
file system to the `/mnt` directory.
It is possible that LUKS encrypted file systems need to be
[opened](/wiki/linux/dm-crypt.md#openclose-an-encrypted-volume) and then mounted using the
`/dev/mapper` symbolic link.
On some systems there are home or boot file system that have to be mounted on `/mnt/boot` or
`/mnt/home` after mounting the root file system.
Afterwards use `arch-chroot /mnt` to get into the not bootable system.
Now the command line of the system can be accessed for troubleshooting.
After troubleshooting `exit` the system and [unmount](/wiki/linux/disk-management.md#mounting) all previously
mounted file systems and try to boot back into the system.

If the system broke during an update then the easiest way to fix it, is by running the same update
command again.
The used command can be found in `/var/log/pacman.log`.
Make sure to run exactly this command.
Afterwards try to reboot into the system.

Another common source for not bootable systems is
[the initial ramdisk](#problems-with-the-initial-ramdisk).

### Problems with the Initial Ramdisk

A common problem (especially after a interrupted update lies in the initial ramdisk environment).
An error like this will mean that the system is
[not bootable](#troubleshooting-setup-for-not-bootable-systems).
To fix this generate the initial ramdisk manually as described in
[the mkinitcpio entry](/wiki/linux/mkinitcpio.md#manually-generate-initial-ramdisk).

### Stuck in Boot Screen

There is a known problem described in the Arch Linux forums by
[TheRealNubby](https://bbs.archlinux.org/viewtopic.php?id=300292) where the system goes into a
perceived freeze after the boot process.
This problem seems to be most prevalent on systems that use an [Nvidia](/wiki/nvidia.md) GPU
since its only known occurences were found on Nvidia GTX 1080 GPUs.
The boot screen will not show any errors and when
[troubleshooting using a installation medium](#troubleshooting-setup-for-not-bootable-systems)
logs like [the ones of SystemD](/wiki/linux/systemd.md#retrieving-the-systemd-logs) will look
normal and won't show any errors.

In this case there is the possibility that logging into Arch Linux blindly will work.
For this type in user name and password some moments after the perceived freeze as you normally
would do if the login screen came up.
If the graphical interface still does not work, the command to start the graphical interface (like 
`startx` for [X11](/wiki/linux/x_window_system.md) systems) can also work.
