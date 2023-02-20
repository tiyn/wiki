# Transmission

[Transmission](https://transmissionbt.com/) is a free and cross-platform
[BitTorrent](/wiki/bittorrent.md) client.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[haugene image](./docker-images/haugene_-_transmission-openvpn.md) that
includes an openvpn tunnel.

## Limiting  Upload

When the downloaded torrent should not be seeded the best way is enabling and
setting `Stop seeding at ratio:` to `0` under `Torrents` in the settings.
This will stop the process of seeding once a package is downloaded allowing
other torrents to start downloading.

## Change Number of Concurrent Downloads and Uploads

The default number of concurrent downloads is set to 5.
To increase this number edit the file `~/.config/transmission/settings.json`
inside the system that runs Transmission and change change the following line to
the preferred number of downloads.
When running
[the haugene image](./docker-images/haugene_-_transmission-openvpn.md) the file
is located at `/config/transmission-home/settings.json`.

```txt
"download-queue-size": 5
```

The number of concurrent uploads is not limited.
Disabling the uploads of files can be done manually or by
[limiting the upload](#limiting-upload).
