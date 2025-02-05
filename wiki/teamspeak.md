# Teamspeak

[Teamspeak](https://www.teamspeak.com) is a voice-over-IP service.
There are 2 versions currently maintained.
Teamspeak3 is the older version.
Teampeak5 or just short Teamspeak is the newer version that is not completely released yet.
Teamspeak3 servers are also used by Teamspeak5.

## Setup

Teamspeak consists of two parts: [a client](#client) and [a server](#server).

### Client

Teamspeak3 is available for [Windows](/wiki/windows.md) on the
[Teamspeak website](https://www.teamspeak.de/download/).
On most [Linux](/wiki/linux.md) distributions it can be installed with the `teamspeak3` package.
Teamspeak5 is available for Windows on the
[Teamspeak website](https://teamspeak.com/de/downloads/#ts5).
On most Linux distributions it can be installed with the `teamspeak` package.

### Server

The server software can be setup via [Docker](/wiki/docker.md) with the
[teamspeak image](./docker/teamspeak.md).
This image can setup a Teamspeak3 server.

## Usage

This section addresses various features of Teamspeak3.

### Link Teamspeak3 to a subdomain

To link Teamspeak3 to one of your subdomains you need to add a
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

### Installing a Sound Pack

Sound packs can be found on the
[myTeamspeak website](https://www.myteamspeak.com/?search=&type=SOUNDPACK).
They are often available as a `.ts3_soundpack` file.
This file is similar to a `.zip` archive and can be unpacked the same way.
Afterwards the folder containing the audio files (`.wav` files) needs to be inserted into the sound
folder of teamspeak.
For Teamspeak3 on [Linux](/wiki/linux.md) systems this folder can be found at
`/opt/teamspeak3/sound`.
For Teamspeak5 on Linux the folder is available at `/opt/teamspeak/html/client_ui/sound`.
Following this the sound pack is available after the next (re-)start of teamspeak.

### Setting Up a Music Bot

For Teamspeak there are various bots capable of playing music.
The following is a list of bots featured in this wiki that can do this.

- [Sinusbot](/wiki/sinusbot.md) is a self-hosted bot for Teamspeak that can play music and sounds. 
  It's closed-source and free of charge.
  It also features [Discord](/wiki/discord.md) support.
