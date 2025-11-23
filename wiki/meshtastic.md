# Meshtastic

[Meshtastic](https://meshtastic.org/) is an off-grid protocol using LoRa.
To use Meshtastic a node and a phone using the corresponding Meshtastic app to connect to it is
needed.

## Setting Up a Meshtastic Node

To setup a Meshtastic Node a device that is capable of communicating via LoRa is needed.
Often used devices are [microcontrollers](/wiki/microcontroller.md) based on the
[ESP32-chip](/wiki/microcontroller.md#esp32) like the LILYGO TTGO T-BEAM or the Heltec V3, devices
based on the nRF52-chip like the RAK4631 and the LILYGO TTGO T-Echo or devices based on the
RP2040-chip like the [Raspberry Pi](/wiki/linux/raspberry_pi.md) Pico or the RAK11310 are needed.

After the device acquisition the meshtastic firmware needs to be flashed on the device.
This can be done using the [official Meshtastic Web Flasher](https://flasher.meshtastic.org/).
After selection of the device and the firmware the flashing process can be started.
The flasher works especially well on [Chrome-based Browsers](/wiki/web_browser.md).

The firmware can also be flashed using the command line.
To first check if the device is connected correctly the 
[Python-package](/wiki/programming-languages/python.md) `esptool` can be used which can be
installed using [pip](/wiki/programming-languages/python.md#modules).
Some [package managers](/wiki/linux/package_manager.md) of
[Linux-based operating systems](/wiki/linux.md) also feature a standalone `esptool` package.
The following command will output the chip of the device connected.

```sh 
esptool chip_id
```

Please note that on Linux sometimes the command varies a bit.
`esptool.py chip_id` is also common depending on the used distribution.
Because the command needs hardware access it also is possible that `sudo`-rights are needed.

After confirming that the device is recognized by esptool the flashing can be achieved by
downloading the firmware that corresponds with the selected device and running the
`device-install.sh` (for Linux and Mac) or the `device-install.bat` script (for
[Windows](/wiki/windows.md)).

The firmware can be downloaded from the [official website](https://meshtastic.org/downloads/) or
[the GitHub page of the project](https://github.com/meshtastic/firmware/releases).
Make sure to select the firmware (starting with `firmware-`) `zip`-archive that corresponds with
your target device.
Afterwards unzip it and run one of the following commands depending on your operating system.
Make sure to adjust `<Board>` and `<Version>` accordingly.

```sh 
./device-install.sh -f firmware-<Board>-<Version>.bin
device-install.bat -f firmware-<Board>-<Version>.bin
```

To update a device to a newer firmware version one of the following commands can be used.

```sh 
./device-update.sh -f firmware-<Board>-<Version>-update.bin
./device-update.bat -f firmware-<Board>-<Version>-update.bin
```

After this the flashing of the firmware is done.
Connect the Meshtastic app of your mobile phone to the node via Bluetooth and continue by
configuring the node.
Then the node and you are ready to communicate with other nodes and users.
