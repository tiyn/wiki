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
