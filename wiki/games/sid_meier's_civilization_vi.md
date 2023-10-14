# Sid Meier's Civilization VI

[Sid Meier's Civilization VI](https://civilization.com/de-DE/) is a round-based
strategy [game](/wiki/games.md) which is available as a standalone Launcher for Windows and on
[Steam](./steam.md) and many other video game distribution services.

## Troubleshooting

### Problems launching with [Proton](./steam.md)

Due to the standalone launcher of Civilization VI being used in the startup
process of steam, it can be useful to skip the launcher by
setting the following line as launch options in the general tab of
steams game related settings:

```sh
eval $( echo "%command%" | sed "s/2KLauncher\/LauncherPatcher.exe'.*/Base\/Binaries\/Win64Steam\/CivilizationVI'/" )
```
