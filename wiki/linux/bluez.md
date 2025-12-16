# BlueZ

[BlueZ](http://www.bluez.org/) is an implementation of the
[Bluetooth](/wiki/bluetooth.md) standard.
This entry features the BlueZ package and all software that is based on it.

## Setup

On most [Linux](/wiki/linux.md) distributions BlueZ can be installed with the `bluez` package.
Additionally the `bluez-utils` package needs to be installed.
To load the kernel module `modprobe btusb` needs to be run.
Afterwards the
[service](/wiki/linux/systemd.md#startstopenabledisable-a-service) can be
started and enabled by running the following commands.

```sh
systemctl start bluetooth.service
systemctl enable bluetooth.service
```

## Usage

The Bluetooth features can be managed by different types of front-ends.

- `bluetoothctl` is a command-line interface included in the `bluez-utils`
  package
- `bluetuith` can be used as a bluetooth manager with a
  [terminal](/wiki/linux/system_console.md) user interface.
  It is included in a package of the same name, that needs to be installed
  before usage.
  Using `bluetuith` the [Bluetooth](/wiki/bluetooth.md) can be turned on (or off) by pressing `o`,
  devices can be searched for by pressing `s`, a selected device can be paired by pressing `p` and
  finally connected by pressing `c` before `bluetuith` can be left with `Q`.
