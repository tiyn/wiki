# Open WebUI

[Open WebUI](https://openwebui.com/) is a self-hostable artifical intelligence interface that
allows different workflows and even offline operation.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[open-webui image](/wiki/docker/open-webui_-_open-webui.md).

Additionally a provider for the artificial intelligence is needed.
This can be done by using Ollama which can be setup via docker with the
[ollama image](/wiki/docker/ollama_-_ollama.md).
When using this option the address and port for Ollama has to be set in the admin settings of
WebUI.

Alternatively to a self-hosted Ollama also the official ChatGPT service can be linked to WebUI.
This also has to be set up in the admin settings.

## Usage

### Downloading and Selecting New Models

Models are not downloaded via the Open Webui directly.
In fact they are managed by the provider of the AI.
When using Ollama as described in [the setup section](#setup) the following commands can be used to
list available networks.

```sh 
ollama list
```

Afterwards a model can be selected and pulled by using the following command. `<model>` is the name
of the model obtained in the previous step (for example `deepseek-r1`).

```sh 
ollama pull <model>
```

After the downloading of the model it has to be set in the admin settings of WebUI.
