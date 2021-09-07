# WPA Supplicant

`wpa_supplicant` is a free implementation of an IEEE 802.11i supplicant.
It is especially interesting due to its WPA2 and WPA3 capabilities in contrast
to other networking software.

## Connect to a WPA2 secured WLAN

This part assumes that your network interface is called `wlan0`
(change it accordingly).

- First make sure that your [network interface is up](./ip.md).
- Save the authentication details to a file by running
  `wpa_passphrase <SSID> >> /etc/wpa_supplicant.conf`
- Connect to the WLAN by running
  `wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf`
  (`-B` is optional for running the process in the background)
