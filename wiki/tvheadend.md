# TVHeadend

[TVHeadend](https://tvheadend.org/) is a server application that forwards video
streams to internet streams.
It supports multiple dvb tuners and tuner sticks aswell as Sat>IP tuners.
It also has the ability to record programs like a digital video recorder.
TVHeadend is compatible with [jellyfin](./jellyfin.md#connect-tvheadend) with
the help of a plugin.

## Setup

The software can be setup via docker with the
[linuxserver image](./docker-images/linuxserver_-_tvheadend.md).

### Fritzbox

Using a Fritzbox as the router the build in SAT>IP tuner can be used.
For this `--satip_xml http://192.168.178.1:49000/satipdesc.xml` needs to be
added as a run option with the IP address matching the one of your Fritzbox.

For multiple tuners to work the hosting system has to have multiple IP addresses
as only one address can be bound to one tuner at the time.
Setting up a linux system with additional IP addresses is described in
[the netplan entry](./linux/netplan.md#add-more-ip-addresses-to-a-system).

The still needed setup is equal to the [setup for DVB-C Tuners](#dvb-c).

### DVB-C

In TVHeadend navigate to `Configuration > DBV Inputs > TV adapters`.
Create a Network, select `Enabled`, set your `Network name`, select one of the
`Pre-defined muxes` according to your location and internet provider.
Set `Network discovery` to `New muxes + changed muxes` and uncheck
`Skip startup scan`.
Then click `Save`.

In TVHeadend navigate to `Configuration > DBV Inputs > TV adapters`.
There are the tuners connected to your system.
Select them one-by-one, check `Enabled`, select your just set up network in
`Networks` aswell as `DVB-C` as the network type.
Set `Next tune delay in ms (0-2000)` to `200` and select `On` for
`Pass specinv`.
Then put in one of the IP addresses added to your system in the previous step
under `Tuner bind IP address`.
Then click `Save`.

After these steps a list of Muxes should appear in
`Configuration > DBV Inputs > Muxes` and some of them should turn to `OK` under
`Scan Result`.
Following this a list of TV and radio channels should appear in
`Configuration > DBV Inputs > Services`.
After this the setup is completed.
