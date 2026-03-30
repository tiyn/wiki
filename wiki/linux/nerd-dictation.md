# Nerd Dictation

[Nerd Dictation](https://github.com/ideasman42/nerd-dictation/) is a real-time offline speech
recognition software for [Linux](/wiki/linux.md)-based operating systems which uses the
[VOSK API](/wiki/speech_recognition_and_synthesis.md#vosk-api).

## Setup

The Nerd Dictation program can be installed from source as described
[on GitHub](https://github.com/ideasman42/nerd-dictation/).
Some [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) package Nerd
Dictation in the `nerd-dictation` package.

### Configuration

Nerd Dictation needs a model to recognize and transcribe speech.
The default path for this is `~/.config/nerd-dictation/model`.
In this directory a VOSK model can be placed to use as default model.

## Usage

This section addresses the usage of Nerd Dictation.

### Basic Usage

Nerd Dictation can be started using the following command.

```sh 
nerd-dictation begin
```

The model can also be specified using the `--vosk-model-dir` flag.
Assuming the path to the model is `<model-path>` a command will look like the following.
If no model path is specified it uses the default model as described in
[the setup section](#configuration).

```sh 
nerd-dictation begin --vosk-model-dir=<model-path>
```


```sh 
nerd-dictation end
```

## Troubleshooting 

This section will focus on errors and the fixing of errors of /name/.
