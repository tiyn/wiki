# Transmission

[Transmission](https://transmissionbt.com/) is a free and cross-platform
[BitTorrent](/wiki/bittorrent.md) client.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[haugene image](./docker-images/haugene_-_transmission-openvpn.md) that
includes an openvpn tunnel.

## Settings for Download and Upload

When the downloaded torrent should not be seeded the best way is enabling and
setting `Stop seeding at ratio:` to `0` under `Torrents` in the settings.
This will stop the process of seeding once a package is downloaded allowing
other torrents to start downloading.
