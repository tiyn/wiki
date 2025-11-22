# Audio

Music, audiobooks and podcast are widely enjoyed.
There are multiple different approaches on how to get them onto your system
depending on your needs.
This entry describes how to handle audio data.
Music and Audiobooks can be obtained by buying the digital files or by
[extracting them off of a CD](#extract-audio-files-from-cds).
Podcasts need a so called Podcatcher.
A Podcatcher is used to subscribe to podcasts and download them automatically.
For Linux specific music software navigate to the corresponding
[wiki entry](/wiki/linux/audio.md).
For voice based communication, social platforms or messengers navigate to the
[communication article](/wiki/communication.md) and the corresponding
[section](/wiki/communication.md#social-platforms-messengers-and-voip-services).
For headphones navigate to the [headphones article](/wiki/headphones.md):

## Technical Specifications

This section aswell as its subsections address all technical things about audio, like connections,
cables and devices.
The most frequently used audio formats are also addressed.

### Balanced & Unbalanced Audio

Unbalanced audio uses a wire for the positive signal for audio transmission and one for ground.
This is the most frequently used type of cable bound audio transmission.
Usually they are connected with jack connections like 3.5mm and 6.25mm.

Balanced audio uses one wire for the positive signal, one for negative and another one for the
ground.
Due to this extra cable a balanced connection can cancel out noise that entered the cable and
affected both the positive and the negative signal.
Balanced uses connectors like 4-pin XLR aswell as 2.5mm and 4.4mm jacks

### Audio Formats and Encoding

An audio format is an encoding of an audio file.
There are lossy and lossless formats, the latter not compromising quality for
smaller file sizes.
Following is a list of often used formats:

- wav is an uncompressed lossless format
- aiff is an uncompressed lossless format
- [flac](./flac_(codec).md) is a compressed lossless format
- alac is a compressed lossless format
- ape is a compressed lossless format
- mp3 is a compressed lossy codec
- aac is a compressed lossy codec
- wma is a compressed lossy codec
- ac3 is a compressed lossy codec usually found in DVDs
- dts is a compressed lossy codec usually found in DVDs

Music files can either be encoded lossy or lossless.
Lossless formats can be converted from and to each other without loosing
information.
Lossless formats can also be converted to lossy formats to make the files
smaller and save space.
Files should not be converted to lossy formats more than once.
Additionally lossy formats should not be converted to lossless formats as it
increases the file size without adding any audio information.
These not recommended conversions are called bad conversions.

### Cue Files

`.cue` files act as a table of contents for a CD rip.
These can be created when the
[audio of a CD is extracted](#extract-audio-files-from-cds).
Usually this appears together with a single file for the whole CD.
The audio file can then be split according to the `.cue` file.
For splitting of `.flac` files on a Linux system check the
[a flac (package) entry](/wiki/linux/flac_(package).md#splitting-flac-file-according-to-cue-file)
for further informations.

## Media Software

If you want to keep your system clean of much data, you can use this kind of
setup.
There are differences depending on your preffered software interface.

### Digital Audio Workstations and Recording Software

Digital Audio Workstations - short DAWs - is an application that can be used to record, edit or
produce audio files.

- [LMMS](https://lmms.io/) is a free and cross-platform DAW that is highly compatible with
  [Linux-based systems](/wiki/linux.md).
- [Audacity](https://www.audacityteam.org/) is an open source and cross-platform software to record
  and edit audio.

### Software for Music/Podcasts/Audiobooks

The following is a list of server software, that is featured in this wiki.
The corresponding client software is handled in the server softwares wiki entry.

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

#### Obtaining Audio Files from Different Services

[YouTube](/wiki/youtube.md) features a wide variety of uploaded music and audiobooks.
Using programs like [yt-dl](/wiki/youtube.md#downloading-youtube-videos) they can be downloaded.

[Audible](https://www.audible.de/) is a popular service that makes sells audibooks.
After purchasing an audiobook it can be downloaded directly from Audible after navigating to the
`Library` tab and selecting `Download`.
Another option is to use [OpenAudible](/wiki/openaudible.md).
This program features various functions to manage Audible audiobooks that include download,
converting and splitting.

## Digitalizing and Analyzing Physical Mediums

This section focusses on physical audio mediums like CDs, their digitalization to a digital audio
file of [specific format](#audio-formats-and-encoding) and conversions between them.

### Detect Bad Conversions

The bitrate, format and the sample rate can be usually checked with simple
tools.
For Linux a simple software solution for this is the `file` command.
Running it will display these features of a given audio file.
This will however only display the format features.
Bad convserions as described in
[the previous section](#audio-formats-and-encoding) can not
be detected by this.
A spectral analysis can detect bad conversions.
For this a audio analyzer like
[Sonic Visualizer](https://www.sonicvisualiser.org/) is needed.
Select a audio file and press `Add Spectogram` under `Layer`.
This will display a spectogram.
Music off of a retail CD and lossless songs have frequencies that extend up to
22kHz and can extend even further for hi-res music.
If the frequency extends up to at least 22kHz the file is lossless for sure.
If the frequency is cut before and the file is encoded in a lossless file it has
undergone a bad conversion and is not really lossless.

### Extract Audio Files from CDs

You can convert your CDs to files on your computer.
This way you don't have to search for your CDs all the time.

- [Exact Audio Copy](https://www.exactaudiocopy.de) for windows can rip music
  and automatically tag it with the help of a list of databases.
- [fre:ac](https://freac.org/downloads-mainmenu-33) is a free cross-platform
  audio converter and CD ripper with support for various popular formats.
- [metaflac](./linux/flac_(package).md) for linux is a programm
  to edit the tags of [flac](./flac_(codec).md) files from the command line.
  It is bundled in the `flac` package for debian and arch based systems.
- [MusicBrainz Picard](./picard.md) for linux is a
  graphical user interface for tagging files of many different formats.

### Analysis of Different Versions of an Album

While deciding on what version of an album is the best visit
[Dynamic Range DB](https://dr.loudness-war.info).
It shows dynamic range scorings of each version.

### Get Additional Data to an Album/Single

If additional information for an album is needed, visit
[Discogs](https://www.discogs.com).
Discogs has tracklists, dates and more information to nearly all versions of
albums and singles.

### Naming Convention

It is suggested to place the audio files in a directory named after the album they
belong to.
These album directories are placed in directories named after the album artist.
Files can be named in the following scheme:

- music: `[<discnumber>.]<tracknumber>._<artist>_-_<title>`
- audiobooks: `[<discnumber>.]<tracknumber>._<artist>_-_<album>_<tracknumber>`

### Scoring Music

Scoring music has moved more and more into the computer realm.
An easy and intuitive software that can be used for this is
[MuseScore.org](https://musescore.org/).
MuseScore is free and open-source and is cross-platform.
On [Linux based systems](/wiki/linux.md) it is available on most distributions via the `musescore`
package or their [website](https://musescore.org/download) and can be run with the command `mscore`.
For Windows visit the [download section of the MuseScore website](https://musescore.org/download).

### Getting Metadata

Using [MediaInfo](https://github.com/MediaArea/MediaInfo) metadata of a file can be obtained.
A command for this looks like the following.
In this the file to obtain metadata to is assumed to be `audio.flac`.

```sh
mediainfo audio.flac
```
