# Picard

[MusicBrainz Picard](https://picard.musicbrainz.org/) is a free cross-platform
tagging software for music.

## File naming

To enable the file renaming on saving check `Rename files when saving` in the preferences

Under `Options` you can `Open file naming script editor` to change the script.

The following is a basic script for renaming files to the scheme
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

## Tagging

The following explains the most general tags in short.
These are the recommended tags, that are in part used by the script for
renaming the files.

- `title` is the name of the music piece.
- `artist` is the artist of the song - for classical music it is the composer.
- `album` is the name of the album.
- `tracknumber` is the number of the music piece in the album
- `date` is the year of publication
- `albumartist` is the artist that made the album
- `discnumber` is the disc number of the music piece in the album
- `genre` is the genre of the music piece
- `totaldiscs` is the amount of discs of the album
- `totaltracks` is the amount of tracks in the disc of the music piece
- `front` is an image of the front cover
- `performer` is only used in classical music and defines the artist that
  played the piece.
