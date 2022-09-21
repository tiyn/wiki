# ffmpeg

[ffmpeg](https://www.ffmpeg.org) is a free and open-source suite consisting of
many audio and video tools and libraries.

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
