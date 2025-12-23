# Raspberry Pi

A [Rapberry Pi](https://www.raspberrypi.com) is a single board comuter.

## Setup

For setting up a classic Raspberry Pi an SD card is needed that contains the operating system.

For this an image has to be flashed.
The images of the operating systems can be found on the
[official website](https://www.raspberrypi.com/software/operating-systems).
A command to flash may look similar to the following example, where `<img-path>` is the path to the
image and `<disk-path>` is the path to the device to flash to (for example `/dev/sdb1`).

```sh 
dd if=<img-path> of=<disk-path> status=progress
```

This however can also be done using the Raspberry Pi imager - which most
[package managers](/wiki/linux/package_manager.md) package under `rpi-mager`.
It too can also be found on the [official website](https://www.raspberrypi.com/software).
When using the imager as a non-root user this user may have to be given rights to access disks or
at least the SD card as described in the
[corresponding article](/wiki/linux/disk-management.md#accessing-disks-as-user).

The setup using the imager is guided and easier.

## Hardware Additions

There are various hardware additions which can be used with the Raspberry Pi.
This section addresses them.

### AI HAT+

The [AI HAT](https://www.raspberrypi.com/documentation/accessories/ai-hat-plus.html) is an
extension which uses the [Hailo AI module](/wiki/hailo.md) for use with the
[Raspberry Pi 5](https://www.raspberrypi.com/products/raspberry-pi-5).
