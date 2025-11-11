# APT

In [Debian](/wiki/linux/debian.md) the APT package manager is used.
It is also used for various Debian-based distributions.

## Usage

This section addresses various usages of the APT package manager.

### Updating & Upgrading

This section addresses the updating of all packages managed by APT.
To update the packages it is recommended to first update the package list with the following
command.

```sh
apt update
```

Afterwards there are two possible update types without changing the major release version.

The following command - `upgrade` - updates the packages only if no new or previously removed dependencies are
needed.
It is generally used for day-to-day updating without bigger jumps between versions.

```sh
apt upgrade
```

The other option is `full-upgrade` which was previously also known as `dist-upgrade`.
This command will also install, remove and replace dependencies if it is needed to update the
package.
It is mostly used for bigger updates like Kernel or release upgrade without changing the major
version.

```sh
apt full-upgrade
```
