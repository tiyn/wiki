# Python

[Python](https://www.python.org) is an interpreted general-purpose programming
language.

## Setup

You can install python using various ways.

### pyenv Installation

With [pyenv](https://github.com/pyenv/pyenv) you can easily switch between different versions.
Install `pyenv` and `pyenv-virtualenv` and proceed with adding

```txt
export PATH=${HOME}/.pyenv/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

to your `~/.profile`.
You can then set and install your preferred version of python globally with
`pyenv install <version>` and `pyenv global <version>`.

Analog to managing python versions, `pipenv` can manage pip and package versions.
A guide and description of the usage can be found on [gioele.io](https://gioele.io/pyenv-pipenv).

### Manual Installation

This section is based on a guide by [Linuxize](https://linuxize.com/post/how-to-install-python-3-9-on-ubuntu-20-04/).

On [Linux-based systems](/wiki/linux.md) Python can be easily installed using make.
The following shows a process of installing Python `3.9.1`.
When another Python version is needed the version number has to be adapted accordingly.

First make sure all the dependencies are installed.
On a [Ubuntu](/wiki/linux.md#distributions) system or other systems using the apt
[package manager](/wiki/linux/package_manager.md) this can look like the following

```sh
sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
```

For Tk programs (like matplotlib) to work correctly the following dependencies need to be installed
aswell.

```sh 
sudo apt install tk-dev tcl-dev
```

Afterwards the python source code can be downloaded.

```sh
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
tar -xf Python-3.9.1.tgz
cd Python-3.9.1
```

Afterwards if OpenSSL should be enabled for Python uncomment all the corresponding lines in
`Modules/Setup`.
This part of the guide is taken from a
[StackOverflow post by Ironman](https://stackoverflow.com/questions/58309485/modulenotfounderror-no-module-named-ssl).

Then proceed with the installation.

```sh
./configure --enable-optimizations
make
sudo make altinstall
```

Afterwards you can check if the Pyhton version is installed using the following command.

```sh
python3.9 --version
```

## Usage

This section addresses the usage of Python.

### Convert `.ipynb` Files to `.py` Files and Back

Jupyter notebooks in the `.ipynb` format can easily be converted to normal Python files using
[jupytext](https://jupytext.readthedocs.io/en/latest/).
This can sometimes be useful when trying to avoid using notebooks.

The following command will convert the file `<file>.ipynb` to a normal Python file.
`<input-file>` describes the path without the file extension.

```sh
jupytext --to py <input-file>.ipynb
```

The same also works the other way around.

```sh
jupytext --to ipynb <input-file>.py
```

Using `md` in the `--to` option the notebook can also be converted to a
[markdown](/wiki/markup_language.md) file and back.

Alternatively [notedown](https://pypi.org/project/notedown/) can also convert to markdown using the
following commands.
`<output-file>` is the path to the output file again without the extension.

```sh
notedown <input-file>.ipynb --to markdown > <output-file>.md
```

### Create a requirements file

To automatically create a `requirements.txt` of your current project, navigate
to it and run `pipreqs` (install it if not already done).

### Using Virtual Environments

[venv](https://docs.python.org/3/library/venv.html) can be used to create a virtual environment.

```
python -m venv <project-path>
```

When inside the project folder the virtual environment can then be acivated by running the
following command.

```sh
source ./bin/activate
```

And it can be disabled by running the following.

```sh
deactivate
```

If pyenv is installed as described in [the setup section](#pyenv-installation) pyenv can be used to
manage virtual environments.
However pyenv won't create environment directories like venv does.
To fix this the following command can be used to simply link them both as described
[on StackOverflow by Jakob Guldberg Aaes](https://stackoverflow.com/questions/30407446/pyenv-choose-virtualenv-directory).
For this to work a virtual environment already has to be set up using venv as described before.
`<local-venv>` is the full path of the local virtual environment just created and `<venv-name>` the
name the venv should have in pyenv.

```sh
ln -s <local-venv> ~/.pyenv/versions/<venv-name>
```

Using this setup the python version will automatically change when navigating into the project
directory.

## Modules

There are various modules and package managers to install these for Python like
`pip`.
For this usually a virtual environment is needed - as it is described in
[the setup section](#setup).
Alternatively local package manager like the
[ones of various Linux distributions](/wiki/linux/package_manager.md) can sometimes be used to
install packages globally.
Due to different package versions (especially on rolling release distributions) this can fail.
If it doesnt work the packages can be installed globally using `pip` together with the
`--break-system-packages` flag.
This flag is to be used with care.

This section addresses various different modules.

### PyTorch

This section addresses the [PyTorch module](https://pytorch.org/).
Pytorch is a machine learning resource which is often used for
[neural networks](/wiki/neural_network.md).

#### Setup Pytorch with CUDA for GPU usage

CUDA is also only available for Nvidia GPUs.
For AMD GPUs refer to [the ROCm section](#setup-pytorch-with-rocm-for-gpu-usage).

If you are on Arch Linux or a distribution based on it install
`python-pytorch-cuda` via `pacman -S python-pytorch-cuda`.

After that visit
[the official PyTorch website](https://pytorch.org/get-started/locally) and
install PyTorch for your custom configuration.

After that try to run the following python script.
This should give back `True` if the setup was successful and the GPU is available.

```python
import torch

torch.cuda.is_available()
```

Please note that according to
[various sources](https://www.reddit.com/r/archlinux/comments/1nxipcu/nvidia_pascal/gpu_not_supporting_cuda_13_can_i)
CUDA 13 does not support nVidia Pascal GPUs.
In this case an earlier version of CUDA has to be used.

#### Setup PyTorch with ROCm for GPU usage

ROCm is also only available for AMD GPUs.
For Nvidia GPUs refer to [the CUDA section](#setup-pytorch-with-cuda-for-gpu-usage).

For ROCm to work some system packages have to be installed.
For Linux refer to the
[official Linux guide](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installrad/native_linux/install-radeon.html).
For [Arch Linux](/wiki/linux/arch-linux.md) although it is not listed the required
[AUR packages](/wiki/linux/package_manager.md) include `rocm-core`, `rocminfo`, `roctracer` and
`rccl`.
For Windows refer to the
[official Windows guide](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installrad/windows/howto_windows.html).

After the systemwide setup the project environment can be setup.
It is recommended to use [virtual environments](#using-virtual-environments).
The easiest way to achieve ROCm support is by using [pip](#modules).
As explained in the 
[official PyTorch guide](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installrad/native_linux/install-pytorch.html)
the following example can be used inside the environment to install all needed ROCm packages.
In this example the version `7.2` is installed.
Adjustments to the command may have to be done in case another version should be installed.

```sh 
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-7.2/torch-2.9.1%2Brocm7.2.0.lw.git7e1940d4-cp312-cp312-linux_x86_64.whl
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-7.2/torchvision-0.24.0%2Brocm7.2.0.gitb919bd0c-cp312-cp312-linux_x86_64.whl
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-7.2/triton-3.5.1%2Brocm7.2.0.gita272dfa8-cp312-cp312-linux_x86_64.whl
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-7.2/torchaudio-2.9.0%2Brocm7.2.0.gite3c6ee2b-cp312-cp312-linux_x86_64.whl
pip install \
torch-2.9.1+rocm7.2.0.lw.git7e1940d4-cp312-cp312-linux_x86_64.whl \
torchvision-0.24.0+rocm7.2.0.gitb919bd0c-cp312-cp312-linux_x86_64.whl \
torchaudio-2.9.0+rocm7.2.0.gite3c6ee2b-cp312-cp312-linux_x86_64.whl \
triton-3.5.1+rocm7.2.0.gita272dfa8-cp312-cp312-linux_x86_64.whl
```

If old versions of `torch`, `torchvision`, `torchaudio` or `triton` are installed inside the
environment they may need to be removed.

After this installation for some GPUs - especially integrated GPUs like the Radeon 660M - an
additional step has to be taken.
In this case the following global shell variable has to be set.

```sh 
export HSA_OVERRIDE_GFX_VERSION=10.3.0
```

After that try to run the following python script.
Since ROCm uses a bridge to access CUDA it should give back `True` if the setup was successful and
the GPU is available.

```python
import torch

torch.cuda.is_available()
```

### Hailo

The package for [Hailo chips](/wiki/hailo.md) has to be downloaded from the
[official website](https://hailo.ai/developer-zone/software-downloads).
Additionally additional setup may be required as explained in the
[Hailo article](/wiki/hailo.md#setup)

Hailo chips can be used to run converted [TensorFlow](#tensorflow) models.
The conversion process is explained in the
[Hailo article](/wiki/hailo.md#preparing-tensorflow-models-for-the-ai-hat)

To run the inference using Python on ARM boards like the
[Raspberry Pi AI Hat +](/wiki/linux/raspberry_pi.md#ai-hat)
[zlodeibaal's article in Medium](https://medium.com/@zlodeibaal/how-to-run-hailo-on-arm-boards-d2ad599311fa)
can be referenced.

### TensorFlow

This section addresses the [TensorFlow module](https://www.tensorflow.org/).
Tensorflos is a machine learning resource which is often used for
[neural networks](/wiki/neural_network.md).

#### Basic Usage of TensorFlow

The basic usage of TensorFlow is described in
[the official guide](https://www.tensorflow.org/guide/keras/serialization_and_saving).
Additionally it is noted that the dataset may have to be shuffled manually as described in a
[comment by Y. Luo on StackOverflow](https://stackoverflow.com/questions/50184144/shuffle-in-the-model-fit-of-keras).
Finally
[a Medium blog post](https://medium.com/@danielonugha0/how-to-change-the-learning-rate-of-tensorflow-b5d854819050)
describes how to easily change the learning rate.

#### Combining Models

Models that are normally run in sequence but trained and saved separately can be easily be combined
into a single model.
This can have some advantages, for example when using inteference for deep learning on Edge TPUs
like the [Hailo chips](/wiki/hailo.md) or the [EPS32S3](/wiki/microcontroller.md#esp32).

A simple example for the combination of two models (`model1` and `model2`) into a new model
(`combined_model`) is the following code.

```sh 
output = model2(model1.output)
combined_model = tf.keras.models.Model(inputs=model1.input, outputs=output)
```
