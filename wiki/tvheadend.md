# TVHeadend

[TVHeadend](https://tvheadend.org/) is a server application that forwards video
streams to internet streams.
It supports multiple dvb tuners and tuner sticks aswell as Sat>IP tuners.
It also has the ability to record programs like a digital video recorder.
TVHeadend has an
[official documentation](https://docs.tvheadend.org/webui/config_dvr/) on its
website.
TVHeadend is compatible with [jellyfin](./jellyfin.md#connect-tvheadend) with
the help of a plugin.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[linuxserver image](./docker/linuxserver_-_tvheadend.md).
For different hardware there may be additional run options needed to get
TVHeadend working properly.
Additionally a solid [initial configuration](#initial-configuration) is
recommended.
This configuration includes the setup of different types of tuners.

### Fritzbox

Using a Fritzbox as the router the build in SAT>IP tuner can be used.
For this `--satip_xml http://192.168.178.1:49000/satipdesc.xml` needs to be
added as a run option with the [IP address](/wiki/ip_address.md) matching the one of your Fritzbox.

For multiple tuners to work the hosting system has to have multiple IP addresses
as only one address can be bound to one tuner at the time.
Setting up a linux system with additional IP addresses is described in
[the netplan entry](./linux/netplan.md#add-more-ip-addresses-to-a-system).

The still needed setup is equal to the [setup for DVB-C Tuners](#dvb-c).

### Initial configuration

This subsection is about the recommended configurations for a TVHeadend
instance.

One of the most important configurations is the naming scheme of the recorded
files.
To change this setting navigate to
`Configuration > Recording > Digital Video Recorder Profiles` and select your
current profile.
Under `Filesystem Settings` `Format string/Pathname specification` can be found.
In the according
[official documentation section](https://docs.tvheadend.org/webui/config_dvr/)
The default format string and possible variations are specified there.
The recommended Format string used by this guide is the following:
`$t/$t$_e_%F$n.$x`.
It will create a folder with the same name as the show for each show.
The containing files are named with the title, the possible episode aswell as
the date the show was recorded.
If two files feature the same name an ascending number is added.
This naming scheme is compatible with [Jellyfins](./jellyfin.md) `Other`
content type.

#### DVB-C

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
Then put in one of the [IP addresses](/wiki/ip_address.md) added to your system in the previous step
under `Tuner bind IP address`.
Then click `Save`.

After these steps a list of Muxes should appear in
`Configuration > DBV Inputs > Muxes` and some of them should turn to `OK` under
`Scan Result`.
Following this a list of TV and radio channels should appear in
`Configuration > DBV Inputs > Services`.
After this the setup is completed.

## Usage

This section addresses various features of TVHeadend.

### Mapping channels

Following the Setup you have a list of possible channels available at
`Configuration > DVB Inputs > Service`.
Select the channels that are to be streamed and/or recorded and press
`Map selected services`.
After that the channels are mapped navigate to
`Configuration > Channel/EPG > Channels` where a list of your selected channels
is displayed.
There you can select `Numbers` by invoking `Edit` on the Channels.
Under `Electronic Program Guide` a list of current and future programs is
shown.

### Scheduling a recording

To record a show navigate to `Electronic Program Guide` after
[adding the channel](#adding-channels) that is to be recorded.
In the program guide a list of all shows is given.
Left click on the show to record and select `Record` in the pop-up.
To record all shows of the same name select `Autorec`.
In `Digital Video Recorder` all `Upcoming/Current Recordings` can be seen and
deleted if neccessary.
In `Autorecs` the show names to record are listed.
