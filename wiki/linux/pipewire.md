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

This section will focus on the usage of Pipewire.

### Mixing

For simple sound processing in the form of volume adjustment as well as setting
the default input and output devices
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

### Virtual Devices

This section focusses on the temporary and permanent creation and removal of virtual devices like
virtual sinks and sources aswell as coupled nodes like loopbacks.

#### Creating a Null Device

This section will focus on the creation of a dummy device.
That is a virtual device that can be selected as output but is not used by default.
This can be useful to record applications as their sound can cleanly be passed to the dummy device
which will eliminate other applications sounds.
If the goal is to record and listen to an application at the same time navigate to
[the application loopback section](#creating-an-application-loopback)

The source for this section of the entry is derived by
[Pipewire Gitlab site](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Virtual-Devices#single-nodes).

A dummy device, or null sink, can be created permanently by creating a `.conf` file inside the
`~/.config/pipewire/pipewire.conf.d` directory with the following lines.


```txt
context.objects = [
    {   factory = adapter
        args = {
            factory.name     = support.null-audio-sink
            node.name        = "null-sink-0"
            node.description = "Null Sink 0"
            media.class      = Audio/Sink
            audio.position   = [ FL FR ]
            monitor.channel-volumes = true
            monitor.passthrough = true
            adapter.auto-port-config = {
                mode = dsp
                monitor = true
                position = preserve
            }
        }
    }
]
```

Multiple devices can be created by creating different files in the directory.

If the null sink is only needed temporarily (until the next restart) the following line can be used
to create it.
Use different `sink_name`s to create multiple dummy devices.

```sh
pactl load-module module-null-sink media.class=Audio/Sink sink_name=null-sink-0 channel_map=stereo
```

This will return an id that can be used to remove the sink with the following command.

```sh 
pactl unload-module <id>
```

#### Creating a Device Loopback

In this section a device loopback is defined as a loopback that takes a device as input.
This can be useful to listen to input devices, such as audio interfaces with connected microphones,
instruments, etc.

The source for this section of the entry is derived by
[Pipewire Gitlab site](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Virtual-Devices#single-nodes)
and [the official website](https://docs.pipewire.org/page_module_loopback.html).

A device loopback can be created permanently by creating a `.conf` file inside the
`~/.config/pipewire/pipewire.conf.d` directory with the following lines.

```txt
context.modules = [
  {
    name = libpipewire-module-loopback
    args = {
      audio.position = [ FL FR ]
      capture.props = {
        media.class = "Stream/Input/Audio"
        node.name = "device-loopback-1-recording"
        node.description = "Device-Loopback 1 Recording"
      }
      playback.props = {
        media.class = "Stream/Output/Audio"
        node.name = "device-loopback-1-playback"
        node.description = "Device-Loopback 1 Playback"
      }
      audio.volume = 0.5
      audio.mute = true
    }
  }
]
```

The created device loopback is made up by two parts that can be found in different places inside a
mixer like [pavucontrol](#volume-control).
The part called `Device-Loopback 1 Recording` in the example config can be found in the `Recording`
tab.
There the device to loopback can be selected.
The second part called `Device-Loopback 1 Playback` is available under the `Playback` tab and
allows to switch the selection of the output device.

#### Creating an Application Loopback

This section will focus on the creation of an application loopback.
In this section an application loopback is defined as a loopback that takes an application as input.
This can be useful to record applications as their sound can cleanly be passed to the sink sink of
the applicatino loopback which will eliminate other applications sounds.
If the goal is to record and not listen to the application at the same time navigate to
[the null device section](#creating-a-null-device).
Alternatively the null device can also be selected as a output device for the playback part of the
application loopback which makes it easily and seemlessly possible to switch between listening in
and not listening without changing the device that is recorded by the capturing program.

The source for this section of the entry is derived by
[Pipewire Gitlab site](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Virtual-Devices#single-nodes)
and [the official website](https://docs.pipewire.org/page_module_loopback.html).

An application loopback can be created permanently by creating a `.conf` file inside the
`~/.config/pipewire/pipewire.conf.d` directory with the following lines.

```txt 
context.modules = [{
    name = libpipewire-module-loopback
    args = {
        audio.position = [ FL FR ]
        capture.props = {
            media.class = "Audio/Sink"
            node.name = "application-loopback-1-sink"
            node.description = "Application-Loopback 1 Sink"
        }
        playback.props = {
            media.class = "Stream/Output/Audio"
            node.name = "application-loopback-1-playback"
            node.description = "Application-Loopback 1 Playback"
        }
    }
}]
```

The created device loopback is made up by two parts that can be found in different places inside a
mixer like [pavucontrol](#volume-control).
The part called `Application-Loopback 1 Sink` in the example config can be found in the `Output
Devices` tab.
The second part called `Application-Loopback 1 Playback` is available under the `Playback` tab and
allows to switch the selection of the output device.
Also in the `Playback` tab `Application-Loopback 1 Sink` can be selected as an output for currently
running applications which will loopback the sound to the selected output device.
