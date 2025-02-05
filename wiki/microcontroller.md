# Microcontroller

Microcontroller are small computers on an integrated circuit.
It contains a processor, memory and programmable in- and output.

## ESP32

The ESP32 is a cheap and low-energy microcontroller made by Espressif Systems.
It features Wi-Fi and [Bluetooth](/wiki/bluetooth.md).
Some variants of this chip also include LoRa-capability and can be used to communicate via
[Meshtastic](/wiki/meshtastic.md).

### Flash Firmware on the ESP32 

This section especially focusses on the ESP32S3 microcontroller.
For other microcontroller of the ESP32-xx family the process should be similar.

- Download [ESP RF Test Tool and Test Guide](https://www.espressif.com/en/support/download/other-tools)
- Download [Firmware of ESP32S3](https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/res/XIAO-ESP32S3-firmware-20240814.zip)
- Open `EspRFTestTool_vX.X_Manual.exe`
  - Select the `ESP32S3` as `ChipType`
  - Select the correct `COM` for your ESP
  - Set the `BaudRate` to 115200
  - Click `open`
  - Click `Select Bin` and search for your ESP32S3 Firmware (probably named `xiao_esp32s3_firmware.bin` or similar)
  - Left of the `Select Bin` button select `USB` and `Flash` for the two drop-down options
  - Click `Load Bin`
  - After the upload of the data a completion message should appear
- The ESP32S3 is completely flashed

### Programming Mode  

When connecting an ESP32 to the computer it needs to be in programming mode.
If it is not in programming mode it will show up as port but will encounter `Write Timeout` Errors
when trying to flash programs or firmware onto it.
To put the ESP32 in the programming mode press and hold the Boot-Button (usually labeled `B`).
Then press and release the Reset-Button (usually labeled `R`).
Afterwards release the Boot-Button.
The board now should be in programming mode and it should be possible to upload and flash programs
or firmware onto it.
This section is based on a Reddit
[comment by cmatkin](https://www.reddit.com/r/esp32/comments/1g8gerg/getting_a_write_timeout_error_on_my_esp32s3/).
