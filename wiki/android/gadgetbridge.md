# Gadgetbridge

[Gadgetbridge](https://codeberg.org/Freeyourgadget/Gadgetbridge/) is a free and open source software
for [Android](/wiki/android.md) systems.
It is a cloudless replacement for proprietary software for
[smart devices](/wiki/smart_device.md), but is especially designed for
[smartwatches and smart bands](/wiki/smart_device.md#smartwatches-and-smart-bands).

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
This section is based on the official documentation and recommendation that can be found on
[Gadgetbridges Codeberg page](https://codeberg.org/Freeyourgadget/Gadgetbridge/wiki/Weather#user-content-install-and-configure-openweatherprovider).

An example for this is the [Breezy Weather app](https://github.com/breezy-weather/breezy-weather)
which is available on the F-Droid store.
Install and configure it to your needs.
Then check the Gadgetbridge option insdie the Breezy Weather app.
Afterwards the weather function will be working.

In the past an application named
[Weather Notification](https://f-droid.org/en/packages/ru.gelin.android.weather.notification/)
was often used.
The installation and configuration process was similar but an
[OpenWeather](https://home.openweathermap.org)  API key had to be specified in the Weather
Notification app.
For this an account on [OpenWeather](https://home.openweathermap.org) was needed.
Due to different API versions Weather Notification currently does not work.
However it is possible that an update to the application will bring a fix in the future.

### Install Watchfaces

Watchfaces can be installed by using Gadgetbridges `File Installer` option that is available in the
menu of connected devices.
Watchface files for Xiaomi/Amazfit devices can be downloaded on
[amazfitwatchfaces.com](https://amazfitwatchfaces.com/).
The same catalog is also available as an
[Android app on the Google Play Store](https://play.google.com/store/apps/details?id=com.amazfitwatchfaces.st).

This section is based on a 
[Reddit post by myhairisawesome](https://www.reddit.com/r/Huawei/comments/1dexenl/watch_fit_3_is_there_a_way_to_create_custom_watch/).

### Download Maps

To download one or more map files to display them for activity GPS data on the mobile phone
navigate to the main `Settings`.
Then Select `Maps` and set the `Folder` aswell as download the map and move it into the selected
folder.
