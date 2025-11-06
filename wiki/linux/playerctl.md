# PlayerCTL

[PlayerCTL](https://github.com/altdesktop/playerctl) is a MPRIS (Media Player
Remote Interfacing Specification) [media player](/wiki/audio.md#media-software)
command-line controller for Spotify, [Sonixd](/wiki/subsonic.md#client), MPV and
many other different media clients aswell as [browser](/wiki/browser.md).

## Setup

On most linux distributions PlayerCTL can be installed with the `playerctl`
package.
Alternatively it can be installed via
[GitHub](https://github.com/altdesktop/playerctl).

## Usage

## Basic Commands

For starting, stopping the music the commans are simple and very intuitive.
The following commands show how to control music.
The commands are quite self-explaining.

```sh
playerctl play
playerctl pause
playerctl play-pause
playerctl stop
playerctl next
playerctl previous
```

## Using Hotkeys

Hotkeys can be more accessible than typing the commands to start or stop music
in the [terminal](/wiki/linux/system_console.md).
With [SXHKD](/wiki/linux/sxhkd.md#setting-a-hotkey) commands from the CLI can
be set to a hotkey.
