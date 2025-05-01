# Wi-Fi

Wi-Fi is a type of wireless network protocol that is used for local area networks.
On [Linux-based systems](/wiki/linux.md) there are different programs that handle the Wi-Fi
connection.

- [WPA Supplicant](/wiki/linux/wpa_supplicant.md) is used for WPA2 and WPA3 connections among
  others.
- [NetworkManager](/wiki/linux/networkmanager.md) is used for various network connections.

## Usage

Tipps for usage can be found under the corresponding entries.

## Troubleshooting

Tipps for troubleshooting can be found under the corresponding entries, but the ones that use
multiple programs to fix are listed here.

### Restart WPA Supplicant and Reenable the Wi-Fi device

A simple fix for many problems is a restart of [WPA Supplicant](/wiki/linux/wpa_supplicant.md)
aswell as reenabling the Wi-Fi device using [NetworkManager](/wiki/linux/networkmanager.md).
This can be done by first restarting WPA Supplicant as explained in the
[corresponding section](/wiki/linux/wpa_supplicant.md#restarting-wpa-supplicant) and then
reenabling the Wi-Fi device as explained in the
[section of NetworkManagers entry](/wiki/linux/networkmanager.md#restarting-and-reenabling-wi-fi).
