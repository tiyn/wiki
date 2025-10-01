# MultiMC5

[MultiMC5](https://multimc.org) is a custom launcher that allows multiple instances of the
[game](/wiki/game.md) [Minecraft](./minecraft.md) to be installed at once.
In recent times there have been problems with the maintainer of MultiMC5. 
Due to this similar launchers like the [Prism Launcher](https://prismlauncher.org/) have gotten
popular.
Since they don't differ greatly from MultiMC5s interface, this entry discusses them too.

## Usage

### Adding OptiFine to a Minecraft instance

[OptiFine](https://www.optifine.net/home) is a Minecraft optimization mod.
The following steps show how to add optifine to a MultiMC5 Minecraft instance.
It is based on a comment by
[FuchsFuchs1](https://gist.github.com/jspanos71/32dc422eb4435a8f8dd5604e7a77c327).
The setup uses the [Fabric Mod Loader](https://fabricmc.net/) together with
[OptiFabric](https://www.curseforge.com/minecraft/mc-mods/optifabric) to make
OptiFine available.

- If not already done create an instance on MultiMC5
- Select `Edit Instance`, navigate to `Version` and `Install Fabric`
- Download the version of
  [OptiFabric](https://www.curseforge.com/minecraft/mc-mods/optifabric/files)
  according to your Minecraft version
- Navigate to `Loader Mods` and press `Add`, then select the downloaded
  OptiFabric file
- Download the version of [OptiFine](https://optifine.net/downloads) according
  to your Minecraft version
- Navigate to `Loader Mods` and press `Add`, then select the downloaded
  OptiFine file

OptiFine works best on older [Minecraft](/wiki/game/minecraft.md) versions.
Some people recommend [Sodium](https://modrinth.com/mod/sodium/versions) or other optimization mods
to use on newer versions.

## Troubleshooting

This section addresses various errors that can happen when using MultiMC5 and its forks.

### Narrator not Available

Sometimes when running MultiMC5 on [Linux](/wiki/linux.md)-based operating systems an error occurs
in the logs saying `Error while loading the narrator`.
To fix this a package is needed called `flite` on most Linux-distributions.
This solution was provided on Github by
[Mephodio](https://github.com/PrismLauncher/PrismLauncher/issues/2683).
