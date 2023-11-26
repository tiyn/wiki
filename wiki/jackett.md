# Jackett

[Jackett](https://github.com/Jackett/Jackett) is an application that is
intended to manage multiple [BitTorrent](/wiki/bittorrent.md) indexers.
One of its main usecases is in feeding indexers to the
[\*ARR applications](/wiki/*arr.md).

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[DyonR image](/wiki/docker/dyonr_-_jackettvpn.md) which also features a
VPN tunnel.

## Usage

### Adding an Indexer

Indexers can be added by simply clicking `Add indexer` in the main menu.
For private or semi-private trackers login information or a cookie is needed.

### Adding a Jackett Indexer to \*ARR applications

For adding a Jackett Indexer to an \*ARR application press `Copy Torznab Feed`
of the Jackett indexer you want to add.
Paste this in the \*ARR application under
`Settings`, `Indexers`, `Add`, `Torznab` and `Custom` in the `URL` field.
Also copy and paste the Jackett API key into the corresponding field in the
\*ARR application.
Afterwards check and configure the correct category IDs via the `Categories`
option.
The list of supported categories can be found in the Jackett indexer
configuration (the wrench in the corresponding index list entry).
