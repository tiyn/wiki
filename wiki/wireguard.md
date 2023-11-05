# WireGuard

[WireGuard](https://www.wireguard.com/) is a free and open-source software that
implements encrypted VPNs.
It was designed to be especially fast and secure.
This section including its subsections - especially the [usage](#usage-wg) is
based on an extensive guide on WireGuard by
[DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-20-04#step-9-connecting-the-wireguard-peer-to-the-tunnel).

## Setup

In the following sections the different set ups of WireGuard usages are described.

### Server

The software can be set up via [Docker](/wiki/docker.md) with the
[linuxserver image](/wiki/docker/linuxserver_-_wireguard.md).
Additionally to this a [client](#client-wg) is needed on the system that
accesses the server.

### Client

WireGuard clients can be found for many devices.
For [Android](/wiki/android.md) for example there is
[Wireguard for Android in the F-Droid store](https://f-droid.org/de/packages/com.wireguard.android/).
For most linux distributions there is a package called `wireguard-tools`.

## Usage

Wireguard clients connect to servers by using a `.conf` file.
For mobile devices often times a QR-code can also be used.

In Linux based operating systems the `.conf` can be placed at
the path `/etc/wireguard/wg0.conf`.
Afterwards wireguard can be started and stopped by running the following
commands.

```
wg-quick up wg0
wg-quick down wg0
```

When using multiple `.conf` files the number behind `wg` can be incremented.
When starting and stopping wireguard with `wg-quick` the corresponding number
should be used.
Alternatively also other names not including `wg` can be used.
The term `wg0` the incremented version of it has to be changed accordingly then.

### Setting Up Local DNS

This section focusses on the usage of a [local DNS](/wiki/dns.md) like
[bind9](/wiki/bind.md#configure-local-dns-server-with-forwarding).
This can be especially useful for using
[local domains](/wiki/bind.md#configure-local-domains).
The following guide is based on a comments by the Reddit users
[orthecreedence and rptb1](https://www.reddit.com/r/WireGuard/comments/cmhap6/use_both_wireguard_and_local_dns_servers/).

To set up the usage of a local DNS the WireGuard configuration file needs to be
changed.
The following lines have to be appended under the `[Interface]` section and the
DNS IP address (in this case `192.168.178.1`) has to be changed as needed.
`wg0` is the name of the configuration file (see [the usage section](#wg-usage))
for reference.

```txt
PostUp = resolvectl dns wg0 192.168.178.1
PostDown = resolvconf -d %i -f
```

The `PostUp` line sets up the DNS while the `PostDown` line shuts it down after
wireguard is closed.

## Troubleshooting

This section addresses various errors that can happen when using WireGuard.

### Unknown Device Type / Protocol Not Supported

Especially when running `wg-quick up wg0` this error can appear.
The most probable source of this error is that the version of the package
`linux` doesn't match with the version of the [wireguard package](#client-wg) or
the system has been updated and the system wasn't restarted causing the same
problem.
To fix this `linux` can be reinstalled but a full update of the system is
recommended.
Because it changes the kernel the system needs to be restarted afterwards.
