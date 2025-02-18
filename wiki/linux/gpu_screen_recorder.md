# GPU Screen Recorder

[GPU Screen Recorder](https://git.dec05eba.com/gpu-screen-recorder/about/) is a
utility similar to [Nvidia ShadowPlay](/wiki/nvidia.md#screen-capture).

## Setup

GPU Screen Recorder can be installed on some distributions by installing the
`gpu-screen-recorder` package.
An installation via [git](https://git.dec05eba.com/gpu-screen-recorder/about/)
is always possible.

## Usage

The program features normal recording of the screen and recording in the so
called replay mode.
To start a simple screen recording run the following command.

```sh
gpu-screen-recorder -w $(xdotool selectwindow) -c mp4 -f 60 -a "$(pactl get-default-sink).monitor" -o test_video.mp4`
```

The window to record has to be selected first by clicking on it.
The default audio device is already selected.

To stop the recording `Ctrl-C` the previous command or use the command below.

```sh
killall -SIGINT gpu-screen-recorder
```

Please note that `gpu-screen-recorder` always uses the GPU by default.
Systems without a GPU will fail to record if not changed to CPU.
This can be done by using the following flag and option.

```txt
-encoder cpu
```

For the replay mode the recording can be started the following way.

```sh
gpu-screen-recorder -w $(xdotool selectwindow) -c mp4 -f 60 -a "$(pactl get-default-sink).monitor" -r 30 -o .`
```

In this case a replay will have the maximum length of 30 seconds (specified by
`-r 30`).
It is also important to assign the `-o` flag with a directory and not a file
anymore.
The last 30 seconds (replay) can then be sending a SIGUSR1 signal.

```sh
killall -SIGUSR1 gpu-screen-recorder
```
