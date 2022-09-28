# CUPS

[CUPS](https://www.cups.org/) is a open source printing software developed for
unix and unix-like systems.

## Setup

The software can be setup via docker with the
[linuxserver image](./docker-images/linuxserver_-_airsonic.md).
Additionally to this a client is needed on the system that need access to the
server software.

### Client

To use CUPS an additional client software is needed.

For Linux computers follow these instructions:

- Install the CUPS-client package (in Arch Linux it is included in `cups`)
- Edit `/etc/cups/client.conf` and insert `ServerName <ip to print-server>:631`
- Restart the CUPS service: `systemctl restart cups`
- Test connectivity: `lpstat -r`
- Check the detected printers with: `lpstat -v`
