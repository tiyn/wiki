# FFmpeg

[FFmpeg](https://www.ffmpeg.org) is a free and open-source suite consisting of
many audio and video tools and libraries.

## Usage

### Convert from format to another

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

### Two-Pass Encoding

Two pass encoding - as described in the
[official FFmpeg documentation](https://trac.ffmpeg.org/wiki/Encode/H.264#twopass)
- uses two passes.
The first pass analyzes the input data and outputs a descriptor file.
The second pass actually encodes the data.
The following is an example where the file `input` is encoded with `libx264` to
`mp4` video with `libfdk_aac` audio.
The video bitrate is `555k` and the audio bitrate is `128k`.

```sh
ffmpeg -y -i input -c:v libx264 -b:v 555k -pass 1 -c:a libfdk_aac -b:a 128k -f mp4 /dev/null && \
ffmpeg -i input -c:v libx264 -b:v 555k -pass 2 -c:a libfdk_aac -b:a 128k output.mp4
```

### Encode Audio/Video to Target Size

For the encoding of a file to a target size the target bitrate of the output
video is needed.
An explanation of this was given by
[aergistal on Stack Overflow](https://stackoverflow.com/questions/29082422/ffmpeg-video-compression-specific-file-size).
This can easily be done with the calculation `bitrate = target size / duration`
in Bits/Second.
Afterwards the encoding can be done by using Two-Pass Encoding as explained in
[a previous section](#two-pass-encoding).
Note that the bitrate for videos is split amongst a bitrate for video and a
bitrate for audio.
The target bitrate has to be equal to or greater than the sum of both video
bitrate and audio bitrate.
