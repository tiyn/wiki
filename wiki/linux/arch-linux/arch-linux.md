# Arch Linux

[Arch Linux](https://archlinux.org/) is a rolling-release, general-purpose Linux
distribution.
Arch Linux uses the [pacman](./package_manager.md) package manager.
The Arch User Repositories (AUR) features community-made packages that can be
installed with different
[package manager that inlcude access to the AUR](/wiki/linux/arch-linux/package_manager.md).

## Installation

The installation of a basic Arch Linux system is described in the
[installation entry](/wiki/linux/arch-linux/installation.md).
The entry features a guide to install a system with a X server setup aswell as
programs for the most used tasks on a system.

### ISO Medium

For the installation usage of a simple USB key is advised.
This has to be flashed with the Arch ISO.
The ISO file can be found on the
[official website](https://www.archlinux.org/download/).
The iso can be written on an USB-stick using the command
`dd bs=4M if=<path to ISO> of=/dev/sdx conv=fsync oflag=direct status=progress`.
`<path to ISO>` points the command to the location of the ISO file

## Recommended Practices

The following articles describe steps to undertake to harden the system security
or setups and installation that are recommended for Arch Linux.

## Enable Microcode Updates

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
