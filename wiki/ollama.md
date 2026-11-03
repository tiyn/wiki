# Ollama

[Ollama](https://ollama.com/) is a tool for running large language models locally.
It can be used from the command line or through interfaces such as
[Open WebUI](/wiki/open_webui.md) and [Neovim](/wiki/linux/neovim.md#ogptnvim).

## Setup

Ollama can be installed using the instructions on the
[official website](https://ollama.com/download).
Alternatively, a [Docker container](/wiki/docker/ollama_-_ollama.md) can be used.

On Linux the Ollama server can be started manually using the following command if it is not already
running as a system service.

```sh
ollama serve
```

The server is available on `http://localhost:11434` by default.

## Usage

This section addresses the usage of Ollama.

### Basic Usage

The following command downloads a model.
`deepseek-r1:7b` is used as an example but can easily be replaced with another model.

```sh
ollama pull deepseek-r1:7b
```

To run the model interactively use the following command.

```sh
ollama run deepseek-r1:7b
```

To list the downloaded models use

```sh
ollama list
```
