# Audio

Audio is an important point in a linux desktop environment

## Pulseaudio

[Pulseaudio](https://www.freedesktop.org/wiki/Software/PulseAudio) is the go-to
audio server program for linux distributions.

## Noise cancellation

Noise cancellation can be easily achieved by installing
[Noisetorch](https://github.com/lawl/NoiseTorch).
After the installation modify the `Voice Activation Threshhold` to your needs.

## Pipewire

[Pipewire](https://pipewire.org) is a graph based processing engine for
`pulseaudio` and `JACK`.
It makes improvements for the input and output handling.

### Installation

If the current audio server program running is `pulseaudio`, you can just
install `pipewire-pulse` (on Arch-based distros or according packages on other
distros) and pipewire is running.
Make sure to restart to be sure everything is running correctly.

### Noise cancellation

Noise cancellation can be easily achieved in `pipewire`-style by installing
[easyeffects](https://github.com/wwmm/easyeffects).
Make sure to check the box `Process all Inputs` and `Process all Outputs` to
route everything through `easyeffects`.
Make log out of your system afterwards.
To enable noise cancellation navigate `Inputs` and click `Plugins`.
After that click `Add Plugin` and select `Noise Reduction`.
