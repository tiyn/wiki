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

### Movies consisting of multiple files

Jellyfin does not have the capability to seamlessly transition between multiple
files of a movie.
The easiest way to achieve a seamless movie experience is to concatenate the two
movie files.
This can be done with [ffmpeg](./linux/ffmpeg.md).

### Extras of movies

In
[the jellyfin documentation](https://jellyfin.org/docs/general/server/media/movies.html)
is a section on how to name the files correctly.
Inside the movie folder you can create subfolders with the following names for
different extras:

- `behind the scenes`
- `deleted scenes`
- `interviews`
- `scenes`
- `samples`
- `shorts`
- `featurettes`
- `extras` (generic catch all for extras of an unknown type)
- `trailers`

An example looks like the following:

```
Movies
└── Best_Movie_Ever (2019)
    ├── Best_Movie_Ever (2019) - 1080P.mp4
    ├── Best_Movie_Ever (2019) - 720P.mp4
    ├── Best_Movie_Ever (2019) - Directors Cut.mp4
    ├── behind the scenes
    │   ├── Making of the Best Movie Ever.mp4
    │   └── Finding the right score.mp4
    ├── interviews
    │   └── Interview with the Director.mp4
    └── extras
        └── Home recreation.mp4
```

Specific extras can also be stored in the main folder of the movie by naming
them to the following (adding a suffix for the type):

- `trailer`
- `sample`
- `theme`

An example looks like the following:

```
Movies
└── Best_Movie_Ever (2019)
    ├── Best_Movie_Ever (2019) - 1080P.mp4
    ├── sample.mp4
    ├── theme.mp3
    └── trailer.mp4
```

Another way to keep extras in the main folder of the movie is by adding the
following suffixes to the files accordingly:


- `-trailer`
- `.trailer`
- `_trailer`
- ` trailer` - This is a space followed by the word ` trailer`
- `-sample`
- `.sample`
- `_sample`
- ` sample` - This is a space followed by the word `sample`
- `-scene`
- `-clip`
- `-interview`
- `-behindthescenes`
- `-deleted`
- `-featurette`
- `-short`

An example looks like the following:

```
Movies
└── Best_Movie_Ever (2019)
    ├── Best_Movie_Ever (2019) - 1080P.mp4
    ├── That clip that I want everyone to see-clip.mp4
    ├── Release Trailer-trailer.mp4
    ├── Preview Trailer.trailer.avi
    ├── Release Trailer 2_trailer.avi
    ├── Teaser.sample.mp4
    ├── Favorite Scene-scene.mp4
    ├── The Best Ever-clip.mp4
    ├── Making of The Best Movie Ever-behindthescenes.mp4
    ├── Not the best scene-deleted.mp4
    ├── Theme Song Music Video-featurette.mp4
    └── Art of the Best Movie Ever-short.mp4
```

## Extras of TV shows

In
[the jellyfin documentation](https://jellyfin.org/docs/general/server/media/shows.html)
is a section on how to name the files correctly.
Inside the shows folder you can create the `season_00` folder as a directory
for extras.

An example looks like the following:

```
Shows
├── Series (2010)
│   ├── Season 00
│   │   ├── Some Special.mkv
│   │   ├── Episode S00E01.mkv
│   │   └── Episode S00E02.mkv
│   ├── Season 01
│   │   ├── Episode S01E01-E02.mkv
│   │   ├── Episode S01E03.mkv
│   │   └── Episode S01E04.mkv
│   └── Season 02
│       ├── Episode S02E01.mkv
│       └── Episode S02E02.mkv
└── Series (2018)
    ├── Episode S01E01.mkv
    ├── Episode S01E02.mkv
    ├── Episode S02E01-E02.mkv
    └── Episode S02E03.mkv
```

In this case it is recommended to name the files not `S00Exy` but according to
their content.
