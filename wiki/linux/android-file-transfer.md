# android-file-transfer

[android-file-transfer](https://github.com/whoozle/android-file-transfer-linux) is an MTP client
that allows accessing the files of an [Android](/wiki/android.md)
[smart device](/wiki/smart_device.md#smartphones-and-tablet-computers) under
[Linux](/wiki/linux.md).

## Setup

On most linux distributions Khal can be installed with the `android-file-transfer` package.
Alternatively it can be installed via
[GitHub](https://github.com/whoozle/android-file-transfer-linux).
 
## Usage

This section addresses the usage of android-file-transfer.

### Mounting and Unmounting Android Device

An [Android](/wiki/android.md)
[smart device](/wiki/smart_device.md#smartphones-and-tablet-computers) can be mounted by using the
following command.
Please note that this command assumes one Android device is connected via USB.
In this case the device will be mounted on the directory `~/mnt`.

```sh 
aft-mtp-mount ~/mnt
```
