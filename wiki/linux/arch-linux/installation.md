# Arch installation with LUKS encryption and LVM

This guide is based upon a
[german arch wiki article](https://wiki.archlinux.de/title/Installation_mit_UEFI_und_Verschl%C3%BCsselung).
For encryption [dm-crypt](../dm-crypt.md) is used.
Inside the encrypted partition a logical volume will be created with
[LVM](../lvm.md).

At the end of this guide a fully functional Arch Linux will be installed.

## Test 

The following is a list of installations using this guide and if it is working.

| Commit  | Date       | Device                 | Working     |
| ------- | ---------- | ---------------------- | ----------- |
| f8b83cf | 19.02.2025 | Lenovo E14 AMD Version | No Problems |

## 1. Preparation

Ahead of the installation an Arch boot-stick has to be created as described in
[the Arch Linux entry](/wiki/linux/arch-linux.md#installation-medium).

After that the USB can be plugged in the system on which Arch should be installed.
Boot the target system and select `Boot Arch Linux (x86_64)`.

If you need to set the keyboard layout to anything other than english you can
temporarily do so by using the `loadkeys` command.
This has to be followed by your country id (for example a german keyboard layout
would be `de`,`de-latin1` or `de-latin1-nodeadkeys`).

## 2. Formatting of the target drive

Using `lsblk` you can list all the drives and partitions.
Select a drive to install Arch on.
In this step you can see if old partitions need to be deleted.
For reasons of simplicity the following guide will assume the selected drive to
be `/dev/sda`.

### Clear disk completely

This step can take quite a while especially for large drives.

```sh
dd status=progress if=/dev/zero of=/dev/sda
```

Now all partitions should be removed.

Alternatively the partition table can be cleared by running the following command.
This will leave old data possibly recoverable.

```sh
wipefs -fa /dev/sda
```

### Create new partitions

If you miss click during the progress of the following commands you can press
`CTRL+C` to close the program.
No changes will be made until the confirmation at the end.
The swap partition will be created later under lvm.

- `gdisk /dev/sda`
- `N` - Create a new empty partition table
- `↵ Enter` - Create a partition
- `↵ Enter` - Confirm first sector
- `+512M` - Assign size of 512 MB for the first partition
- `ef00` - Make the partition bootable
- `n` - Create a second partition
- `↵ Enter` - Confirm creation of partition
- `↵ Enter` - Confirm first sector
- `↵ Enter` - Confirm last sector
- `↵ Enter` - Confirm partition type
- `p` - Show created partitions
- `W` - Save all changes
- `Y` - Confirm saving changes

## 3. Encryption

We need to find out which partitions is the one we want to encrypt.
Using `blkid | grep /dev/sda` all partitions we created get listed.
The right partition has the label `Linux filesystem`.
For this guide this partition is assumed to be `/dev/sda2`.

```sh
cryptsetup -c aes-xts-plain -y -s 512 luksFormat /dev/sda2
```
Afterwards confirm with `YES`.
Now you can assign a passphrase.
The passphrase has to be entered at boot to decrypt the system.
Recovering of this passphrase is **not** possible.

## 4. Setup LVM

- `cryptsetup luksOpen /dev/sda2 lvm` - Opening encrypted partition and mapping
  it to `/dev/mapper/lvm`
- `pvcreate /dev/mapper/lvm` - Create a LVM physical volume
- `vgcreate main /dev/mapper/lvm` - Create LVM Volume Group
- `lvcreate -L 16G -n swap main` - Create Swap in LVM (recommended: swap size
  is equal to ram size to enable hibernation)
- `lvcreate -l 100%FREE -n root main` - Create LVM Logical Volume for /

## 5. Create filesystems and mounting them temporarily

We have to find out which partition is our boot-partition.
Using `blkid | grep /dev/sda` once again, we can identify it by looking for the
`EFI system partition` label.
The guide assumes this partition to be at `/dev/sda1`.

- `mkfs.fat -F 32 -n UEFI /dev/sda1` - Assign filesystem of EFI partition
- `mkfs.ext4 -L root /dev/mapper/main-root` - Assign filesystem of root partition
- `mkswap /dev/mapper/main-swap` - Assign swap filesystem

Now the created filesystems will be mounted for the installation.

- `mount /dev/mapper/main-root /mnt` - Mounting root partition
- `mkdir /mnt/boot`
- `mount /dev/sda1 /mnt/boot` - Mount EFI partition
- `swapon /dev/mapper/main-swap` - Mounting swap partition

## 6. Starting base installation

Now you need a working internet connection.
Plug in your lan cable or use `wifi-menu` to get a wireless connection.

- `pacstrap /mnt base base-devel dosfstools gptfdisk lvm2 linux linux-firmware vim networkmanager ntp`
- `genfstab -Up /mnt > /mnt/etc/fstab` - creation of fstab
- `arch-chroot /mnt` - Switch into the newly installed system
- `echo ArchLinux > /etc/hostname` - Assign hostname. `ArchLinux` can be changed
  for any name of your preference.

## 7. Set Region and Language

- `echo LANG=en\_US.UTF-8 > /etc/locale.conf` - Assign system Language to be
  english (you can use other languages, look into the `/etc/locale.gen` for a list of all available languages)
- `vim /etc/locale.gen` - Assigning system language by uncomment the lines
  depending on your needs.
  In this example:

```txt
en_US.UTF-8 UTF-8
```

- `locale-gen` - Generate languages
- `echo KEYMAP=de-latin1-nodeadkeys > /etc/vconsole.conf` - set the keymap
- `ln -sf  /usr/share/zoneinfo/Europe/Berlin /etc/localtime` - set your timezone
  (select the first file accordingly to your location)
- `ntpdate -q 0.de.pool.ntp.org` - sync the time and date with
  [NTP](/wiki/linux/ntp.md) (note that a german time server is used and
  depending on the needs a adjustments should be made)

## 8. Configure and create kernel-image

- `vim /etc/mkinitcpio.conf`

  - Search the line `MODULES=()` and change it to:
    `MODULES=(ext4)`
  - Search the line `HOOKS=([...])` and change it to:
    `HOOKS=(base udev autodetect modconf block kms keyboard keymap consolefont encrypt lvm2 filesystems resume fsck shutdown)`

- `mkinitcpio -p linux` - generate Kernel-Image

## 9. Install and configure UEFI bootloader

- `bootctl install` - Prepare bootloader
- `ls -l /dev/disk/by-uuid` - find out the UUID of your root partition.
- `vim /boot/loader/entries/arch.conf` - Create configuration

- Change the config to look similar to this:

  ```txt
  title    Arch Linux
  linux    /vmlinuz-linux
  initrd   /initramfs-linux.img
  options  cryptdevice=UUID=<enter your uuid here>:lvm:allow-discards root=/dev/mapper/main-root resume=/dev/mapper/main-swap rw quiet
    ```

- `cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-fallback.conf` - create a fallback.
  Change it to the following.

  ```txt
  title    Arch Linux Fallback
  linux    /vmlinuz-linux
  initrd   /initramfs-linux-fallback.img
  options  cryptdevice=UUID=<enter your uuid here>:lvm:allow-discards root=/dev/mapper/main-root resume=/dev/mapper/main-swap rw quiet
  ```

- `vim /boot/loader/loader.conf` - Create loader configuration.
  Insert the following text

    ```txt
    timeout 0
    default arch
    ```

## 10. Finishing base installation

- `passwd` - set password for the root account
- `systemctl enable NetworkManager.service`

## 11. Finish the setup

- `exit` - exit the installed system
- `umount /mnt/{boot,}` - unmount all partitions
- `shutdown now` - shutdown device
- Now remove the Arch boot-stick
- Start the device again

If the system is installed in a virtual environment or a system with deactivated
UEFI, don't forget to enable the EFI option, otherwise the system won't boot.

## 12. Further steps and graphical environment

Now you can follow the recommended larbs installation script of this wiki
(`curl -LO larbs.sh https://raw.githubusercontent.com/tiyn/larbs/master/larbs.sh`)
this will install a bunch of useful base software including
[a graphical environment](../x_window_system.md) and
[a window manager](../suckless.md#programs).
You can go on to other guides aswell.
Especially the
[Recommended practices](/wiki/linux/arch-linux.md#recommended-practices)
should be checked for further setups.

Additionally if you have a NVidia Graphics Cards you should read
[the NVidia article](../nvidia.md) too.

If you are interested in automatic decryption of the dm-crypt encrypted
partition, take a look at the according section in
[the dm-crypt article](../dm-crypt.md).

After installing [xorg windows system](/wiki/linux/x_window_system.md) the language of it will be
english by default.
To change it - in this example to german - run the following command.

```sh
localectl --no-convert set-x11-keymap de pc105 deadgraveacute
```
