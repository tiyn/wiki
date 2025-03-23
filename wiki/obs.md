# OBS

[Open Broadcaster Software](https://obsproject.com) - short OBS - is a free
and open source software for video recording and live streaming.
For webcams and their configuration see [the webcams entry](/wiki/webcams.md#configure-the-webcam).

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
Afterwards the virtual camera can be started.

### Background Removal

Background removal removes the background of a camera image stream.
The removed background can be replaced with color key filters.

#### Installation

Made by royshil
[the GitHub page](https://github.com/royshil/obs-backgroundremoval#linux)
describes various possibilities to install the background removal for OBS on
different systems.
On Linux systems background removal is often contained in a package named
`obs-backgroundremoval` or similarly.

## Troubleshooting

This section focusses on various errors that can appear by using OBS.

### `Output Failed: If you are using NVENC or AMD encoders, make sure the video drivers are up to date`

This error does occur most of the time when trying to start
[OBS' virtual camera](/wiki/obs.md#virtual-camera).
If all the drivers are up to date there is a chance that it is caused by a bug or error in the code
of [V4L2](/wiki/linux/v4l2.md).
A possible fix is described in a 
[corresponding section of the V4L2 entry](/wiki/linux/v4l2.md#failed-to-start-streaming-on-devvideo2-invalid-argument).
