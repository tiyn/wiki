# Video

It is nice to have some movies, tv shows or other videos saved on your system.
There are multiple different approaches on how to get it working depending on
your needs.
In general you need to consider if you want the video directly on your pc or
access a server for it.

## Server/Client

If you want to keep your system clean of much data, you can use this kind of setup.
There are differences depending on your preffered client interface.

- [Plex](https://www.plex.tv) is a dockerizable media streaming service with web-interface.
- [Jellyfin](./jellyfin.md) is a foss dockerizable media streaming service with web-interface.

## Scan DVDs/Blu-Rays

You can convert your DVDs and Blu-Rays to files on your computer.
This way you don't have to search for your discs all the time.

- [MakeMKV](https://www.makemkv.com) for windows can extract a `.mkv` file from
  a disc (Beta key can be found
  [here](https://www.makemkv.com/forum/viewtopic.php?f=5&t=1053)).
  On Linux it is possible that the drive is not detected in MakeMKV.
  To fix this issue run the following lines and reboot afterwards.

  ```
  su
  echo sg > /etc/modules-load.d/sg.conf
  ```

  MakeMKV can be obtained over different ways. One of them is flatpack in which
  you start MakeMKV via `flatpak run com.makemkv.MakeMKV` after installation.

- [MKS Extractor GUI](https://www.videohelp.vom/software/MKS-Extractor-GUI)
  for windows can extract subtitles from a `.mkv` file.
- [Subtitleedit](https://www.nikse.dk/subtitleedit)) for linux can extract subtitles from a `.mkv`
  file and do ocr.
- [VidCoder](https://vidcoder.net) for windows can compress video files. Its an adapted version of
  the HandBrake software.
- [HandBrake](handbrake.md) is an open-source and multi-platform program that can compress video
  files.

## Naming schemes of movies and TV shows

This section describes how to name and how to place movies and TV shows and
their extras in the directories correctly to get [jellyfin](./jellyfin.md) and
other software media systems to recognize them.

In
[the jellyfin tv shows documentation](https://jellyfin.org/docs/general/server/media/shows.html)
and
[the jellyfin movie documentation](https://jellyfin.org/docs/general/server/media/movies.html)
are sections on how to name files correctly.
This entry uses the conventions based in the documentation and introduces
slight changes to indicate different versions and encodings more precisely.

### Handling movies or episodes consisting of multiple video files

Some software media systems do not have the capability to seamlessly transition
between multiple files of a movie or episode.
The easiest way to achieve a seamless movie experience is to concatenate the
two movie files.
This can be easily done with
[ffmpeg](./linux/ffmpeg.md#concatenate-multiple-video-files-with-matching-audio-tracks).

### Naming Subtitles of movies or tv shows

Subtitles can be written into video files.
If that is the case an additional naming of the file is not needed.
This section especially targets `.srt` files but the naming conventions
translate to other file types aswell.
Files containing subtitles are named the same as the video file they relate to
The only difference is the file extension.
After the name of the file the language of the subtitles is indicated by the
two-letter language code specified by
[ISO 639-1](https://iso639-3.sil.org/code_tables/639/data?title=&field_iso639_cd_st_mmbrshp_639_1_tid=255291).
For example `.en` is added to specify the english language.
After that `.forced` can be added, if the subtitles are forced.
Lastly the file extension `.srt` is appended.
The complete subtitle file look like this:
`movie_(1234)_-_brd_uu.en.forced.srt`.

Additionally to indicate the encoding and source can be indicated before the
file extension.
`brd` for Blu-ray disc, `dvd` for digital versatile disc.
This is followed by an encoding indicator starting with `u` and followed by
your own scheme for encodings.

### Naming extras

The following list are set expressions for extras of movies and tv shows.
These will be used in the following sections on how to name
[movies](#naming-movies) and
[tv shows](#naming-tv-shows).
For the exact use of them look into these sections.

- `extras` (generic catch all for extras of an unknown type)
- `featurettes`
- `interviews`
- `samples`
- `scenes`
- `shorts`
- `trailers`

### Naming movies

In the following slight changes are made to ensure better naming schemes.
Different versions of the same movie can be stored in the same folder with
slightly different names to indicate the specific version.
Inside the movie folder you can create subfolders with names according to the
expressions for extras from the [extras section](#naming-extras).

The `movies` folder is a folder containing all movies.
An example looks like the following:

```
movies
└── best_movie_ever_(2019)
    ├── best_movie_ever_(2019)-brd_uu.mp4
    ├── best_movie_ever_(2019)-brd_uu.en.forced.srt
    ├── best_movie_ever_(2019)-dvd_u1.mp4
    ├── best_movie_ever_(2019)-brd_u1.en.srt
    ├── best_movie_ever_(2019)-brd_un_directors_cut.mp4
    ├── behind_the_scenes
    ├── interviews
    │   └── director_interview-brd_u1.mp4
    └── extras
        ├── making_of-brd_uu.mp4
        ├── making_of-brd_u1.en.srt
        ├── finding_the_right_score-dvd_u1.mp4
        └── home_recreation-brd_u2.mp4
```


Another way to keep extras in the main folder of the movie is by adding the
following suffixes to the files accordingly:

### Naming TV shows

Inside the shows folder you can create the `season_00` folder as a directory
for extras.
Files containing multiple episodes at once are named by specifying the first
and last episode they include `s01e01-e02`.
Because of the heavily varying the titles of the episodes are not included.
Specify the extras inside the `season_0` folder with the expressions from
[the extras section](#naming-extras).

The `shows` folder is a folder containing all tv shows.
An example looks like the following.

```
shows
└── series_(2010)
    ├── season_0
    │   ├── behind_the_scenes-brd_uu.mkv
    │   ├── interview-brd_uu.mkv
    │   └── featurette-dvd_un.mkv
    │
    ├── season_1
    │   ├── series_(2010)_s01e01-e02-dvd_un.mkv
    │   ├── series_(2010)_s01e01-e02-dvd_un.de.srt
    │   ├── series_(2010)_s01e03-brd_un.mkv
    │   ├── series_(2010)_s01e03-brd_un.de.forced.srt
    │   └── series_(2010)_s01e04-brd_un.mkv
    │   └── series_(2010)_s01e04-brd_un.en.srt
    └── season_2
        ├── series_(2010)_s02e01-dvd_un.mkv
        └── series_(2010)_s02e02-dvd_un.mkv
```
