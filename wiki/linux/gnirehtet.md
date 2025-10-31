# Gnirehtet

[Gnirehtet](https://github.com/Genymobile/gnirehtet) provides a reverse tethering setup for
[Android](/wiki/android.md) [smartphones](/wiki/smart_device.md#smartphones-and-tablet-computers).

## Setup

Many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package Gnirehtet in the `gnirehtet` package.

## Usage

This section addresses the usage of Gnirehtet.

## Setting Up and Running Reverse Tethering

The following command can be used to setup the reverse tethering and also run it.
For it to work the mobile device has to enable `USB Debugging` so Gnirehtet can automatically be
installed (which is internally done using `adb`).

```sh 
gnirehtet run
```

Alternatively and only after being set up correctly the reverse tethering can be started and
stopped with the corresponding two commands that follow.

```sh 
gnirehtet start
gnirehtet stop
```
