# Python

[Python](https://www.python.org) is an interpreted general-purpose programming
language.

## Setup

You can install python using various ways.
With `pyenv` you can switch between different versions.
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
The following shows a process of installing Python 3.9.1.
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

### Vim

The steps to make Vim a python IDE are described in
[the vim section of this wiki](../linux/vim/python.md).

Additionally make sure to add

```vimscript
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
```

to your `init.vim` to avoid usage of `pyenv`s version of python in autocompletion.

## Usage

### Create a requirements file

To automatically create a `requirements.txt` of your current project, navigate
to it and run `pipreqs` (install it if not already done).

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

### Pytorch

#### Setup Pytorch with Cuda for GPU usage

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
