# Pipewire

[Pipewire](https://pipewire.org) is a graph based
[sound server](/wiki/linux/audio.md#sound-server).

## Setup

For clients that use the [PulseAudio](/wiki/linux/pulseaudio.md) API
`pipewire-pulse` (on Arch-based distros or according
packages on other distros) can be installed.
It will automatically remove unneeded and conflicting PulseAudio packages.
Additionally `pipewire-alsa` and `pipewire-jack` for JACK and Alsa clients are
available and recommended to install for full compatibility with most software.
Make sure to restart to be sure everything is running correctly.

## Usage

For simple sound processing in the form of volume adjustment as well as setting
the default input and output devices

### Volume Control

[`pavucontrol`](https://freedesktop.org/software/pulseaudio/pavucontrol/) can be
used as a simple mixer.

### Routing

This section focusses on graph-based interfaces also called patchbays.
For more advanced routing [qpwgraph](https://github.com/rncbc/qpwgraph) can be used, but the
GTK-based [Helvum](https://gitlab.freedesktop.org/pipewire/helvum) is also available.
The third available option is [Patchance](https://github.com/Houston4444/Patchance) - this is the
currently recommended software of this wiki.

### Equalizer, Noise Reduction, etc

For further sound processing the easiest way to do so is using
[easyeffects](/wiki/linux/easyeffects.md) which features a wide range of effects
to apply to sound streams including noise reduction.

### Get ID of an Input or Output

Using the following command a list of all connected input and output aswell as streams and devices
can be displayed.

```sh
wpctl status
```

Under the `Sinks` the outputs are displayed and under `Sources` the inputs.
Defaults are noted with an asterix.
The identificator is displayed prior to the name of the input, output, device or stream.

If a device name is known (in this case `"Starship/Matisse HD Audio Controller Analog Stereo"`).
The following command will return its identificator.

```sh
NAME=$(wpctl status | grep "Starship/Matisse HD Audio Controller Analog Stereo")
ID=$( echo $NAME | cut -d '.' -f 1 | cut -c 11-)

echo ID: $ID
```

### Loopback Input

An input can be output to the default output by using the following command.
In that command `<id>` is the identificator of the input that should be looped back.
It needs to be set accordingly.

```sh
pw-loopback -C <id>
```
