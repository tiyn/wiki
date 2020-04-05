# Arch installation with LUKS encryption and LVM

This is the german version of the [installation guide on rvbg.eu](https://wiki.rvbg.eu/#arch/installation.md).
This guide is based upon a [german arch wiki entry](https://wiki.archlinux.de/title/Moderne_Installation_mit_UEFI_und_Verschlüsselung).

At the end of this guide a fully functional Arch Linux will be installed.

## 1. Preparation
Ahead of the installation an Arch boot-stick has to be created. The iso-file can be found on the [official website](https://www.archlinux.org/download/).
The iso can be written on an USB-stick using ```dd```.
After that the USB can be plugged in the system on which Arch should be installed.
Boot the target system and select ```Boot Arch Linux (x86_64)```.

If you need to set the keyboard layout to anything other than english you can temporarily do so by using the ```loadkeys``` command.
This has to be followed by your country id (for example a german keyboard layout would be ```de```,```de-latin1``` or ```de-latin1-nodeadkeys```.

## 2. Formatting of the target drive
Using ```lsblk``` you can list all the drives and partitions.
Select a drive to install Arch on.
For reasons of simplicity the following guide will assume the selected drive to be ```/dev/sda```.
### Clear disk completely:

- `dd status=progress if=/dev/zero of=/dev/sda`

Now all partitions should be removed.

### Create new partitions:
If you missclick during the progress of the following commands you can press ```CTRL+C``` to close the program.
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
- `P` - Show created partitions
- `W` - Save all changes
- `Y` - Confirm saving changes

## 3. Encryption
We need to find out which partitions is the one we want to encrypt.
Using ```blkid | grep /dev/sda``` all partitions we created get listed.
The right partition has the label ```Linux filesystem```.
For this guide this partition is assumed to be ```/dev/sda2```.

- `modprobe dm-crypt` - load kernelmodule for encryption
- `cryptsetup -c aes-xts-plain -y -s 512 luksFormat /dev/sda2` - encryption
- confirm with ```YES```
- Now you can assign a passphrase.
The passphrase has to be entered at boot to decrypt the system.
Recovering of this passphrase is **not** possible.

## 4. Setup LVM
- `cryptsetup luksOpen /dev/sda2 lvm` - Opening encrypted partition and mapping it to ```/dev/mapper/lvm```
- `pvcreate /dev/mapper/lvm` - Create a LVM physical volume
- `vgcreate main /dev/mapper/lvm` - Create LVM Volume Group
- `lvcreate -L 16G -n swap main` - Create Swap in LVM (recommended: swap size is equal to ram size)
- `lvcreate -l 100%FREE -n root main` - Create LVM Logical Volume for /

## 5. Create filesystems and mounting them temporarily
We have to find out which partition is our boot-partition.
Using ```blkid | grep /dev/sda``` once again, we can identify it by looking for the ```EFI system partition``` label.
The guide assumes this partition to be at ```/dev/sda1```.

- ```mkfs.fat -F 32 -n UEFI /dev/sda1``` - Assign filesystem of EFI partition
- ```mkfs.ext4 -L root /dev/mapper/main-root``` - Assign filesystem of root partition
- ```mkswap /dev/mapper/main-swap``` - Assign swap filesystem

Now the created filesystems will be mounted for the installation.

- `mount /dev/mapper/main-root /mnt` - Mounting root partition
- `mkdir /mnt/boot`
- `mount /dev/sda1 /mnt/boot` - Mount EFI partition
- `swapon /dev/mapper/main-swap` - Mounting swap partition

## 6. Prepare base installation (optional)
In this step the country specific mirrorserver for the installation will be configured.
This will improve the download speed.
- `cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak` - Create a backup of mirrorlist
- `grep -E -A 1 ".*Germany.*$" /etc/pacman.d/mirrorlist.bak | sed '/--/d' > /etc/pacman.d/mirrorlist` - Example command to only use *German* mirrors
- `cat /etc/pacman.d/mirrorlist` - Check if the file is to your liking. If it is not, you can just recover by using ```mirrorlist.bak```

## 7. Starting base installation
- `pacstrap /mnt base base-devel dosfstools gptfdisk lvm2 linux linux-firmware wpa_supplicant wireless_tools networkmanager vim` - Installation of main system with needed tools
- `genfstab -Up /mnt > /mnt/etc/fstab` - creation of fstab
- `arch-chroot /mnt` - Switch into the newly installed system
- `echo ArchLinux > /etc/hostname` - Assign hostname. ```ArchLinux``` can be changed for any name of your preference.
- `echo LANG=de_DE.UTF-8 > /etc/locale.conf` - Systemsprache festlegen
- `echo LANG=en_US.UTF-8 > /etc/locale.conf` - Assign system Language to be english (you can use other languages, look into the ```/etc/locale.conf``` for a list of all available languages)
- `vim /etc/locale.gen` - Assigning system language
- uncomment the lines depending on your needs.
In this example:
```
en_US.UTF-8 UTF-8
```
- `locale-gen` - Generate languages
- if you need any other keymap than english you can change it now for example to German by `echo KEYMAP=de-latin1 > /etc/vconsole.conf`.
- `sed -i 's/MODULES=()/MODULES=(ext4)/g' /etc/mkinitcpio.conf` - Allow modules needed at boot
- `sed -i 's/HOOKS=()/HOOKS=(base udev autodetect modconf block keyboard keymap encrypt lvm2 filesystems fsck shutdown)/g' /etc/mkinitcpio.conf` - Allow hooks needed at boot
- `mkinitcpio -p linux` - generate Kernel-Image

## 8. Install and configure UEFI bootloader
- `bootctl install` - Prepare bootloader
- `vim /boot/loader/entries/arch.conf` - Create configuration
It is recommended to use UUIDs where possible.
Please find out what the UUID of your drive is, use ```ls -l /dev/disk/by-uuid``` to do this.
```
title    Arch Linux
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  cryptdevice=UUID=<enter your uuid here>:lvm:allow-discards root=/dev/mapper/main-root:lvm:allow-discards resume=/dev/mapper/main-swap rw quiet lang=de init=/usr/lib/systemd/systemd locale=de_DE.UTF-8
```
- `vim /boot/loader/entries/arch-fallback.conf` - Create fallback
```
title    Arch Linux
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  cryptdevice=UUID=<enter your uuid here>:lvm:allow-discards root=/dev/mapper/main-root:lvm:allow-discards resume=/dev/mapper/main-swap rw quiet lang=de init=/usr/lib/systemd/systemd locale=de_DE.UTF-8
```
- `vim /boot/loader/loader.conf` - Create loader configuration
 - Insert the following text
```
timeout 1
default arch
```

## 9. Finishing base installation
- `exit` - exit the installed system
- `umount /mnt/*` - unmount all partitions
- `shutdown` - shutdown device
- Now remove the Arch boot-stick

If the system is installed in a virtual environment or a system with deactivated UEFI, don't forget to enable the EFI option, otherwise the system won't boot.

## 10. Activate Networkconnection
- Start the device
- Log in as ```root``` user
- `systemctl enable NetworkManager.service` - Activate NetworkManager
- `systemctl enable wpa_supplicant.service` - Activate wpa_supplicant
- `systemctl start NetworkManager.service` - Start NetworkManager

The device should connect to the internet if it is connected via LAN.
Using ```nmtui``` you can administer the wired and wireless connections

## 11. Automatic timesettings
- `pacman -Syu ntp` - Installing time service
- `ntpd -qg` - Get current time
- `hwclock --systohc` - Synchronize hardwareclock
- `systemctl enable ntpd.service` - enable timeservice

## 12. Create user
- `vim /etc/sudoers` - Open suoders file
 - uncomment the following lines
```
%whell All=(ALL) ALL
```
- `useradd -m user` - Create a user with ```user``` as name. For the user a home directory will be created.
- `usermod -aG wheel user` - Add user ```user``` to wheel group
- `passwd -d user` - Remove password for user ```user```

On the freshly installed system there are 2 users.
Make sure to set the password!
You can add one using ```passwd```.

> 03.04.2020 - Version 1.0
> 03.04.2020 - Version 1.1en
