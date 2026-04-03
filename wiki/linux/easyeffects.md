# EasyEffects

[EasyEffects](https://github.com/wwmm/easyeffects) is a free and open-source GUI-software for
applying sound effects and filters on input and output audio streams.
EasyEffects uses [Pipewire](/wiki/linux/pipewire.md) as
[sound server](/wiki/linux/audio.md#sound-server).

## Setup

EasyEffects can be installed on most distributions by installing the `easyeffects` package.
An installation via [Flatpak](/wiki/linux/flatpak.md) is also possible.

## Usage

EasyEffects can apply `Effects` to input and output sound.

### Autostart

EasyEffects can be started in various ways.

The service can be started including the window with the following.
It will have to be called each startup.

```sh
easyeffects
```

Alternatively it can be started in the background with the following command.
This command also has to be called each time the system starts.

```sh
easyeffects --gapplication-service
```

The two former commands will only work if called on each startup.
The easiest way to do this is by using [SystemD](/wiki/linux/systemd.md).
The following will work analogously to the path explained in
[the corresponding section of the SystemD entry](/wiki/linux/systemd.md#run-command-on-boot).

Run the following command to edit the configuration file for the newly created EasyEffect service.

```sh
systemctl --user edit --force -full easyeffects.service
```

Afterward set the contents of this file to the following.
Due to EasyEffect working together with [Pipewire and Wireplumber](/wiki/linux/pipewire.md) some
precautions have to be taken to start it before these two.

```sh
[Unit]
Description=EasyEffects (GApplication Service)
After=pipewire.service wireplumber.service
PartOf=graphical-session.target

[Service]
ExecStart=/usr/bin/easyeffects --gapplication-service
Restart=on-failure

[Install]
WantedBy=graphical-session.target
```

### Noise cancellation

Noise cancellation can be achieved by installing EasyEffects.
Make sure to check the box `Process all Inputs` and `Process all Outputs` to route everything
through `easyeffects`.
Make log out of your system afterward.
To enable noise cancellation navigate `Inputs` and click `Plugins`.
After that click `Add Plugin` and select `Noise Reduction`.

An alternative way to achieve noise cancellation is using the the `Deep Noise Remover` plugin.
There is a
[guide by Adam Gradzki](https://adamgradzki.com/adding-deepfilternet-noise-reduction-to-easy-effects-on-arch-linux.html)
which describes the setup.

### Presets

Presets can be created by selecting `Presets`, setting the name and clicking the `+` to save it.
It is then displayed in the list below from where it can be loaded or deleted.
Presets are saved in the directory `~/.config/easyeffects/input` and
`~/.config/easyeffects/output`.

### Process All Input and Output Streams

By default, EasyEffects processes all input and output streams.
This includes [loopback devices](/wiki/linux/pipewire.md#virtual-devices) with which it may lead to
some problems - for example
[problems with virtual devices](/wiki/linux/pipewire.md#problems-with-input-an-output-of-loopback-devices).
It can be disabled and re-enabled in the `Preferences` under `Audio` by deselecting or selecting the
switches for `Process all output streams` and `Process all input streams`.

#### Recommended Presets

The following is a list of presets that have been tested and only need slight configuration to
adjust them to the specific system.

- [tiyns voice input preset](https://github.com/tiyn/dotfiles/blob/master/.config/easyeffects/input/voice.json)
  is a list of different effects to achieve an enhanced quality of microphone sound for speach.
