# flac (Package)

This article describes the `flac` package on linux.
For the audio codec see the [flac entry](../flac_(codec).md)
`flac` is a package to work with the [flac codec](../flac_(codec).md).

## Setup

On most distributions it is bundled together with the command line tagging
software `metaflac` and other auxiliary tools in the `flac` package.
Another possible tagging software is [MusicBrainz Picard](../picard.md)

## Usage

This section addresses the usage of the flac package.

### Splitting Flac file according to cue file

`shnsplit` can be used to split flac files.
In the [shnsplit article](/wiki/linux/shntool.md) an explanation on this is given.

### Compress or Recompress `.wav` and `.flac` files

`.flac` and `.wav` files can be compressed with the following command.
In this `<wav-flac-file>` is the path to the music file but can also use wildcards (for example
`*.wav`).
`<compression>` is the compression rate.
The highest compression preset is `8`.

```sh 
flac -<compression> <wav-flac-file>
```

When recompressing `.flac` files the file does not have to be decoded to encode it again but can be
recompressed in one command.

According to a
[Reddit comment by berdmayne](https://www.reddit.com/r/foobar2000/comments1m3634l/best_way_to_reduce_flac_file_size_without_losing)
the compression rates of the different levels are the following.

| Level            | Saving to level 0   | Saving to previous level |
| ---------------- | ------------------- | ------------------------ |
| 0 (uncompressed) | 0.0%                |                          |
| 1                | 0.5%                | 0.5%                     |
| 2                | 0.9%                | 0.4%                     |
| 3                | 5.3%                | 4.4%                     |
| 4                | 6.0%                | 0.7%                     |
| 5                | 6.4%                | 0.4%                     |
| 6                | 6.7%                | 0.4%                     |
| 7                | 6.9%                | 0.2%                     |
| 8                | 7.0%                | 0.1%                     |

