# Android

[Android](https://www.android.com/) is a mobile operating system based on a modified
[Linux](/wiki/linux.md) kernel.
It is designed primarily for mobile devices with touch screens like tablets or smart phones.

## Managing the Data

The data and files stored on Android
[smart devices](/wiki/smart_device.md#smartphones-and-tablet-computers) are sometimes needed on
computers.

For [Windows](/wiki/windows.md) this can easily be achieved by connecting it via USB.
No further software is needed as the device manager handles the phone correctly most of the times.

For [Linux-based systems](/wiki/linux.md) the
[device](/wiki/smart_device.md#smartphones-and-tablet-computers) also has to be connected to the
computer.
But in this case also a software is needed to [mount it](/wiki/linux/disk-management.md#mounting),
this software/program is called [android-file-transfer](/wiki/linux/android-file-transfer.md).
For further information and a guide on how to mount a Android device correctly navigate to the
[corresponding section](/wiki/linux/android-file-transfer.md#mounting-and-unmounting-android-device).

## App Store

The most used app store of android is the [Google Play Store](https://play.google.com/).
A free and open-source alternative to it is [F-Droid](/wiki/android/f-droid.md) which only features
open-source software.

A list of open-source software options is also available on Alberto Mosconis
[Github](/wiki/git.md#server-with-web-interface) repository
[foss apps](https://github.com/albertomosconi/foss-apps/tree/main).

Additionally open-source apps can be installed from source using
[Obtainium](https://github.com/ImranR98/Obtainium).

### Useful Applications

This section addresses various useful applications.

- [Arcticons](https://github.com/Donnnno/Arcticons) a mono-color line-based icon pack
- [disky](https://github.com/newhinton/disky) is a filesystem analyzer that shows usage of the
  storage.
- [Markor](https://github.com/gsantner/markor) is a text editor supporting
  [Markdown](/wiki/markup_language.md)
- [SystemUI Tuner](https://play.google.com/store/apps/details?id=com.zacharee1.systemuituner) is an
  application that allows various small tweaks for the Android user interface.

## Improve Security and Privacy

Security and privacy are important topics, especially so when dealing with mobile phones.
This section focusses on improving them on a standard Android system.

The Elecronic Frontier Foundation recommends the following changes in their guide 
[Guide](https://ssd.eff.org/module/how-to-get-to-know-android-privacy-and-security-settings).

- [2FA](#multi-factor-authentication)
- A strong password (though the usage of biometrics is not recommended due to the possibility of
  being physically forced to unlock a phone with them)
- Privacy permission
- Find my device
- Theft protection
- Google privacy checkup
- Backups (though the usage of them gives data to Google, so it may rather be turned off)
- Disable WEP networks
- Obscure lockscreen notifications

The YouTube Channel 9to5Google also has a 
[video on security and privcacy](https://www.youtube.com/watch?v=eswIeNxSIqo) which additionally
suggest the following changes.

- Alert when clipboard is accessed
- Enable app pinnig

Another option to add which may not improve security or privacy but improves usability - especially
if a difficult passphrase is used - is the enabling of "Extend Unlock".
There "Trusted Devices" can be set or the "On-body Detection" can be enabled.

## Multi-Factor Authentication

[Multi-factor authentication](/wiki/multi-factor_authentication.md) can easily be set up on android
systems.
For this the arguably most used app is
[Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=de&gl=US).
A free and open-source alternative for it is FreeOTP+.
This app is available at [F-Droid](/wiki/android/f-droid.md) as
[FreeOTP+](https://f-droid.org/de/packages/org.liberty.android.freeotpplus/) and on
[Google Play Store](#app-store) by the
[same name](https://f-droid.org/de/packages/org.liberty.android.freeotpplus/).

## Custom ROMs

Besites the stock-firmware of vendors there are also custom ROMs.
These are alternative firmware variants made by third party providers.
A well known custom ROM is [LineageOS](/wiki/android/lineageos.md).

It is possible that some custom ROMs require the user to
[unlock the bootloader](#unlocking-the-bootloader) before the installation can happen.

## Unlocking the Bootloader

Unlocking the bootloader can be a bit challenging for some vendors especially.

For [smartphones and tablets](/wiki/smart_device.md#smartphones-and-tablet-computers) made by
Xiaomi there are some steps that have to be done to unlock the bootloader.
This section is based on an
[article about unlocking the bootloader](https://new.c.mi.com/global/post/101245) on Xiaomi
Community aswell as another
[article on specifics for HyperOS](https://xiaomiui.net/how-unlock-bootloader-xiaomi-hyperos-53493/).
First the user has to apply to unlock the bootloader.
For this open the Xiaomi Community app, navigate to the "Settings" and select "Change region".
Select the region "Global".
A new option called "Unlock bootloader" now appears in the settings.
Select "Unlock bootloader" and "Apply for unlocking".
It may be possible that a specified time has to be waited for the application process to happen.
Next go to the phones settings.
Navigate to "About Phone" and "MIUI Version", repeatedly tap on "MIUI version" to get into
developer mode if the phone is not already in developer mode.
Navigate to "Additional settings" and "Developer options".
Enable "OEM unlocking" and "USB debugging".
Now add your Xiaomi account to your device.
To do so navigate to "Mi Unlock status" and agree then "Add account and device".
Shutdown your phone and boot into "Fastboot" by holding down the volume down button and the power
button.
Then connect it to a computer via USB.
The following steps have to take place on a [Windows](/wiki/windows.md) system or an emulation or
virtualization of it.
Download and start "Mi Unlock" - it is available on the
[article mentioned prior in this section](https://new.c.mi.com/global/post/101245).
Follow the steps of the software, select "Unlock" and confirm it multiple times.
It is possible that now 72 hours have to pass for the unlocking process to continue.
If that is the case wait the specified amount of time and repeat the last step.
Make sure to not apply for unlocking again and do not add your account to your phone again as this
will reset the timer.
