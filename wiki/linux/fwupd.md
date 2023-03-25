# fwupd

[fwupd](https://fwupd.org/) is a daemon for managing and installing firmware
updates on Linux based operating systems.
It is mainly used for UEFI firmware and supported devices.

## Setup

fwupd can be installed on most distributions by installing the
`fwupd` package.

## Usage

The following commands describe the basic usage of an update process using
fwupd.

First the devices updatable by fwupd can be checked.

```sh
fwupdmgr get-devices
```

Afterwards the latest metadata can be downloaded by the following command.

```sh
fwupdmgr refresh
```

The updates can the be listed.

```sh
fwupdmgr get-updates
```

Finally the updates can be installed.

```sh
fwupdmgr update
```
