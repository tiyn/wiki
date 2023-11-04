# Steam Deck

The [Steam Deck](https://store.steampowered.com/steamdeck) is a handheld [gaming](/wiki/games.md)
computer made by the same developers as [Steam](./steam.md),
[Valve](https://www.valvesoftware.com).
Due to its form factor it can be used especially well to play games that need a
controller, such as many games that run on [emulators](./emulators.md).
But by adding a USB-hub and connecting keyboard and mouse it can be used to
play classical PC games aswell.
As the Steam Deck is using a linux based operating system all the windows based
games are run with the help of [Proton](./proton.md).
The Steam Deck includes the Flatpak based [Discover](../linux/flatpak.md)
software management suite to install additional software.

## Usage

### Shortcuts

- Esc: `STEAM + D-Pad Left`
- Show Keyboard: `STEAM + X`

### Running a Game Directly Through the Interface

Simple programs can be started from inside the gaming mode by adding it as a
[non-Steam game](/wiki/games/steam.md#adding-non-steam-games).

For [emulator games](/wiki/games/emulators.md) the setup is more complex.
Firstly the emulator needs to be added as a
[non-Steam game](/wiki/games/steam.md#adding-non-steam-games).
To run a game instantly the path to the [ROM](./emulators.md) needs to be
appended to the command used for starting the emulator needed for it.
This should be made in quotation marks as it could contain characters that need
to be escaped.

Afterwards the icons and banners of it can be set using
[SteamGridDB](/wiki/games/steam.md#setting-icons-and-banners-for-games).

### Plugin Manager Decky

The Steam Deck features a wide variable of customization options.
Some of these options can be accessed by installing
[the plugin manager Decky](https://github.com/SteamDeckHomebrew/decky-loader).
To install it download the setup file from the
[Github page](https://github.com/SteamDeckHomebrew/decky-loader) and run it.
Afterwards the plugin manager will be available after pressing the `...` button on the Deck and
navigating to the bottom of the menu.
There plugins can be installed and removed aswell as managed.

The following list includes some useful plugins.

- [SteamGridDB](/wiki/games/steam.md#setting-icons-and-banners-for-games) can be used for setting
  new and better [images](/wiki/images.md) for games.
