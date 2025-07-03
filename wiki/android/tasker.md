# Tasker

[Tasker](https://tasker.joaoapps.com/) is a tool to automate various settings and other things on
an [Android-phone](/wiki/android.md).

## Setup

On [Android](/wiki/android.md) /name/ is available on the
[Google Play store](/wiki/android.md#app-store) in a package called
[Tasker](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm).

Additionally the installation of [Tasker Settings](https://github.com/joaomgcd/TaskerSettings) is
recommended.
Please note that on the [Github releases page](https://github.com/joaomgcd/TaskerSettings/releases)
there are different versions to be used with Xiaomi-phones.

Another recommended action to be taken is to grant Tasker permission to write secure settings.
This has to be done for Tasker to be able to turn on or off Wifi and Location.
Allowing Tasker to set these settings can be done by the following command that has to be run on a
computer with the corresponding phone connected via USB and USB-debugging enabled.

```sh
adb shell pm grant net.dinglisch.android.taskerm android.permission.WRITE_SECURE_SETTINGS
```

`adb` is also often used to install [LineageOS](/wiki/android/lineageos.md).

## Usage

This section addresses the usage of Tasker.

On Tasker profiles, tasks and more can be manually added and edited.
An easier way to get things started is importing premade Tasker projects from
[TaskerNet](https://taskernet.com/?public).

Recommended TaskerNet-projects are the following.

- Flip To Shhh
