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

Both movies and TV shows can have extras like a `making of` or a `behind the
scenes`.
This section describes on how to place them in the directories correctly to get
jellyfin to recognize them as extras.

### Handling movies or episodes consisting of multiple video files

Jellyfin does not have the capability to seamlessly transition between multiple
files of a movie or episode.
The easiest way to achieve a seamless movie experience is to concatenate the two
movie files.
This can be done with [ffmpeg](./linux/ffmpeg.md#concatenate-multiple-video-files-with-matching-audio-tracks).

### Naming Movies, multiple movie versions and extras

In
[the jellyfin documentation](https://jellyfin.org/docs/general/server/media/movies.html)
is a section on how to name the files correctly.
In the following slight changes are made to ensure better naming schemes.
Additionally to indicate the encoding and source can be indicated before the
file extension.
`brd` for Blu-ray disc, `dvd` for digital versatile disc.
This is followed by an encoding indicator starting with `u` and followed by
your own scheme for encodings.
Different versions of the same movie can be stored in the same folder with
slightly different names to indicate the specific version.
Inside the movie folder you can create subfolders with the following names for
different extras:

- `behind_the_scenes`
- `deleted_scenes`
- `extras` (generic catch all for extras of an unknown type)
- `featurettes`
- `interviews`
- `samples`
- `scenes`
- `shorts`
- `trailers`

The `movies` folder is a folder containing all movies.
An example looks like the following:

```
movies
└── best_movie_ever_(2019)
    ├── best_movie_ever_(2019)_-_brd_uu.mp4
    ├── best_movie_ever_(2019)_-_dvd_u1.mp4
    ├── best_movie_ever_(2019)_-_brd_un_directors_cut.mp4
    ├── behind_the_scenes
    │   ├── best_movie_ever_(2019)_-_brd_uu_making_of.mp4
    │   └── best_movie_ever_(2019)_-_brd_uu_finding_the_right_score.mp4
    ├── interviews
    │   └── best_movie_ever_(2019)_-_brd_u1_director_interview.mp4
    └── extras
        └── best_movie_ever_(2019)_-_dvd_un_home_recreation.mp4
```


Another way to keep extras in the main folder of the movie is by adding the
following suffixes to the files accordingly:

### Naming TV Shows, episodes and extras

In
[the jellyfin documentation](https://jellyfin.org/docs/general/server/media/shows.html)
is a section on how to name the files correctly.
In the following slight changes are made to ensure better naming schemes.
Inside the shows folder you can create the `season_00` folder as a directory
for extras.
Additionally to indicate the encoding and source can be indicated before the
file extension.
`brd` for Blu-ray disc, `dvd` for digital versatile disc.
This is followed by an encoding indicator starting with `u` and followed by
your own scheme for encodings.
Files containing multiple episodes at once are named by specifying the first
and last episode they include `s01e01-e02`.
Because of the heavily varying the titles of the episodes are not included.
Use the following list to specify the extras inside the `season_0` folder:

- `behind_the_scenes`
- `deleted_scenes`
- `extras` (generic catch all for extras of an unknown type)
- `featurettes`
- `interviews`
- `samples`
- `scenes`
- `shorts`
- `trailers`

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
    │   ├── series_-_s01e03_brd_un.mkv
    │   └── series_-_s01e04_brd_un.mkv
    └── season_2
        ├── series_-_s02e01_dvd_un.mkv
        └── series_-_s02e02_dvd_un.mkv
```
