# Pipewire

[Pipewire](https://pipewire.org) is a graph based
[sound server](/wiki/linux/audio.md#sound-server).

## Setup

For clients that use the [PulseAudio](/wiki/linux/pulseaudio.md) API
`pipewire-pulse` (on Arch-based distros or according
packages on other distros) can be installed.
It will automatically remove unneeded and conflicting PulseAudio packages.
Additionally `pipewire-alsa` and `pipewire-jack` for JACK and Alsa clients are
available.
Make sure to restart to be sure everything is running correctly.

## Usage

For simple sound processing in the form of volume adjustment as well as setting
the default input and output devices `pavucontrol` can be used as a simple
mixer.
For further sound processing the easiest way to do so is using
[easyeffects](/wiki/linux/easyeffects.md) which features a wide range of effects
to apply to sound streams including noise reduction.
