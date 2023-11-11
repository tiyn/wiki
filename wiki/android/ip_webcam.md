# IP Webcam

[IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam&hl=de&gl=US) is an App
developed and published by Pavel Khlebovich for [Android](/wiki/android.md) systems.
It enables a [smartphone](/wiki/smart_devices.md) to be used as [webcam](/wiki/webcams.md).

## Setup

On [Android](/wiki/android.md) IP Webcam is available on the
[Google Play Store](/wiki/android.md#app-store) in a package called
[IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam&hl=de&gl=US).

## Usage

To initiate a connection between the [smartphone](/wiki/smart_devices.md) and the computer first
start the app on the smartphone.
Make sure to be connected to the same W-LAN as the computer or alternatively connect them with an
USB-cable.
After starting the application an IPv4 link be displayed.
This link can be pasted into a [browser](/wiki/web_browser.md).
There the video aswell as various settings will be available.
An example link will look like the following.

```txt
http://192.168.178.66:8080
```

Additionally it can be piped into [OBS](/wiki/obs.md) to edit it or into
[ffmpeg](/wiki/linux/ffmpeg.md) on [Linux](/wiki/linux.md) systems to create a virtual webcam
device as explained in the
[ffmpeg entry](/wiki/linux/ffmpeg.md#create-a-virtual-camera-using-an-ip-video-stream).
The link used for applications like this will be the previously displayed IPv4 link aswell as an
appended `/videofeed`.
An example link will look like the following.

```txt
http://192.168.178.66:8080/videofeed
```
