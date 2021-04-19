# ffmpeg

[ffmpeg](https://www.ffmpeg.org) is a free and open-source suite consisting of
many audio and video tools and libraries.

## Concatenate multiple video files with matching audio-tracks

First you need to create a text file `files.txt` that includes a line for every
video you want to concatenate in the form of:

```shell
file '<path to the video>'
```

Make sure the videos are in correct order.
To concatenate these video files you can run:

```shell
ffmpeg -f concat -safe 0 -i files.txt -map 0 -c copy output.mp4
```
