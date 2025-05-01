# WPA Supplicant

`wpa_supplicant` is a free implementation of an IEEE 802.11i supplicant.
It is especially interesting due to its WPA2 and WPA3 capabilities in contrast
to other networking software.
It is used to set up [Wi-Fi](/wiki/linux/wi-fi.md).

## Usage

### Connect to a WPA2 secured WLAN

This part assumes that your network interface is called `wlan0`
(change it accordingly).

- First make sure that your [network interface is up](./ip.md).
- Save the authentication details to a file by running
  `wpa_passphrase <SSID> >> /etc/wpa_supplicant.conf`
- Connect to the WLAN by running
  `wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf`
  (`-B` is optional for running the process in the background)

## Troubleshooting

This section focusses on the troubleshooting of situations where the system does not connect
correctly.

### Restarting WPA Supplicant

Most of the problems regarding WPA Supplicant can be fixed by restarting the 
[SystemD](/wiki/linux/systemd.md) service with the following command.

```sh
systemctl restart wpa_supplicant
```
