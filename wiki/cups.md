# Cups

## Server

A server can be setup via docker with the [linuxserver image](./docker-images/linuxserver_-_airsonic.md).

## Client

For Linux computers follow these instructions:

- Install the cups-client package (in Arch Linux it is included in `cups`)
- Edit `/etc/cups/client.conf` and insert `ServerName <ip to print-server>:631`
- Restart the cups service: `systemctl restart cups`
- Test connectivity: `lpstat -r`
- Check the detected printers with: `lpstat -v`
