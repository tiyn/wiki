# Jellyfin

[Jellyfin](https://jellyfin.ord) is a suite for multimedia streaming.
It includes a web-interface and is mainly used for
[movies and tv shows](./movies_&_tv_shows.md).

## Setup

The software can be setup via docker with the
[linuxserver image](./docker-images/linuxserver_-_jellyfin.md).

## Add IP-TV

You can add IP-TV under `Live TV` in the administration panel.
To include a m3u IP-TV stream just put the file on the server or copy its URL
and add it under `Live TV`.
After that make sure to setup `DVR` to your liking to record.

## Connect TVHeadend

This section explains the steps neccessary to make [TVHeadend](./tvheadend.md)
work with a jellyfin server according to the
[official documentation](https://jellyfin.org/docs/general/server/plugins/tvheadend/).
In the admin dashboard install the
[TVHeadend plugin](https://jellyfin.org/docs/general/server/plugins/tvheadend/)
and restart the server.
Afterwards create a user with a username in TVHeadend under
`Go to Configuration > Users > Access Entries > Add`.
Check the parameters
`Rights`, `Channel number range`, `Channel tags`, `DVR configurations`,
`Streaming profiles` and `Connection limits`.
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
