# Jellyfin

[Jellyfin](https://jellyfin.ord) is a suite for multimedia streaming.
It includes a web-interface and is mainly used for
[movies and tv shows](./movies_&_tv_shows.md).

## Setup

The software can be setup via docker with the
[linuxserver image](./docker-images/linuxserver_-_jellyfin.md).

## Usage

This section addresses various features of invidious.

### Live TV and DVR

Jellyfin can connect to live TV with different tuners to display and record TV
channels - so called DVR - directly via jellyfin.

#### Live TV with M3U Tuner

You can add IP-TV under `Live TV` in the administration panel.
To include a M3U IP-TV stream just put the file on the server or copy its URL
and add it under `Live TV`.
After that make sure to setup `DVR` to your liking to record.

#### Live TV and DVR with TVHeadend

This section explains the steps neccessary to make [TVHeadend](./tvheadend.md)
work with a jellyfin server according to the
[official documentation](https://jellyfin.org/docs/general/server/plugins/tvheadend/).
It is assumed a working TVHeadend instance is up and running.
In the [TVHeadend entry](./tvheadend.md) a guide to run an instance is given.
In the admin dashboard install the
[TVHeadend plugin](https://jellyfin.org/docs/general/server/plugins/tvheadend/)
and restart the server.
Afterwards create a user with a username in TVHeadend under
`Go to Configuration > Users > Access Entries > Add`.
Check the `Change Parameters`
`Rights`, `Channel number range`, `Channel tags`, `DVR configurations`,
`Streaming profiles` and `Connection limits`.
Check the `Streaming Profiles` `htsp`, `matroska`, `pass`,
`webtv-h264-aac-matroska`, `webtv-h264-aac-mpegts`, `webtv-h264-vorbis-mp4` and
`webtv-vp8-vorbis-webm`.
Check `Enabled` and `Web Interface`.
Select `Basic`, `Advanced` and `HTSP` under `Streaming` and `Basic`, `HTSP` and
`View all` under `Video recorder`.
Save the user.
Create a password via `Configuration > Users > Passwords > Add`.
Check `Enabled`, select the according `Username` and fill in the `Password`.
Afterwards save.

Now in Jellyfin under `Go to Dashboard > Plugins > TVHeadend > Settings` set
the `TVHeadend Hostname or IP Address`, the `HTTP Port` and `HTSP Port`, the
`Username` and the `Password` set in the previous step.

Finally run `Refresh Guide Data` under `Dashboard > Live TV > Live TV` to load
the guide data for the next 7 days aswell as to refresh the TV channels.
Afterwards the channels [mapped in TVHeadend](./tvheadend.md#adding-channels)
should appear in the `Live TV` Library.
