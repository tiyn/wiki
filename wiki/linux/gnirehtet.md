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
For it to work the [Android](/wiki/android.md) device has to enable `USB Debugging` so Gnirehtet can automatically be
installed (which is internally done using `adb`).
Additionally `Use USB for` has to be set to `File Transfer` and not to
`USB Tethering` as this would start the normal tethering process and resolving internet access from
the [Linux](/wiki/linux.md) system to the Android device and not the other way around.

The initiating of the reverse tethering can be done by using the following command.

```sh 
gnirehtet run
```

When the `run` command is active the reverse tethering can be started and stopped using the
following commands.
If the `run` command is not active the reverse tethering will not work.

```sh 
gnirehtet start
gnirehtet stop
```
