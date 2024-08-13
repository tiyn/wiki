# CUPS

[CUPS](https://www.cups.org/) is a open source printing software developed for
unix and unix-like systems.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[linuxserver image](./docker/linuxserver_-_airsonic.md).
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

## Usage

This section addresses the usage of the CUPS.

### Adding a Printer

A printer can be added using the webinterface.
The webinterface is normally reachable on port 631.
This process is guided and should be self-explanatory.
However in some cases additional drivers have to be installed.
For example Brother label printers of the ptouch series feature drivers that are available for most
[Linux](/wiki/linux.md) distributions in a package named `printer-driver-ptouch`.
When adding the printer a network address has to be given.
For USB printers this can be done via the USB protocol.
Continuing the example Brother label Printer QL-600 the connection `usb://Brother/QL-600` is
sufficient.
When using multiple printers the serial number can be given in addition to this.
This is done by appending it the the mentioned connection string and will look like
`usb://Brother/QL-600?serial=000J1Z140282`.
The examples using the Brother printer are taken from a
[dwaves article](https://dwaves.de/2022/07/13/gnu-linux-debian-11-how-to-setup-brother-ql-600-labelprinter/).
