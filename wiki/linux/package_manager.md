# Package Managers

Package managers are important programs to get software onto your system.

## Arch Linux: Pacman and Yay

In [Arch Linux](/wiki/linux/arch-linux.md) there are 2 main types of
package managers.
The first is pacman, the default package manager.

For the second type there are many different managers to chose from.
Those managers are handling for the Arch User Repositories (AUR).
In this article yay is used as the go to AUR manager.
yay is also a wrapper for pacman so yay can be used instead of pacman to
install and update both AUR and main repository programs.
It features the same syntax.

### Usage

This section addresses various usages of the arch linux package managers.

#### Downgrading Packages 

Packages of the AUR can be downgraded by using the
[Downgrade](https://github.com/archlinux-downgrade/downgrade) program.
This program can then easily be used to an AUR package.
This works like the following assuming the package `v4l2loopback-dmks` needs to be downgraded.

```sh 
sudo downgrade v4l2loopback-dmks
```

Afterwards the target version can be selected and the downgrading process will conclude.

#### Manual Installation of a `PKGBUILD` File

A `PKGBUILD` file is a [shell](/wiki/linux/shell.md) script that contains the installation 
information that is required by the Arch Linux.
Using the `makepkg` command it can be installed like the following command shows.

```sh
makepkg -sirc
```

Afterwards it is installed on the system and can be further managed (especially uninstalled) by the
Pacman package manager.

#### Installing an AUR Program with a Specific Version

The installation of a specific version of an AUR program can be easily achieved.
For this navigate to the AUR page of the program to install.
On the right-hand side click on `View Changes` and select the version you want to install in the
commit list.
Next to `download` a `.tar.gz` file can be downloaded which includes a `PKGBUILD` file.
Afterwards it needs to be [uncompressed](/wiki/linux/tar.md#uncompressing-a-tar-archive).

#### Clear Cache

The cache of all packages except the one installed can be deleted by running the following command.

```sh
pacman -Sc
```

Alternatively the pacman cache can be deleted partly by running the following command which will
clear the cache of pacman except for the latest version.
The amount of versions to keep can be specified by changing the number in the following command
accordingly.

```sh
paccache -rvk1
```

And finally the following command will remove all cached files that belong to uninstalled packages.
Again the number can be changed to keep a specific number of versions.

```sh
paccache -rvuk0
```

Since `yay` mirrors the usage of `pacman` it can be used the same way and will clean both caches.

```sh 
yay -Sc
```

Similar to `paccache` a command called [yaycache](https://github.com/aokellermann/yaycache) can be
used.
It follows the same options as `paccache`.

The clearing of the cache can be automated by using a [hook](#hook-clear-cache).

#### Enabling `multilib`

`multilib` is a repository that contains 32-bit software and libraries.
By default it is not enabled.
To enable it search and uncomment the following lines in the file `/etc/pacman.conf`.

```txt
[multilib]
Include = /etc/pacman.d/mirrorlist
```

#### Hooks

Hooks are commands that are run before or after installation of one or more packages.
They are needed to have the `.hook` extension and can be found inside two directories.
The first one is `/usr/share/libalpm/hooks/`.
The second one is defined in `HookDir` inside the file `/etc/pacman.conf`.
By default it points towards `/etc/pacman.d/hooks`.

Examples of hooks can be found in the following sections.

##### Hook: List Orphans

The following hook will display orphans after any package is update.
It was found in a
[reddit post by IBNash](https://www.reddit.com/r/archlinux/comments/dsnu81/hear_ye_archers_share_your_pacman_hooks/)
which references a
[gist by Strykar](https://gist.github.com/Strykar/3b3cd5bbdabe7e5c77f9414b2b4fe7e8).

```txt
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *

[Action]
Description = Searching for orphaned packages...
When = PostTransaction
Exec = /usr/bin/bash -c "/usr/bin/pacman -Qtd || /usr/bin/echo '==> no orphans found.'"
```

##### Hook: Clear Cache

The following hook will [clear the pacman cache](#clear-cache) except for the last version of a package.
It was found in a
[reddit post by IBNash](https://www.reddit.com/r/archlinux/comments/dsnu81/hear_ye_archers_share_your_pacman_hooks/)
which references an
[AUR comment by itaranto](https://aur.archlinux.org/packages/pacman-cleanup-hook).

```txt
[Trigger]
Type = Package
Operation = Remove
Operation = Install
Operation = Upgrade
Target = *

[Action]
Description = Removing unnecessary cached files (keeping the latest one)...
When = PostTransaction
Exec = /usr/bin/paccache -rvk1 && paccache -ruvk0
```

##### Hook: Informant

The following hook will use [informant](https://github.com/bradford-smith94/informant) to check for
Arch News that may require manual intervention and not allow the update if there are news unread.
It was found in a
[reddit post by IBNash](https://www.reddit.com/r/archlinux/comments/dsnu81/hear_ye_archers_share_your_pacman_hooks/)
which references the
[informant Github](https://github.com/bradford-smith94/informant/blob/master/informant.hook).

```txt
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = *
Target = !informant

[Action]
Description = Checking Arch News with Informant...
When = PreTransaction
Exec = /usr/bin/informant check
Depends = informant
AbortOnFail
```

##### Hook: Update Package Mirrorlist

The following hook will use [reflector](https://xyne.dev/projects/reflector/) to update the pacman
mirrorlist.
It will use german mirrors (`-c de`), will list the fastest 15 mirrors (`-n 15`) and only do so if
the mirror was online in the last 24 hours (`-a 24`).
It was found in a
[reddit post by IBNash](https://www.reddit.com/r/archlinux/comments/dsnu81/hear_ye_archers_share_your_pacman_hooks/)
which references the
[pacman-hooks Github](https://github.com/desbma/pacman-hooks/blob/master/reflector/reflector.hook).

```txt
[Trigger]
Operation = Upgrade
Type = Package
Target = pacman-mirrorlist

[Action]
Description = Updating pacman-mirrorlist with reflector...
When = PostTransaction
Depends = reflector
Exec = /bin/bash -c 'reflector -c de -n 15 -a 24 > /etc/pacman.d/mirrorlist ; test -f /etc/pacman.d/mirrorlist.pacnew && mv -v /etc/pacman.d/mirrorlist.{pacnew,orig} || true'
```

##### Hook: Kernel Reboot Needed

The following hook will use determine if a reboot is needed because the kernel was updated.
It was found in a
[reddit commend by progandy](https://www.reddit.com/r/archlinux/comments/dsnu81/comment/f6sogat).

```txt
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = File
Target = usr/lib/modules/*

[Action]
Description = Check for upgrade of running kernel...
When = PostTransaction
Exec = /bin/bash -c "[[ -f \"/proc/modules\" && ! -d \"/usr/lib/modules/$(uname -r)\" ]] && printf '==> WARNING: %s\n  -> %s\n' 'Running kernel has been updated or removed!' 'A reboot is required!' || true"
```

### Troubleshooting

This section addresses various uses of the pacman and yay package managers.

### `/usr/lib/firmware/nvidia/ad104` exists in filesystem linux-firmware-nvidia

This error comes from a decision to split the firmware modules into different parts.
An easy way to fix it is by simply reinstalling the `linux-firmware` package and updating the
packages of the system.

```sh 
pacman -Syu linux-firmware
```

#### Update Mirrorlist

After a while not updating the system it is possible for the mirrorlist to be
outdated.
This can be fixed by updating it with the following command:

```sh
curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/
```

#### Error While Importing Keys

Both `yay` and `pacman` use [GPG keys](/wiki/linux/gpg.md).
It is possible that it runs into errors when importing new keys.
If this happens you should try to restart the GPG key server
[as explained in the GPG entry](/wiki/linux/gpg.md#restart-the-gpg-server).

#### Unknown Public Key

If the error `ERROR: One or more PGP signatures could not be verified!`, you
have to manually receive the key and trust it.
This can be done [as explained in the GPG entry](/wiki/linux/gpg.md#receive-a-key-and-trust-it).

The identifier of the key usually gets gets printed in the line above the error looking like
`FAILED (unknown public key <KEYID>)`.

#### Error During Updating `is marginal trust`

If the error `[...] Key [...] is marginal trust` (also `of unknown trust`) occurs while updating
the system, it can be fixed by running the following commands and then restarting
the update process of the package manager.

```sh
pacman -Sy archlinux-keyring
pacman-key --populate archlinux
pacman-key --refresh-keys
```

#### Error During Updating `the following untracked working tree files would be overwritten`

The error `the following untracked working tree files would be overwritten` can happen when the
cache features a changed version of the files used by yay to update the package.
This can easily be fixed by removing the cache of the corresponding package.

#### Python `ModuleNotFoundError: No module named...`

This section is based on a
[StackOverflow post by Helen](https://stackoverflow.com/questions/55923868/how-to-fix-modulenotfounderror-no-module-named-setuptools).

In this case the error stems from a missing package.
Normally it can easily be fixed by installing that corresponding package.
But please note that [pyenv](/wiki/programming_languages/golang.md#setup) can hide packages if the
global Python version is set to something other than `system`.
This is especially the case on [Arch Linux-systems](/wiki/linux/arch-linux.md) because Python
packages are also installed via [Pacman or Yay](#arch-linux-pacman-and-yay).
In this case the global Version has to be changed to `system` or the package installed to the
non-system Python version.
