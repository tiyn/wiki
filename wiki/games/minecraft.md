# Minecraft

[Minecraft](https://www.minecraft.net) is a sandbox video game created by "Notch".

## Server

A server can be setup via docker with the [linuxserver image](../docker-images/itzg_-_minecraft-server.md).

## Client

There are different Minecraft Clients available:

- The standard (Java) Minecraft Client can be downloaded at the [official website](https://minecraft.net/en-us/get-minecraft)
- [MultiMC5](./multimc5.md) is a custom Minecraft launcher that allows multiple
  installations at once.

## DNS

### Link Minecraft to a subdomain

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
