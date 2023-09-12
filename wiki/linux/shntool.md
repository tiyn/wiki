# shntool

[shntool](http://shnutils.freeshell.org/shntool/) is a multi-purpose data processing utility.
With it audio files of a wide array of codecs - like [flac](/wiki/flac_%28codec%29.md) - can be
edited.

## Setup

shntool can be installed on most distributions by installing the `shntool` package.

## Usage

### Splitting Audio Files According to a CUE File

An easy way to split audio files according to a [cue file](../cue_sheet.md) is
using `shnsplit`.
Alternatively the interface `cuebreakpoints` can be used which uses `shnsplit`.
Note that some codecs require special setup.
These codecs are referenced in the end of this section.

The following line of shell command splits an audio file according to a cue file.
The `-o` tag specifies the output file format - for example `flac`.

```sh
cuebreakpoints '<cue file>' | shnsplit -o '<codec>' '<audio file>'
```

Omitting of the `-o` flag will result in output files with the `.wav` filetype.
Alternatively the usage of `cuebreakpoints` can be avoided with the following
command.

```sh
 shnsplit -f '<cue file>' -o '<codec>' '<audio file>'
```

Another option is to use [`cue2tracks`](https://github.com/ar-lex/cue2tracks).
This has the advantage that tags for album title, song name and others are set
while splitting the files.
An example command looks like the following.
The audio file is not mentioned in the command.

```sh
cue2tracks '<cue file>'
```

For any of these commands there can be problems with splitting files.
It then is recommended to convert the file to the also lossless `.wav` format,
split the files and convert it back to the desired codec.

For `ape` files a special package needs to be installed to be able to split them as explained by
[Ciro Santilli](https://unix.stackexchange.com/questions/165485/why-can-i-not-split-a-ape-file).
This package is called `flacon`.
It is normally used as a GUI for `shntool` but comes with the codecs needed.
It is usually available in a package of the name `flacon`.
On Ubuntu systems the repository first has to be added by running the following command.

```sh
add-apt-repository -y ppa:flacon
```

Afterwards `flacon` can be installed like a normal package.

## Troubleshooting

### Unable to Split Audio Files

This error occurs when
[splitting audio files according to cue files](#splitting-audio-files-according-to-a-cue-file).
High quality flac files with older `.cue` files that use the format `mm:ss:ff`
might split the file at the wrong timings.
The format `mm:ss:ff` is not compatible with the newer versions of
cuebreakpoints, cue2tracks and shnsplit.
To get the correct timings the `.cue` file has to be changed to use the format
`mm:ss:fff`.
It is recommended to use the shnsplit alternative in this case.
