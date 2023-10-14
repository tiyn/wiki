# MultiMC5

[MultiMC5](https://multimc.org) is a custom launcher that allows multiple instances of the
[game](/wiki/games.md) [Minecraft](./minecraft.md) to be installed at once.

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
