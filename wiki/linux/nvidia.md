# Nvidia

[Nvidia](/wiki/nvidia.md) is a vendor for graphics cards.

## Setup

For Nvidia GPUs to work install the `nvidia` and the `nvidia-utils` package.
If you want to easily configure the monitors as described in a later section of
this file you can also install `nvidia-settings`.

There is no initial setup for a `xorg.conf` in `/etc/X11` needed
(except for a multiple GPU/APU setup).

### Configuration

A basic configuration can be achieved by running `nvidia-xconfig`.

## Usage

Most configuration and changes require the use of `nvidia-settings`.

### Change monitor configuration

In `nvidia-setting` monitors can be dragged and dropped to your liking.
After that you have to save the configuration to the
[X window manager](./x_window_system.md) configuration file
`/etc/X11/xorg.conf`.

### Avoid screen tearing

In `nvidia-settings` under
`X Server Display Configuration` select your display and click on `Advanced`
and select either `Force Composition Timeline` or
`Force Full Composition Timeline`.

### Pascal-GPUs and New Drivers

On some operating systems like [Arch Linux](/wiki/linux/arch-linux.md) the newer versions of
drivers are not compatible with Pascal GPUs anymore as explained in
[the german Arch forum](https://www.archlinux.de/news/35689-Nvidia-Treiber-ab-Version-590-stellen-den-Support-fuer-Pascal-GPUs-ein).
This is due to the drop of support for these cards from Nvidias site.
If Pascal-GPUs are still used some minor changes need to be performed and some packets need to be
replaced.
On Arch Linux-based systems this can be achieved by replacing the packages `nvidia-open` and
`nvidia-open-utils` with `nvidia-580xx-dkms`, `nvidia-580xx-utils` and  `lib32-nvidia-580xx-utils`.
If upgrading from a Pascal-GPU to a newer version this change needs to be undone.

After the packages are changed it is important to
[rebuild the initial ramdisk](/wiki/linux/mkinitcpio.md#manually-generate-initial-ramdisk) and
reboot the system.
