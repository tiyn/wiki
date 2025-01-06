# Minecraft

[Minecraft](https://www.minecraft.net) is a sandbox [video game](/wiki/games.md) created by "Notch".

## Setup

The following sections address the setup of both server and client software.

### Server

A server can be setup via docker with the
[itzg image](../docker/itzg_-_minecraft-server.md).

### Client

There are different Minecraft Clients available:

- The standard (Java) Minecraft Client can be downloaded at the [official website](https://minecraft.net/en-us/get-minecraft)
- [MultiMC5](./multimc5.md) is a custom Minecraft launcher that allows multiple
  installations at once.
  This entry also addresses forks of MultiMC5 like Prism Launcher that are similar in usage and
  settings for the most part.

### Usage

#### Link Minecraft to a Subdomain

To link Minecraft to one of your subdomains you need to add a [DNS](../dns.md)
SRV-record:

```txt
type: SRV
name: mine (or alternative subdomain)
service: _minecraft
proto: TCP
TTL: <configure to your liking>
class: IN
priority: 0
weight: 4
port: 25565 (or your minecraft port)
target: mine.<domain>.<TLD>
```

#### Adding Death Count to the Scoreboard

Run the following commands inside the console of minecraft to add death count as a objective in the
scoreboard.

```txt
/scoreboard objectives add Deaths deathCount
/scoreboard objectives setdisplay list Deaths
```

#### Updating a Server World to a New Version

An existing Minecraft world of a server can be updated simply by updating the server itself.
Chunks that have been loaded will not be affected by the update, but blocks that have not been
loaded will be.
For safety reasons it is advised to back up the instance before updating the version number.

#### Installing Mods

Mods can be installed client- and server-side.
For client-side mods most [up-to-date clients](#client) feature an easy installation process.
Especially [MultiMC5 and its derivatives](/wiki/games/multimc5.md) have an easy way to achieve
this.
For the installation of server-side mods the process can vary slightly depending on the
[server host](#server).
For the [itzgs minecraft server](/wiki/docker/itzg_-_minecraft-server.md) running on
[Docker](/wiki/docker.md) visit the
[mod section of that entry](/wiki/docker/itzg_-_minecraft-server.md#installing-mods).

#### Installing Datapacks

The installation of datapacks is to be done for a specific world or a specific server.
This section will describe a process that works for both single-player worlds aswell as multiplayer
servers.
First the installation of datapacks on single player worlds will the addressed.
Navigate to minecrafts folder that corresponds to the world you want to add the datapack to.
Then place the `.zip` archive containing the datapack inside the `datapacks` folder.
The resulting path is `saves/<world name>/datapacks` where `<world name>` is the name of the single
player world.
For the installation of datapacks on servers please navigate to the entry of the server since there
can be differences.
Most notably itzgs minecraft server is mentioned here which features a
[section regarding datapacks](/wiki/docker/itzg_-_minecraft-server.md#installing-datapacks).

#### Recommended Mods and Ressource Packs

This section addresses modifications and ressource packs that are recommended or were tested and
found to be useful or good.
This section will be split into two categories.
First the performance mods and secondly the gameplay mods.
At last there will be a list of useful ressources to find or browse mods and data packages.
The installation of [mods](#installing-mods) and [datapacks](#installing-datapacks) is addressed
in the corresponding sections.

The first category that will be discussed are used to improve the performance.
The following changes are recommended to install on the server.

- "Concurrent Chunk Management Engine" is a mod that introduces a concurrently working chunk
  management engine.
- "Clumps" is a mod that groups together experience orbs that are close to another.
- "Get It Together, Drops!" is a mod that groups together items that are close to another.
- "FerriteCore" is a mod that reduces memory usage.
- "Krypton" is a mod that optimizes minecrafts networking stack.
- "Let Me Despawn" is a mod that enables mods with a picked up or equipped item to despawn to
  reduce entity lag.
- "Lithium" is a mod that introduces various general optimizations.
- "ModernFix" is a mod that introduces more general optimizations.
- "Noisium" is a mod that speeds up the world generation function.

The following modifications are recommended client-side performance mods.

- "Concurrent Chunk Management Engine" is a mod that introduces a concurrently working chunk 
  management engine.
- "Dynamic FPS" is a mod that reduces the FPS when the program is running in the background. 
- "EntityCulling" is a mod that disables the rendering of hidden entities.
- "FerriteCore" is a mod that reduces memory usage.
- "ImmediatelyFast" is a mod that optimizes rendering.
- "Lithium" is a mod that introduces various general optimizations.
- "Sodium" is a mod that optimizes the rendering engine. This is a common and with newer versions more popular
  alternative to OptiFine.
- "Sodium Extra" is a mod that introduces an extension to Sodiums optimizations.
- "Reese's Sodium Options" is a mod that displays improved options for Sodium.

After the performance mods have been listed the next mods that will be discussed are focussed on
gameplay.
The following changes are recommended to install on the server.

- "Anti Enderman Grief" is a datapack that stops the endermen from picking up and setting down any
  blocks.

Finally the following ressources are useful to browse for new mods to install.

- [The UsefulMods list](https://github.com/TheUsefulLists/UsefulMods/blob/main/Performance/Performance121.md)
  is a list of useful performance mods for the 1.21.x.
  Newer and older versions could be found in the file browser on the left side of the website.
- [Vanilla Tweaks](https://vanillatweaks.net/) is a website that provides various ressource packs
  to improve the quality of life in minecraft.
  Goal of these is a slight change of the vanilla experience.
