# NetworkManager

NetworkManager - short NM - is a program to automatically detect and connect to
networks by providing options for various configuration.
It is used to set up [Wi-Fi](/wiki/linux/hardware_%28linux%29.md#wi-fi).

## Setup

NetworkManager can be installed with the `networkmanager` package on most linux distributions which
provides daemon aswell as `nmcli` a command line interface and `nmtui` a
[terminal](/wiki/linux/system_console.md) user interface for configuration.
Additionally, `nm-connection-editor` can be installed for a graphical user interface.

## Usage

After installation `networkmanager.service` has to be enabled by the used
[init-system](/wiki/linux/init.md) (for example
[systemD](/wiki/linux/systemd.md#startstopenabledisable-a-service)).

### OpenVPN Integration

NetworkManager needs a plugin to work with OpenVPN configurations.
This plugin can be installed with the `networkmanager-openvpn` package.

OpenVPNs `.ovpn` files can then be imported by running
`nmcli connection import type openvpn file <openvpn-file>`.
Afterward, they can be modified accordingly.

### Prioritize Connections

Connections can be prioritized making NetworkManager chose specific ones over others.
This can be done using `nm-connection-editor`.
Select the connection and navigate to `General`.
Then set the priority under `Connect automaticcally with priority` where `0` is the highest
priority, `1` being the next highest and so on.

## Troubleshooting

This section focusses on the troubleshooting of situations where the system does not connect
correctly.

### Restarting and Reenabling Wi-Fi

A useful chain of commands is the following.
It will restart the [SystemD](/wiki/linux/systemd.md) service and enable the Wi-Fi device.

```sh
systemctl restart NetworkManager
nmcli radio wifi on
```

If the error still persists afterwards it may be useful to also restart WPA Supplicant as explained
[in the corresponding section of its entry](/wiki/linux/wpa_supplicant.md#restarting-wpa-supplicant).
