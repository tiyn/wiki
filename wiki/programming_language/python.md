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

There are various modules and package managers to install these for python like
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

### PyTorch

This section addresses the [PyTorch module](https://pytorch.org/).
Pytorch is a machine learning resource which is often used for
[neural networks](/wiki/neural_network.md).

#### Setup Pytorch with Cuda for GPU usage

Please note that according to
[various sources](https://www.reddit.com/r/archlinux/comments/1nxipcu/nvidia_pascal/gpu_not_supporting_cuda_13_can_i)
Cuda 13 does not support nVidia Pascal GPUs.
In this case an earlier version of Cuda has to be used.

If you are on Arch Linux or a distribution based on it install
`python-pytorch-cuda` via `pacman -S python-pytorch-cuda`.

After that visit
[the official pytorch website](https://pytorch.org/get-started/locally/) and
install pytorch for your custom configuration.

After that try to run the following python script:

```python
import torch

torch.cuda.is_available()
```

This should give back `True`.

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
