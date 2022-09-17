# Jellyfin

[Jellyfin](https://jellyfin.ord) is a suite for multimedia streaming.
It includes a web-interface.

## Server

A server can be setup via docker with the [linuxserver image](./docker-images/linuxserver_-_jellyfin.md).

## Add IP-TV

You can add IP-TV under `Live TV` in the administration panel.
To include a m3u IP-TV stream just put the file on the server or copy its URL
and add it under `Live TV`.
After that make sure to setup `DVR` to your liking to record.

## Naming schemes of movies and TV shows

This section describes how to name and how to place movies and TV shows and
their extras in the directories correctly to get jellyfin to recognize them.

In
[the jellyfin tv shows documentation](https://jellyfin.org/docs/general/server/media/shows.html)
and
[the jellyfin movie documentation](https://jellyfin.org/docs/general/server/media/movies.html)
are sections on how to name files correctly.
This entry uses the conventions based in the documentation and introduces
slight changes to indicate different versions and encodings more precisely.

### Handling movies or episodes consisting of multiple video files

Jellyfin does not have the capability to seamlessly transition between multiple
files of a movie or episode.
The easiest way to achieve a seamless movie experience is to concatenate the two
movie files.
This can be done with
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

- `behind_the_scenes`
- `deleted_scenes`
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
    ├── best_movie_ever_(2019)_-_brd_uu.mp4
    ├── best_movie_ever_(2019)_-_brd_uu.en.forced.srt
    ├── best_movie_ever_(2019)_-_dvd_u1.mp4
    ├── best_movie_ever_(2019)_-_brd_u1.en.srt
    ├── best_movie_ever_(2019)_-_brd_un_directors_cut.mp4
    ├── behind_the_scenes
    │   ├── best_movie_ever_(2019)_-_brd_uu_making_of.mp4
    │   ├── best_movie_ever_(2019)_-_brd_uu_making_of.en.srt
    │   └── best_movie_ever_(2019)_-_brd_uu_finding_the_right_score.mp4
    ├── interviews
    │   └── best_movie_ever_(2019)_-_brd_u1_director_interview.mp4
    └── extras
        └── best_movie_ever_(2019)_-_dvd_un_home_recreation.mp4
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
    │   ├── series_-_behind_the_scenes_brd_uu.mkv
    │   ├── series_-_name_interview_brd_uu.mkv
    │   └── series_-_featurette_dvd_un.mkv
    │
    ├── season_1
    │   ├── series_-_s01e01-e02_dvd_un.mkv
    │   ├── series_-_s01e01-e02_dvd_un.de.srt
    │   ├── series_-_s01e03_brd_un.mkv
    │   ├── series_-_s01e03_brd_un.de.forced.srt
    │   └── series_-_s01e04_brd_un.mkv
    │   └── series_-_s01e04_brd_un.en.srt
    └── season_2
        ├── series_-_s02e01_dvd_un.mkv
        └── series_-_s02e02_dvd_un.mkv
```
