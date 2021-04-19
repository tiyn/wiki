# Jellyfin

[Jellyfin](https://jellyfin.ord) is a suite for multimedia streaming.
It includes a web-interface.

## Server

A server can be setup via docker with the [linuxserver image](./docker-images/linuxserver_-_jellyfin.md).

## Add IP-TV

You can add IP-TV under `Live TV` in the administration panel.
To include a m3u IP-TV stream just put the file on the server or copy its URL
and add it under `Live TV`.
After that make sure to setup `DVR` to your liking to record.

## Handling of movies consisting of multiple files

Jellyfin does not have the capability to seamlessly transition between multiple
files of a movie.
The easiest way to achieve a seamless movie experience is to concatenate the two
movie files.
This can be done with [ffmpeg](./linux/ffmpeg.md).
