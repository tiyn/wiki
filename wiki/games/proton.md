# Proton

[Proton](https://github.com/ValveSoftware/Proton) is a compatibility tool for
[Steam](./steam.md) by its developers, [valve](https://www.valvesoftware.com),
based on [Wine](../linux/wine.md).

## GE-Version

[Proton GE](https://github.com/GloriousEggroll/proton-ge-custom) is a community
built version of Proton.
It often contains fixes for bugs which are not yet included in the official
Proton releases.

Proton GE can be installed on Linux systems by installing the `ProtonUp-Qt`
application using [Flatpak](../linux/flatpak.md).

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

