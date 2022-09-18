# Dolphin

[Dolphin](https://dolphin-emu.org/) is a GameCube and Wii
[emulator](./emulators.md).

## Setup

Dolphin can be installed on different systems, a list for this can be found on
the [Dolphin website](https://dolphin-emu.org/download/).
Additionally it can be installed using [Flatpak](../linux/flatpak.md) where the
package is called `org.DolphinEmu.dolphin-emu`.

## [Steam Deck](./steam.md#steam-deck) specific settings

The following settings are especially useful when emulating games on the
[Steam Deck](./steam.md#steam-deck) as pointed out by
[nchristopher](https://github.com/nchristopher/steamdeck-emulation/blob/main/emulators/dolphin.md).
But it is a good starting point for other systems aswell.
It is important to emphasize that the system needs to meet the requirements to
run Vulkan.
Select the configuration and select the paths tab.
There the directories for Wii and GameCube [ROMs](./emulators.md) can be added.
In the audio tab select `Pulse` as your audio backend.
In the interface tab select `Confirm to Stop` to avoid prompts when closing the
game.
Close the configuration and select the graphics menu.
Set the backend to Vulkan.
In the enhancements tab select `3x Native` as internal resolution, as it will
upscale the image to 1080p.
In the main tab check the `Render to Main Window` box.
Close the graphics menu and open the controllers menu.
For the first GameCube controller open the configuration, select
`SDL/0/Microsoft X-Box 360 Pad 0` as type and change the buttons to your
preference.
Select emulate Wii Bluetooth adapter for Wii controllers.
For the first Wii controller open the configuration, select
`SDL/0/Microsoft X-Box 360 Pad 0` as type and change the buttons to your
preference.

## Running a game without selection in the menu

To run a game instantly the path to the [ROM](./emulators.md) needs to be
appended to the command used for starting Dolphin.
This should be made in quotation marks as it could contain characters that need
to be escaped.
