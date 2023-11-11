# Gadgetbridge

[Gadgetbridge](https://codeberg.org/Freeyourgadget/Gadgetbridge/) is a free and open source software
for [Android](/wiki/android.md) systems.
It is a cloudless replacement for proprietary software for
[smart devices](/wiki/smart_devices.md), but is especially designed for
[smartwatches and smart bands](/wiki/smart_devices.md#smartwatches-and-smart-bands).

## Setup

Gadgetbridge is available on [F-Droid](/wiki/android/f-droid.md) in a package called
[gadgetbridge](https://f-droid.org/packages/nodomain.freeyourgadget.gadgetbridge/).

## Usage

The following section addresses different uses and the configuration of different devices in
Gadgetbridge.

### Configuration of Devices

Devices can be added to Gadgetbridge by clicking on the `+` in the main screen.
Afterwards the device can simply be paired.

A special pairing procedure is needed for Amazfit or Xiaomi devices.
The following describes the steps that need to be done.

- Download the
  [Zepp app](https://play.google.com/store/apps/details?id=com.huami.watch.hmwatchmanager).
- Pair the device with the Zepp app.
- Use [huami-token](https://codeberg.org/argrento/huami-token/) to obtain the auth key by using the
  command `python3 huami_token.py --method amazfit --email my_email --password password --bt_keys`
  with adjusted values.
- Uninstall the Zepp app and unpair the device from inside the bluetooth settings of the smart
  phone.
- Inside the Gadgetbridge app click on the `+`, find the device and enter the auth key by long
  pressing on the devices name.
  Afterwards navigate back to the scanning list.
- Pair the device by clicking on the device name.

Afterwards the device will be paired and connected.

### Add Weather Function

For correct displaying of weather data an additional app is needed.
An example for this is the
[Weather notification app](https://f-droid.org/en/packages/ru.gelin.android.weather.notification/).
Install it, check the Gadgetbridge option inside the Weather notification app to on and set the
location.
Finally create an account at [OpenWeather](https://home.openweathermap.org).
On that website create an API key and paste it into the according setting in the Weather
notification app.
Finally set the desired location in the Gadgetbridge app inside the settings.
Afterwards the weather function will be working.

### Install Watchfaces

Watchfaces can be installed by using Gadgetbridges `File Installer` option that is available in the
menu of connected devices.
Watchface files for Xiaomi/Amazfit devices can be downloaded on
[amazfitwatchfaces.com](https://amazfitwatchfaces.com/).
The same catalog is also available as an
[Android app on the Google Play Store](https://play.google.com/store/apps/details?id=com.amazfitwatchfaces.st).
