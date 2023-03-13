# Lutris

[Lutris](https://lutris.net/) is a free and open source video game platform for
[Linux](/wiki/linux/linux.md) systems.
It features compatibility with [GOG](https://www.gog.com/),
[Humble Bundle](https://humblebundle.com/),
[Epic Games](https://www.epicgames.com/), [Steam](/wiki/games/steam.md) and many
other Windows games via its own installer that uses [WINE](/wiki/linux/wine.md).
Additionally to that Lutris supports many different
[emulators](/wiki/games/emulators.md).

## Usage

### Manually add a game

By clicking on the `+` in the left upper corner of the Lutris application a new
game can be manually added.
For `.iso` files select `Install a Windows game from media`.
For `.exe` files select `Add locally installed game`.
Make sure to select the correct runner for the game in the following window.
For Windows games using [WINE](/wiki/linux/wine.md) make sure to set the
`Wine prefix` to the desired location.
For cleanup afterwards the game can be moved into the WINE prefix folder as if
it was installed inside Windows.

### Installing Windows DLLs

Select the game in the `Games` tab of the library.
Then select the upwards arrow next to the [WINE](/wiki/linux/wine.md) symbol in
the bar at the lower screen.
Select `Winetricks` and `Select the default wineprefix` in the window
afterwards.
After selecting `Install a Windows DLL or component` the package to install can
be selected.

### DX12/DX13 is not supported on your system

This section handles a fix if the game is not able to run due to the system not
supporting DX12 or DX13.
This can be easily fixed by inserting `-dx11` in `Arguments` under the
`Game options` tab that pops up after selecting `Configure` for a selected game.
