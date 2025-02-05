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

This section addresses various uses of the pacman and yay package managers.

#### Clean Cache

The cache of all packages except the one installed can be deleted by running the following command.

```sh
pacman -Sc
```

#### Update Mirrorlist

After a while not updating the system it is possible for the mirrorlist to be
outdated.
This can be fixed by updating it with the following command:

```sh
curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/
```

### Troubleshooting

This section addresses various errors that can happen when using the package managers yay and
pacman.

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

If the error `[...] Key [...] is marginal trust` occurs while updating the
system, it can be fixed by running the following commands and then restarting
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
