# Flac

`flac` - short for Free Lossless Audio Codec - is a audio codec without
compression losses.
On most distributions it is bundled together with the tagging software
`metaflac` and other auxiliary tools in the `flac` package.

## Splitting Flac file according to cue file

An easy way to split flac files according to a cue file is using
`cuebreakpoints` and `shnsplit`.
On most distributions they are in a package with the same name.
The following line of shell command splits a flac file according to a cue file.
The `-o` tag specifies the output file format.

```sh
cuebreakpoints '<cue file>' | shnsplit -o flac '<audio flac file>'
```

## Tagging

For tagging go to the [MusicBrainz Picard entry](../picard.md).
