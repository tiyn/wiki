# Whisper CLI

[Whisper CLI](https://github.com/vatsalaggarwal/whisper-cli) is a non-real-time offline speech
transcription software for [Linux](/wiki/linux.md)-based operating systems which uses the
[Whisper API](/wiki/speech_recognition_and_synthesis.md#whisper-api).

## Setup

The Whisper CLI program can be installed from source as described
[on GitHub](https://github.com/vatsalaggarwal/whisper-cli).
Some [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) package Whisper CLI
in the `whisper.cpp` package.

### Configuration

By default, Whisper CLI does not feature a global default model path.
If not model path is given as shown in the [basic usage section](#basic-usage) the path
`./models/ggml-base.en.bin` will be used.
The behavior can not be changed using configuration of the program, but a simple alias can set a
default path as shown below.

```sh
alias whisper="whisper-cli -m ~/.config/whisper-cli/ggml-large-v3-turbo-german-q5_0.bin"
```

## Usage

This section addresses the usage of Whisper CLI.

### Basic Usage

Whisper CLI can be used to transcribe an [audio](/wiki/audio.md) file as shown in the following
command.
In this example `<model-path>` is the path to the Whisper model.

```sh
whisper-cli -m <model-path>
```

Additionally, a `.txt` file can be generated as shown below.

```sh
whisper-cli -m <model-path> -otxt
```
