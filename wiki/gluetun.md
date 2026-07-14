# Gluetun

[Gluetun](https://github.com/qdm12/gluetun) is a free and open-source Docker-based VPN client.
It supports multiple VPN providers and protocols including [WireGuard](/wiki/wireguard.md) and
[OpenVPN](/wiki/openvpn.md).

## Setup

Gluetun can be set up via [Docker](/wiki/docker.md) with the
[qmcgaw image](/wiki/docker/qmcgaw_-_gluetun.md).

## Usage

This section addresses the usage of Gluetun.

### Routing Traffic of Firefox' Containers

Gluetun routes the network traffic of Docker containers through a VPN tunnel.
It can be used as a gateway for other containers or in combination with [Firefox'](/wiki/firefox.md)
Multi-Account Containers to access selected websites through a VPN without routing all system
traffic through the tunnel.
