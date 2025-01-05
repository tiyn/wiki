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
[mod section of that entry](/wiki/docker/itzg_-_minecraft-server.md#installation-of-mods).

#### Installing Datapacks

The installation of datapacks is to be done for a specific world or a specific server.
This section will describe a process that works for both single-player worlds aswell as multiplayer
servers.
First navigate to minecrafts folder that corresponds to the world you want to add the datapack to.
Then place the `.zip` archive containing the datapack inside the `datapacks` folder.
The resulting path is either `world/datapacks` for multiplayer servers like 
[itzgs minecraft server](/wiki/docker/itzg_-_minecraft-server.md) or `saves/<world name>/datapacks`
where `<world name>` is the name of the single player world.
