# Transmission

[Transmission](https://transmissionbt.com/) is a free and cross-platform
BitTorrent client.

## Setup

The software can be setup via docker with the
[haugene image](./docker-images/haugene_-_transmission-openvpn.md) that
includes an openvpn tunnel.

## Leeching/Seeding

Leeching is the process of only downloading a file, Seeding describes the
download followed by alsow uploading it.
When the downloaded torrent should not be seeded the best way is enabling and
setting `Stop seeding at ratio:` to `0` under `Torrents` in the settings.
This will stop the process of seeding once a package is downloaded allowing
other torrents to start downloading.

## Legal Situation

This is not a legal advice.
Take your local laws into account when downloading torrents.
Some torrents can be copyright infringing and therefor illegal to download.
Use Transmission only to download legal and safe torrents like the [Arch Linux ISO](/wiki/linux/arch-linux/arch-linux.md#iso-medium).
Seeding it can help the community.
