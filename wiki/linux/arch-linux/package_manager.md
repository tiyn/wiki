# Pacman and Yay

Package managers are important programs to get software onto your system.
In Arch Linux there are 2 main package managers.
One is `pacman`, the default package manager.
But there are also a bunch other managers for the Arch User Repositories (AUR).

In this article `yay` is used as the go to AUR manager.
`yay` is also a wrapper for `pacman` so you can just use `yay` instead of pacman
to install programs.

## Update Mirrorlist

After a while not updating the system it is possible for the mirrorlist to be
outdated.
This can be fixed by updating it with the following command:

```sh
curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/
```

## Bugfixes

### Error while importing keys

Both `yay` and `pacman` use gpg keys to confirm the package manager gets the
right package.
It is possible that it runs into errors when importing new keys.
If this happens you should try to restart your gpg key server with
`gpgconf --kill all`.

### Unknown public key

If the error `ERROR: One or more PGP signatures could not be verified!`, you
have to manually receive the key and trust it.
This is done by running the following lines:

```sh
gpg --recv-key <KEYID>
gpg --lsign <KEYID>
```

Where <KEYID> is the placeholder of the identification string of the key.
It usually gets gets printed in the line above the error looking like
`FAILED (unknown public key <KEYID>)`.

### Error while updating `is marginal trust`

Both `yay` and `pacman` use gpg keys to confirm the package manager gets the
right package.
It is possible that it runs into errors when importing new keys.
If the error `[...] Key [...] is marginal trust` occurs while updating the
system, it can be fixed by running the following commands and then restarting
the update process of the package manager.

```sh
pacman -Sy archlinux-keyring
pacman-key --populate archlinux
pacman-key --refresh-keys
```
