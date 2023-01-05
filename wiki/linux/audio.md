# Audio

Audio is an important point in a linux desktop environment

## Sound Server

A sound server is software that manages use and access of audio devices.
The following is a list of available sound servers.

- [PulseAudio](./pulseaudio.md) is the go-to sound server program used for
  linux.
- [Pipewire](./pipewire.md) is a modern graph based sound server.

## Noise cancellation

Removing noise can be achieved by using
sound processing software options for [sound server](#sound-server).
An example for this is the noise reduction included in
[easyeffects](/wiki/linux/easyeffects.md#noise-cancellation) for Pipewire.

As an alternative software explicitly made for the reduction of noise can be
installed.
Belonging to the latter option noise cancellation can be easily achieved by
installing [Noisetorch](https://github.com/lawl/NoiseTorch).
After the installation modify the `Voice Activation Threshhold` to your needs.
