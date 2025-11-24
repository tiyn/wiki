# TeamSpeak

[TeamSpeak](https://www.teamspeak.com) is a voice-over-IP service.
There are 2 versions currently maintained.
TeamSpeak3 is the older version.
Teampeak5 or just short TeamSpeak is the newer version that is not completely released yet.
TeamSpeak3 servers are also used by TeamSpeak5.

## Setup

TeamSpeak consists of two parts: [a client](#client) and [a server](#server).

### Client

TeamSpeak3 is available for [Windows](/wiki/windows.md) on the
[TeamSpeak website](https://www.teamspeak.de/download/).
On most [Linux](/wiki/linux.md) distributions it can be installed with the `teamspeak3` package.
TeamSpeak5 is available for Windows on the
[TeamSpeak website](https://teamspeak.com/de/downloads/#ts5).
On most Linux distributions it can be installed with the `teamspeak` package.

### Server

The server software can be setup via [Docker](/wiki/docker.md) with the
[teamspeak image](./docker/teamspeak.md).
This image can setup a TeamSpeak3 server.

#### Link TeamSpeak3 to a subdomain

To link TeamSpeak3 to one of your subdomains you need to add a
[DNS SRV-record](./dns.md#srv-record):

```txt
type: SRV
name: ts3 (or alternative subdomain)
service: _ts3
proto: UDP
TTL: <configure to your liking>
class: IN
priority: 0
weight: 5
port: 9987 (or your teamspeak3 port)
target: ts3.<domain>.<TLD>
```

## Usage

This section addresses various features of TeamSpeak.

### Installing a Sound Pack

Sound packs can be found on the
[myTeamSpeak website](https://www.myteamspeak.com/?search=&type=SOUNDPACK).
They are often available as a `.ts3_soundpack` file.
This file is similar to a `.zip` archive and can be unpacked the same way.
Afterwards the folder containing the audio files (`.wav` files) needs to be inserted into the sound
folder of TeamSpeak.
For TeamSpeak3 on [Linux](/wiki/linux.md) systems this folder can be found at
`/opt/teamspeak3/sound`.
For TeamSpeak5 on Linux the folder is available at `/opt/teamspeak/html/client_ui/sound`.
Following this the sound pack is available after the next (re-)start of TeamSpeak.

### Setting Up a Music Bot

For TeamSpeak there are various bots capable of playing music.
The following is a list of bots featured in this wiki that can do this.

- [Sinusbot](/wiki/sinusbot.md) is a self-hosted bot for TeamSpeak that can play music and sounds. 
  It's closed-source and free of charge.
  It also features [Discord](/wiki/discord.md) support.

### Channel Visibility

As explained by
[guisinho_DBR on the TeamSpeak forums](https://community.teamspeak.com/t/room-that-nobody-can-see-only-some-people-with-powers/20471)
there is no way to hide a channel completely from view.
It is however possible to set the subscription and description view power of a channel to a high
value.
This will permit only users with higher powers to see who is connected to the channel and view the
description of a channel.
