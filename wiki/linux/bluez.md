# BlueZ

[BlueZ](http://www.bluez.org/) is an implementation of the [Bluetooth](/wiki/bluetooth.md)
standard.
This entry features the BlueZ package and all software that is based on it.

## Setup

On most [Linux](/wiki/linux.md) distributions BlueZ can be installed with the `bluez` package.
Additionally, the `bluez-utils` package needs to be installed.
To load the kernel module `modprobe btusb` needs to be run.
Afterward, the
[service](/wiki/linux/systemd.md#startstopenabledisable-a-service) can be
started and enabled by running the following commands.

```sh
systemctl start bluetooth.service
systemctl enable bluetooth.service
```

## Usage

This section addresses the usage of Bluez.

### Connecting and Pairing of Devices

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

## Troubleshooting

This section will focus on errors and the fixing of errors of Bluez.

### `bluetuith: no adapter found` or `bluetoothctl: No default controller available`

When this error occurs the adapter is not recognized by the software.
This can be confirmed using the following command and looking for the bluetooth adapter.

```sh
lsusb
```

If it is indeed not found it may be blocked by `rfkill`.
To check this run the following command.

```sh
rfkill
```

This command will display something similar to the following.

```txt
0: hci0: Bluetooth
        Soft blocked: no
        Hard blocked: no
```

If the command displays `Soft blocked: yes` or `Hard blocked: yes` beneath the Bluetooth device it
has to be unblocked to use it.
For this run the following command where `<bluetooth-adapter>` is the name of the Bluetooth adapter
(in this case it would be `hci0`).

```sh
rfkill unblock <bluetooth-adapter>
```

Afterward, the adapter will probably be recognized again but a restart of service
`bluetooth.service` eventually has to be restarted as described in the
[systemd entry](/wiki/linux/systemd.md#startstopenabledisable-a-service-and-retrieve-its-logs).
