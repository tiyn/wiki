# Audio

Music, audiobooks and podcast are widely enjoyed.
There are multiple different approaches on how to get them onto your system
depending on your needs.
This entry describes how to handle audio data.
Music and Audiobooks can be obtained by buying the digital files or by
[extracting them off of a CD](#extract-audio-files-from-cds).
Podcasts need a so called Podcatcher.
A Podcatcher is used to subscribe to podcasts and download them automatically.

## Media software

If you want to keep your system clean of much data, you can use this kind of
setup.
There are differences depending on your preffered software interface.

### Software for Music/Podcasts/Audiobooks

- [Subsonic](./subsonic.md) is a media streamer for music, podcasts and
  audiobooks.
  Subsonic is self-hostable.
  Subsonic that can be dockerized and has a web-interface aswell as several
  clients that can be used.
  There are also the free and open-source implementations - that feature all the
  same features and using its API - named [Airsonic](./airsonic.md) (no longer
  maintained) and its inofficial successor [Airsonic-advanced](./airsonic.md).

### Software for Podcasts

- [Podgrab](./podgrab.md) is a free and open-source podcatcher that can also be
  used to listen to them.
  It is self-hostable and can be dockerized.
  It has a web-interface and does not feature client software.

## Audio codecs

An audio codec is an encoding of an audio file.
There are lossy and lossless codecs, the latter not compromising quality for
smaller file sizes.
Following is a list of codecs written about in this wiki:

- [flac](./flac_(codec).md) is a lossless codec

## Extract audio files from CDs

You can convert your CDs to files on your computer.
This way you don't have to search for your CDs all the time.

- [Exact Audio Copy](https://www.exactaudiocopy.de) for windows can rip music
  and automatically tag it with the help of a list of databases.
- [metaflac](./linux/flac_(package).md) for linux is a programm
  to edit the tags of [flac](./flac_(codec).md) files from the command line.
  It is bundled in the `flac` package for debian and arch based systems.
- [MusicBrainz Picard](./picard.md) for linux is a
  graphical user interface for tagging files of many different formats.

## Quality analysis of different versions of an album

While deciding on what version of an album is the best visit
[Dynamic Range DB](https://dr.loudness-war.info).
It shows dynamic range scorings of each version.

## Get additional data to an album/single

If additional information for an album is needed, visit
[Discogs](https://www.discogs.com).
Discogs has tracklists, dates and more information to nearly all versions of
albums and singles.

## Naming convention

It is suggested to place the audio files in a directory named after the album they
belong to.
These album directories are placed in directories named after the album artist.
Files can be named in the following scheme:

- music: `[<discnumber>.]<tracknumber>._<artist>_-_<title>`
- audiobooks: `[<discnumber>.]<tracknumber>._<artist>_-_<album>_<tracknumber>`
