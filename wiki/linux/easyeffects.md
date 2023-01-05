# Easyeffects

[Easyeffects](https://github.com/wwmm/easyeffects) is a free and open-source
GUI-software for applying sound effects and filters on input and output audio
streams.
Easyeffects uses [Pipewire](./pipewire.md) as
[sound server](/wiki/linux/audio.md#sound-server).

## Installation

Easyeffects can be installed in most distributions by installing the
`easyeffects` plugin.
An installation via [Flatpak](./flatpak.md) is also possible.

## Usage

Easyeffects can apply `Effects` to input and output sound.

### Noise cancellation

Noise cancellation can be achieved by installing
Easyeffects.
Make sure to check the box `Process all Inputs` and `Process all Outputs` to
route everything through `easyeffects`.
Make log out of your system afterwards.
To enable noise cancellation navigate `Inputs` and click `Plugins`.
After that click `Add Plugin` and select `Noise Reduction`.

### Presets

Presets can be created by selecting `Presets`, setting the name and clicking the
`+` to save it.
It is then displayed in the list below from where it can be loaded or deleted.
Presets are saved in the directory `~/.config/easyeffects/input` and
`~/.config/easyeffects/output`.

#### Recommended Presets

The following is a list of presets that have been tested and only need slight
configuration to adjust them to the specific system.

- [tiyns voice input preset](https://github.com/tiyn/dotfiles/blob/master/.config/easyeffects/input/voice.json)
  is a list of different effects to achieve an enhanced quality of microphone
  sound for speach.
