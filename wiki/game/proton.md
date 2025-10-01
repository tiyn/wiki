# Proton

[Proton](https://github.com/ValveSoftware/Proton) is a compatibility tool for
[games](/wiki/game.md) made by the developers of [Steam](./steam.md),
[Valve](https://www.valvesoftware.com).
It is based on [WINE](../linux/wine.md).

## GE-Version

[Proton GE](https://github.com/GloriousEggroll/proton-ge-custom) is a community
built version of Proton.
GE stands for Glorious Eggroll, the lead developer of Proton GE.
It often contains fixes for bugs which are not yet included in the official
Proton releases.
Thus some games, that do not work with Proton, can be run with Proton GE.

## Setup

Proton and [Proton GE](#ge-version) can be installed on Linux systems by using
the [ProtonUp](https://github.com/AUNaseef/protonup) application which in turn
can be installed through [Flatpak](../linux/flatpak.md) or the package manager
of the distribution.
ProtonUp is usually bundled in a package named `protonup-qt`.
It can be used to install Proton GE versions for both
[Steam](/wiki/game/steam.md) and [Lutris](/wiki/game/lutris.md).

## Troubleshooting

This section addresses various errors that can happen when using Proton.

### Errors with the Wine prefix of a specific game

The last ressort for fixing problems that are related to the wine prefix of a
game is to delete the Wine prefix.
For this the id of the Steam game first has to be known.
This is done by navigating to the Steam website or the community page of the
specific game.
The URLs will have one of the following forms where the game id can be read:

```
http://steamcommunity.com/app/<game id>/
http://store.steampowered.com/app/<game id>/
```

After that navigate to the place your Steam games are stored.
You can remove `<steam location>/steamapps/compatdata/<game id>` to reset the
Wine prefix completely.
It is recommended to keep a backup of the folder containing the old Wine prefix
as it stores game saves and other important data, that can be useful.
