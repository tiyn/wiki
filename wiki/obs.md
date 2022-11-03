# OBS

[Open Broadcaster Software](https://obsproject.com) - short OBS - is a free
and open source software for video recording and live streaming.

## Virtual Camera

By using virtual camera the views of OBS can be used as an additional camera
output, making it possible to add effects and more to the video feed of the
camera.

### Installation

For Linux systems [V4L2](./linux/v4l2.md) needs to be set up.
This guide assumes it is set up according to the section in the
[V4L2 entry](./linux/v4l2.md#v4l2loopback).
Additionally `obs-v4l2sink` needs to be installed.
Under `Tools/v4l2sink` select the device path set up in V4L2 and the `YUV420`
video format.
Afterwards the virtual camera can be started.
