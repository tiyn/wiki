# Audio

Music, audiobooks and podcast are widely enjoyed.
There are multiple different approaches on how to get them onto your system
depending on your needs.
This entry describes how to handle audio data.
Music and Audiobooks can be obtained by buying the digital files or by
[extracting them off of a CD](#extract-audio-files-from-cds).
Podcasts need a podcast client.
A podcast client is used to subscribe to podcasts and download them automatically.
For Linux specific music software navigate to the corresponding
[wiki entry](/wiki/linux/audio_%28linux%29.md).
For voice based communication, social platforms or messengers navigate to the
[communication article](/wiki/communication.md) and the corresponding
[section](/wiki/communication.md#social-platforms-messengers-and-voip-services).
And for headphones navigate to the [headphones article](/wiki/headphones.md):

## Speech Recognition and Synthesis

[Speech recognition and synthesis](/wiki/speech_recognition_and_synthesis.md) describe processes to
understand and convert spoken language to text as well as the reverse process.

## Technical Specifications

This section as well as its subsections address all technical things about audio, like connections,
cables and devices.
The most frequently used audio formats are also addressed.

### Balanced & Unbalanced Audio

Unbalanced audio uses a wire for the positive signal for audio transmission and one for ground.
This is the most frequently used type of cable bound audio transmission.
Usually they are connected with jack connections like 3.5 mm and 6.25 mm.

Balanced audio uses one wire for the positive signal, one for negative and another one for the
ground.
Due to this extra cable a balanced connection can cancel out noise that entered the cable and
affected both the positive and the negative signal.
Balanced uses connectors like 4-pin XLR as well as 2.5 mm and 4.4 mm jacks

### Audio Formats and Encoding

An audio format is an encoding of an audio file.
There are lossy and lossless formats, the latter not compromising quality for
smaller file sizes.
Following is a list of often used formats:

- wav is an uncompressed lossless format
- aiff is an uncompressed lossless format
- [flac](/wiki/flac_%28codec%29.md) is a compressed lossless format
- alac is a compressed lossless format
- ape is a compressed lossless format
- mp3 is a compressed lossy codec
- aac is a compressed lossy codec
- wma is a compressed lossy codec
- ac3 is a compressed lossy codec usually found in DVDs
- dts is a compressed lossy codec usually found in DVDs

Music files can either be encoded lossy or lossless.
Lossless formats can be converted from and to each other without loosing information.
Lossless formats can also be converted to lossy formats to make the files smaller and save space.
Files should not be converted to lossy formats more than once.
Additionally, lossy formats should not be converted to lossless formats as it increases the file
size without adding any audio information.
These not recommended conversions are called bad conversions.

### Cue Files

`.cue` files act as a table of contents for a CD rip.
These can be created when the
[audio of a CD is extracted](#extract-audio-files-from-cds).
Usually this appears together with a single file for the whole CD.
The audio file can then be split according to the `.cue` file.
For splitting of `.flac` files on a Linux system check the
[flac (package) entry](/wiki/linux/flac_%28package%29.md#splitting-flac-file-according-to-cue-file)
for further information.

## Media Software

If you want to keep your system clean of much data, you can use this kind of
setup.
There are differences depending on your preferred software interface.

### Import Playlist to Spotify

Importing a playlist to Spotify can be challenging.
An easy way to do it is using [Spotlistr](https://www.spotlistr.com/search/textbox) using the
text box function.
A List of Songs can be input and after connecting to Spotify, it will be imported automatically.

### Digital Audio Workstations and Recording Software

Digital Audio Workstations – short DAWs – is an application that can be used to record, edit or
produce audio files.

- [LMMS](https://lmms.io/) is a free and cross-platform DAW that is highly compatible with
    [Linux-based systems](/wiki/linux.md).
- [Audacity](https://www.audacityteam.org/) is an open source and cross-platform software to record
    and edit audio.

### Software for Music/Podcasts/Audiobooks

The following is a list of server software, that is featured in this wiki.
The corresponding client software is handled in the server software wiki entry.

- [Subsonic](/wiki/subsonic.md) is a media streamer for music, podcasts and
    audiobooks.
    It is self-hostable and can be dockerized and has a web-interface as well as several
    clients that can be used.
    There are also the free and open-source implementations – that feature all the
    same features and using its API – named [Airsonic](/wiki/airsonic.md) (no longer
    maintained) and its unofficial successor [Airsonic-Advanced](/wiki/airsonic.md).

### Software for Podcasts

- [Podgrab](/wiki/podgrab.md) is a free and open-source podcast client that can also be
    used to listen to them.
    It is self-hostable and can be dockerized.
    It has a web-interface and does not feature client software.

#### Obtaining Audio Files from Different Services

[YouTube](/wiki/youtube.md) features a wide variety of uploaded music and audiobooks.
Using programs like [yt-dl](/wiki/youtube.md#downloading-youtube-videos) they can be downloaded.

[Audible](https://www.audible.de/) is a popular service that makes sells audiobooks.
After purchasing an audiobook it can be downloaded directly from Audible after navigating to the
`Library` tab and selecting `Download`.
Another option is to use [OpenAudible](/wiki/openaudible.md).
This program features various functions to manage Audible audiobooks that include download,
converting and splitting.

[SpotiFLAC](https://github.com/afkarxyz/SpotiFLAC) is a software that is able to download Spotify
tracks, albums, artists and playlists as `.flac`-files from Tidal, Qobuz, Amazon Music and Deezer.
An account on any of these services – or any account at all – is not required.

## Digitalizing and Analyzing Physical Mediums

This section focuses on physical audio mediums like CDs, their digitalization to a digital audio
file of [specific format](#audio-formats-and-encoding) and conversions between them.

### Detect Bad Conversions

The bit rate, format and the sample rate can be usually checked with simple
tools.
For Linux a simple software solution for this is the `file` command.
Running it will display these features of a given audio file.
This will however only display the format features.
Bad conversions as described in
[the previous section](#audio-formats-and-encoding) can not
be detected by this.
A spectral analysis can detect bad conversions.
For this an audio analyzer like
[Sonic Visualizer](https://www.sonicvisualiser.org/) is needed.
Select an audio file and press `Add Spectogram` under `Layer`.
This will display a spectogramm.
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
- [The fre:ac project](https://freac.org/downloads-mainmenu-33) is a free cross-platform
    audio converter and CD ripper with support for various popular formats.
- [The metaflac package](/wiki/linux/flac_%28package%29.md) for [Linux](/wiki/linux.md) is a program to edit
    the tags of [flac](/wiki/flac_%28codec%29.md) files from the command line.
    It is bundled in the `flac` package for [Debian](/wiki/linux/debian.md) and arch based systems.
- [MusicBrainz Picard](/wiki/picard.md) for [Linux](/wiki/linux.md) is a graphical user interface
    for tagging files of many different formats.

### Analysis of Different Versions of an Album

While deciding on what version of an album is the best visit
[Dynamic Range DB](https://dr.loudness-war.info).
It shows dynamic range scores of each version.

### Get Additional Data to an Album/Single

If additional information for an album is needed, visit [Discogs](https://www.discogs.com).
Discogs has track lists, dates and more information to nearly all versions of albums and singles.

### Naming Convention

It is suggested to place the audio files in a directory named after the album they belong to.
These album directories are placed in directories named after the album artist.
Files can be named in the following scheme.

- Music: `[<discnumber>.]<tracknumber>._<artist>_-_<title>`
- Audiobooks: `[<discnumber>.]<tracknumber>._<artist>_-_<album>_<tracknumber>`

### Sheet Music

Music has moved more and more into the computer realm.
An easy and intuitive software that can be used for this is [MuseScore.org](https://musescore.org/)
which features notating music as well as a wide catalog of available sheet music.
MuseScore is free and open-source and is cross-platform.
On [Linux based systems](/wiki/linux.md) it is available on most distributions via the `musescore`
package or their [website](https://musescore.org/download) and can be run with the command `mscore`.
For Windows visit the [download section of the MuseScore website](https://musescore.org/download).

Another option for music notation is [LilyPond](https://lilypond.org/).
It is free software and also features
[a plugin](https://github.com/martineausimon/nvim-lilypond-suite) for [Neovim](/wiki/linux/vim.md).
From the `.ly` files typical for LilyPond `.midi` files can automatically be generated.
These can in turn be played using [FluidSynth](https://www.fluidsynth.org/).

### Getting Metadata

Using [MediaInfo](https://github.com/MediaArea/MediaInfo) metadata of a file can be obtained.
A command for this looks like the following.
In this the file to obtain metadata to is assumed to be `audio.flac`.

```sh
mediainfo audio.flac
```
