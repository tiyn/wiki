# flac (Package)

This article describes the `flac` package on linux.
For the audio codec see the [flac entry](../flac_(codec).md)

`flac` is a package to work with the [flac codec](../flac_(codec).md).
On most distributions it is bundled together with the command line tagging
software `metaflac` and other auxiliary tools in the `flac` package.
Another possible tagging software is [MusicBrainz Picard](../picard.md)

## Splitting Flac file according to cue file

An easy way to split flac files according to a cue file is using
`cuebreakpoints` and `shnsplit`.
On most distributions they are in a package with the same name.
The following line of shell command splits a flac file according to a cue file.
The `-o` tag specifies the output file format.

```sh
cuebreakpoints '<cue file>' | shnsplit -o flac '<audio flac file>'
```
