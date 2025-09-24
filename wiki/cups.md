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

### Custom Formats For Brother Printers 

Especially when using continuos-length Brother label printers it can be useful to set up custom
formats.
After setting up the CUPS install the package that provides
`brpapertoollpr_<printer name in cups>` which differs from printer to printer.
For example when using a Brother QL-600 this command is named `brpapertoollpr_ql600` and on some
[Linux](/wiki/linux.md) distributions like [Arch Linux](/wiki/linux/arch-linux.md) is provided in a
package called `brother-ql600`.

To then set up a new custom format run the following command.

```sh 
brpapertoollpr_<printer name in command> -P <printer name in cups> -n <format name> -w <width> -h <height>
```

`<printer name in command>` is the part of the command that corresponds to the printer as described
in the previous sentence.
`<printer name in cups>` and `<format name>` are the name of the printer already set up and given in
CUPS and the name chosen for the new format.
And `<width>` and `<height>` are width and height of the new format both given in millimeters.
A complete command could look something like the following. 


```sh 
brpapertoollpr_ql600 -P Brother_QL-600 -n "62mmx12mm" -w 62 -h 12
```

The command to delete a custom format is the following.
It uses the same variables and names as the command above.

```sh 
brpapertoollpr_ql600 -P <printer name> -d <format name>
```

The usage of this command could look similar to the following example.

```sh 
brpapertoollpr_ql600 -P Brother_QL-600 -d "62mmx12mm"
```

After setting up the new format it can be selected in the CUPS interface and used with the Brother
printer it was set up for.
