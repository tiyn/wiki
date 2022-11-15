# ffmpeg

[ffmpeg](https://www.ffmpeg.org) is a free and open-source suite consisting of
many audio and video tools and libraries.

## Convert from format to another

The following line is an example for a conversion of a video and audio capable
format - in this case `.webm` - to an audio format - in this case `.flac`:
`ffmpeg -i audio.webm -c:a flac audio.flac`.
For audio to audio conversion the following example is used:
`ffmpeg -i audio.m4a -f flac audio.flac`.

## Concatenate multiple video files with matching audio-tracks

First you need to create a text file `files.txt` that includes a line for every
video you want to concatenate in the form of:

```sh
file '<path to the video>'
```

You have to give the absolute path towards the files.
Make sure the videos are in correct order.
To concatenate these video files you can run:

```sh
ffmpeg -f concat -safe 0 -i files.txt -map 0 -c copy output.mp4
```

If the video files you want to concatenate are not mp4 files change the above
command accordingly.
