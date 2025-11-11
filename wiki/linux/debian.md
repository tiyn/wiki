# Debian

[Debian](https://www.debian.org/) is a free and open-source [Linux](/wiki/linux.md) distribution.
Debian uses the [APT](/wiki/linux/package_manager/apt.md) package manager.

## Usage

This section addresses the usage of Debian specific tasks.

### Retrieve Debian Version

The current version of a Debian system can be retrieved by running the following command.

```sh
cat /etc/os-release
```

### Upgrading to a Higher Major Version

The first step for a major upgrade usually is
[retrieving the current version](#retrieve-debian-version) to check the version that should be
installed.

If the user of the system to perform a major version upgrade on is using [Docker](/wiki/docker.md)
some additional steps have to be taken before the upgrade.
It is generally recommended to hold the Docker upgrade and performing it later.
For this reason the following command has to be run first.

```sh
apt-mark hold docker-ce docker-ce-cli containerd.io
```

Afterward the packages of the current major release version have to be
[upgrading](/wiki/linux/package_manager/apt.md#updating-upgrading) using APTs `full-upgrade`
option.
Then a reboot is recommended.

After restarting APT needs to be assigned new sources.
This can be done by editing the file `/etc/apt/sources.list` and replacing everything within with
the new sources.
For Debians 12th version called bookworm this lines to add are the following.

```txt
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
```

Following this a [full upgrade](/wiki/linux/package_manager/apt.md#updating-upgrading) has to be
performed.
Sometimes this process asks if the user wants to replace the local configuration files with newer
ones.
It is generally recommended to select `N` and reject these new configurations.

Finally another reboot is needed and the version number can be
[checked again](#retrieve-debian-version) confirming that the major version upgrade was
successfully performed.

When the system ran Docker and its upgrade was put on hold as described at the start of this
section the following commands have to be run to finalize the major upgrade, take Docker from the
hold list and upgrade it.

```sh
apt-mark unhold docker-ce docker-ce-cli containerd.io
apt update
apt install --only-upgrade docker-ce docker-ce-cli containerd.io
```
