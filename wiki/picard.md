# Picard

[MusicBrainz Picard](https://picard.musicbrainz.org/) is a free cross-platform
tagging software for [music or other audio files](./audio.md).
It is able to tag a wide range of [audio codecs](./audio.md#audio-codecs)
[flac](./flac_(codec).md) among others.

## File naming

To enable the file renaming on saving check `Rename files when saving` in the
preferences.
Under `Options` you can `Open file naming script editor` to change the script.
The tags described used are based on the audio codec.
In this section it is assumed the standard
[flac tags](./flac_(codec).md#tagging) are used as described in this wiki.

### Music

The following is a basic script for renaming music files to the scheme
`[<discnumber>.]<tracknumber>._<artist>_-_<title>`
all in lower case.
discnumber is only added, when the total disc count is greater than 1.
Both discnumber and tracknumber are padded according to the number of total
discs and tracks.
The tracknumber is padded to at least 2 places.

```
$replace($lower(
$if($gt(%totaldiscs%,1),$num(%discnumber%,$len(%totaldiscs%)).,)
$num(%tracknumber%,$if($gt($len(%totaltracks%),2),$len(%totaltracks%),2))._
%artist%_-_
%title%), ,_)
```

### Audiobooks

Another Script is mainly used for audiobooks, where the title is not part of
the filename to avoid confusion.
The files are renamed with the scheme
`[<discnumber>.]<tracknumber>._<artist>_-_<album>_<tracknumber>`
all in lower case.
Both discnumber and tracknumber are handled in the same way as in the previous
script.

```
$replace($lower(
$if($gt(%totaldiscs%,1),$num(%discnumber%,$len(%totaldiscs%)).,)
$num(%tracknumber%,$if($gt($len(%totaltracks%),2),$len(%totaltracks%),2))._
%artist%_-_
%album%), ,_)_
$num(%tracknumber%,$if($gt($len(%totaltracks%),2),$len(%totaltracks%),2))
```
