# Audio

Audio is an important point in a linux desktop environment
For non-Linux specific audio software navigate to the corresponding
[wiki article](/wiki/audio.md).

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

## Control Audio from Command Line/by Hotkey

Audio from many different clients can be controlled (started, stopped, skipped)
using the command line with [PlayerCTL](/wiki/linux/playerctl.md).
With additional software it can also be used to control audio/music by pressing
hotkeys.
This is explained in the
[PlayerCTL entry](/wiki/linux/playerctl.md#using-hotkeys).

## Sound Board

There are various available software solutions for sound boards.
One option is [CasterSoundboard](https://github.com/JupiterBroadcasting/CasterSoundboard).
Another is the cue player
[Linux Show Player](https://linux-show-player-users.readthedocs.io/en/latest/index.html) which
should be installed using [flatpak](/wiki/linux/flatpak.md) (`org.linuxshowplayer.LinuxShowPlayer`).
