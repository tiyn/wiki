# OBS

[Open Broadcaster Software](https://obsproject.com) - short OBS - is a free
and open source software for video recording and live streaming.
Additionally see the
[the webcams entry](/wiki/linux/webcams.md#configure-the-webcam) if on Linux.

## Plugins

There are several plugins made by non-obs developers.
The plugins introduce different and new features.

### Virtual Camera

By using a virtual camera the views of OBS can be used as an additional camera
output, making it possible to add effects and more to the video feed of the
camera.

#### Installation (Linux)

First of all [V4L2](./linux/v4l2.md) needs to be set up.
This guide assumes it is set up according to the section in the
[V4L2 entry](./linux/v4l2.md#v4l2loopback).
Make sure to
[start the service](/wiki/linux/systemd.md#startstopenabledisable-a-service) by
running `systemctl start v4l2loopback.service` or enable it to start after each
boot with `systemctl enable v4l2loopback.service`.
Afterwards the virtual camera can be started.

### Background Removal

Background removal removes the background of a camera image stream.
The removed background can be replaced with color key filters.

#### Installation

Made by royshil
[the github page](https://github.com/royshil/obs-backgroundremoval#linux)
describes various possibilities to install the background removal for OBS on
different systems.
On Linux systems background removal is often contained in a package named
`obs-backgroundremoval` or similarly.
