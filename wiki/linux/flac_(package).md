# flac (Package)

This article describes the `flac` package on linux.
For the audio codec see the [flac entry](../flac_(codec).md)
`flac` is a package to work with the [flac codec](../flac_(codec).md).

## Setup

On most distributions it is bundled together with the command line tagging
software `metaflac` and other auxiliary tools in the `flac` package.
Another possible tagging software is [MusicBrainz Picard](../picard.md)

## Usage

### Splitting Flac file according to cue file

An easy way to split flac files according to a [cue file](../cue_sheet.md) is
using `cuebreakpoints` and `shnsplit`.
On most distributions they are in a package with the same name.
The following line of shell command splits a flac file according to a cue file.
The `-o` tag specifies the output file format.

```sh
cuebreakpoints '<cue file>' | shnsplit -o flac '<audio flac file>'
```

Omitting of the `-o` flag will result in output files with the `.wav` filetype.
Alternatively the usage of `cuebreakpoints` can be avoided with the following
command.

```sh
 shnsplit -f '<cue file>' -o flac '<audio flac file>'
```

Another option is to use [`cue2tracks`](https://github.com/ar-lex/cue2tracks).
This has the advantage that tags for album title, song name and others are set
while splitting the files.
An example command looks like the following.
The `.flac` file is not mentioned in the command.

```sh
cue2tracks '<cue file>'
```

For any of these commands there can be problems with splitting `.flac` files.
It then is recommended to convert the file to the also lossless `.wav` format,
split the files and convert it back to `.flac`.
