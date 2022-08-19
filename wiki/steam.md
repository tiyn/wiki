# Steam

[Steam](https://store.steampowered.com/) is a software for digital game
destribution.

## Proton

### Errors with the Wine prefix of a specific game

The last ressort for fixing problems that are related to the wine prefix of a
game is to delete the Wine prefix.
For this the id of the steam game first has to be known.
This is done by navigating to the steam website or the community page of the
specific game.
The URLs will have one of the following forms where the game id can be read:

```
http://steamcommunity.com/app/<game id>/
http://store.steampowered.com/app/<game id>/
```

After that navigate to the place your steam games are stored.
You can remove `<steam location>/steamapps/compatdata/<game id>` to reset the
Wine prefix completely.
It is recommended to keep a backup of the folder containing the old Wine prefix
as it stores game saves and other important data, that can be useful.
