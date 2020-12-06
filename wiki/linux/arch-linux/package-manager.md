# Package Manager

Package managers are important programs to get software onto your system.
In Arch Linux there are 2 main package managers.
One is `pacman`, the default package manager.
But there are also a bunch other managers for the Arch User Repositories (AUR).

In this article I'll use `yay` as my go to AUR manager.
`yay` is also a wrapper for `pacman` so you can just use `yay` instead of pacman
to install programs.

## Bugfixes

### Error while importing keys

Both `yay` and `pacman` use gpg keys to confirm the package manager gets the
right package.
It is possible that it runs into errors when importing new keys.
If this happens you should try to restart your gpg key server with
`gpgconf --kill all`.
