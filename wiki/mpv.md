# mpv

[mpv](https://mpv.io/) is a cross-platform command line video player.
It is mainly used for [movies and tv shows](/wiki/video.md) but can handle any kind of local or
remote video file.

## Setup

On most [Linux](/wiki/linux.md) distributions mpv can be installed with the `mpv` package.
Alternatively and for [Windows](/wiki/windows.md) it can be installed via
[GitHub](https://github.com/mpv-player/mpv).

## Usage

This section addresses various features of mpv.

### Enable Previews

Using the [mpv thumbnail script](https://github.com/TheAMM/mpv_thumbnail_script) a preview can be
added to mpv.
This section will describe the Linux-way to install this feature.
It is also available in a similar way for MacOS and Windows.

The scripts need to be compiled freshly to ensure they're working with the current mpv version.
Then they will be added to the corresponding folder of the mpv settings.

```sh
git clone https://github.com/TheAMM/mpv_thumbnail_script
cd mpv_thumbnail_script
make
cp mpv_thumbnail_script_client_osc.lua mpv_thumbnail_script_server.lua ~/.config/mpv/scripts
```

Afterwards create the file `~/.config/mpv/script-opts/mpv_thumbnail_script.conf` with the following
text.

```txt
autogenerate=yes
autogenerate_max_duration=14400
mpv_no_sub=yes
```

And finally add the following lines to the file `~/.config/mpv/mpv.conf`

```txt
osc=no
```
