# Dolphin

[Dolphin](https://dolphin-emu.org/) is a [Nintendo GameCube and Wii](/wiki/game.md)
[emulator](/wiki/game/emulators.md).

## Setup

Dolphin can be installed on different systems, a list for this can be found on
the [Dolphin website](https://dolphin-emu.org/download/).
Additionally it can be installed using [Flatpak](/wiki/linux/flatpak.md) where the
package is called `org.DolphinEmu.dolphin-emu`.

## Usage

The following sections describe specific issues relating to the configuration
and usage of Dolphin.

### Steam Deck Specific Settings

The following settings are especially useful when emulating games on the
[Steam Deck](/wiki/game/steam_deck.md) as pointed out by
[nchristopher](https://github.com/nchristopher/steamdeck-emulation/blob/main/emulators/dolphin.md).

Select the configuration and select the paths tab.
There the directories for Wii and GameCube [ROMs](/wiki/game/emulators.md) can be added.
In the audio tab select `Pulse` as your audio backend.
In the interface tab select `Confirm to Stop` to avoid prompts when closing the
game.
Close the configuration and select the graphics menu.
Set the backend to Vulkan.
[Fullscreen Mode](#fullscreen-mode) can be enabled when starting the game too.
In the enhancements tab select `3x Native` as internal resolution, as it will
upscale the image to 1080p.
In the main tab check the `Render to Main Window` box.
Close the graphics menu and open the controllers menu.
For the first GameCube controller open the configuration, select
`SDL/0/Microsoft X-Box 360 Pad 0` as type, clear and change the buttons to your
preference.
Select emulate Wii Bluetooth adapter for Wii controllers, alternatively you can
leave it empty to use the GameCube controller settings.
For the first Wii controller open the configuration, select
`SDL/0/Microsoft X-Box 360 Pad 0` as type, clear and change the buttons to your
preference.

### Fullscreen Mode

Check the `Start in Fullscreen` box to start games automatically in fullscreen
mode.
To exit it use `Esc`.
