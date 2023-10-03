# Teamspeak3

[Teamspeak3](https://www.teamspeak.com) is a voice-over-IP service.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[teamspeak image](./docker/teamspeak.md).

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
foler of teamspeak.
For [Linux](/wiki/linux.md) systems this folder can be found at `/opt/teamspeak3/sound`.
Following this the sound pack is available after the next (re-)start of teamspeak.
