# NetworkManager

NetworkManager - short NM - is a program to automatically detect and connect to
networks by providing options for various configuration.

## Installation

NetworkManager can be installed with the `networkmanager` package on most linux
distributions which provides daemon aswell as `nmcli` a command line interface
and `nmtui` a terminal user interface for configuration.
Additionally `nm-connection-editor` can be installed for a graphical user
interface.

## Usage

After installation `networkmanager.service` has to be enabled by the used
[init-system](/wiki/linux/init.md) (for example
[systemD](/wiki/linux/systemd.md#startstopenabledisable-a-service)).

### OpenVPN

NetworkManager needs a plugin to work with openvpn configurations.
This plugin can be installed with the `networkmanager-openvpn` package.

OpenVPNs `.ovpn` files can then be imported by running
`nmcli connection import type openvpn file <openvpn-file>`.
Afterwards they can be modified accordingly.
