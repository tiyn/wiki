# Kernel

The [Linux](/wiki/linux.md) kernel is an open-source Unix-like computer operating system kernel.

## Versions

There are a few possible kernel version.

### Stable-Version: `linux`

The stable version of the [Linux](/wiki/linux.md) kernel can usually be found in a package called
`linux` and is usually installed from the start or in the recommended setup.

### Zen-Version: `linux-zen`

The zen kernel is a collaborative project of kernel hackers to provide the best
[Linux](/wiki/linux.md) kernel for everyday systems.
Especially the response time of the system under load
[is said to be better](https://github.com/zen-kernel/zen-kernel/wiki/Detailed-Feature-List#zen-kernel-improvements).
This will - for example - make the system less stuttery when something is compiled.
Desktop and gaming systems will benefit the most.

To setup the zen kernel do the following. Firstly install the packages `linux-zen` and
`linux-zen-header`.
Afterwards open the file `boot/loader/entries/arch.conf` and change the following lines. 

```txt 
linux /vmlinuz-linux
initrd /initramfs-linux.img
```

To look like the following lines.

```txt
linux /vmlinuz-linux-zen
initrd /initramfs-linux-zen.img
```

If you want to switch the backup to Zen too, the backup file in `boot/loader/entries/` has to be
changed too.
Afterwards the system should be rebooted for the change to take effect.
