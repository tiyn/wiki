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
- [Prism Launcher](./multimc5.md) is another custom Minecraft launcher that is very similar to
  MultiMC5.
  Settings and usage should be similar for the most part.

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
