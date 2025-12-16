# Raspberry Pi

A [Rapberry Pi](https://www.raspberrypi.com) is a single board comuter.

## Hardware Additions

There are various hardware additions which can be used with the Raspberry Pi.
This section addresses them.

### AI HAT+

The [AI HAT](https://www.raspberrypi.com/documentation/accessories/ai-hat-plus.html) is an
extension which uses the Hailo AI module for use with the [Raspberry Pi
5](https://www.raspberrypi.com/products/raspberry-pi-5).

#### AI HAT+ Usage

This section addresses the usage of the
[AI HAT](https://www.raspberrypi.com/documentation/accessories/ai-hat-plus.html).

#### Preparing TensorFlow Models for the AI HAT+

For [neural networks](/wiki/neural_network.md) to run on the Hailo AI module and the AI HAT+ they
have to be converted to the `.hef` format.
This section assumes the neural network is using
[TensorFlow](/wiki/programming_language/python.md#tensorflow) and is available as a `.tf` or
`.tflite` file.

To convert TensorFlow models first the Hailo 8 Software Suite needs to be downloaded.
This can be done from the [official website](https://hailo.ai/developer-zone/software-downloads/)
altough an account is needed for it.

After downloading, extracting and then navigating into the folder a heavily customized
[Docker](/wiki/docker.md) container can be started by running the following command.
However it is recommended to slightly modify this file.
Add a volume that contains the TensorFlow model, that is to be converted, to the environment
variable `DOCKER_ARGS` which is set in the file `hailo_ai_sw_suite_docker_run.sh`.

```sh
./hailo_ai_sw_suite_docker_run.sh
```

Using the tools which come in this container a `.tf` or `.tflite` model can be converted to the
`.hef` format.

For this to work run the following commands inside the Docker container.
The first command takes the path to the tensorflow model (`<path-to-tf-model>`) and will output a
`.har` model.
The second command is optional but recommended and takes the path to this `.har` model
(`<path-to-har-model`) and returns an optimized `.har` model.
The third and final command compiles the (optimized) `.har` model, which is given as the input, and
outputs the final `.hre` model, which then can be used with the Hailo AI module.

```sh 
hailo parser tf <path-to-tf-model>
hailo optimize --use-random-calib-set <path-to-har-model>
hailo compiler <path-to-optimized-har-model>
```

Note that the user in the Docker container usually uses anothr UID and GID.
To make the volume and files accessible inside the container the IDs of the files in the volume
should be changed accordingly - for example as shown in the following example.
`<volume-path>` is the path that points to the volume
`<uid>` is the UID of the Docker user - which can be found using `id -u` (for example `10642`) -
and `<gid>` the GID of the Docker user - which can be found using `id -g` (for example `10600`).

```sh 
chown -R <uid>:<gid> <volume-path>
```

After the models have been converted it can be reversed using the systems user UID and GID.
