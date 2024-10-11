# Microcontroller

Microcontroller are small computers on an integrated circuit.
It contains a processor, memory and programmable in- and output.

## ESP32

The ESP32 is a cheap and low-energy microcontroller made by Espressif Systems.
It features Wi-Fi and [Bluetooth](/wiki/bluetooth.md).

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
