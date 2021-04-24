# Python

[Python](https://www.python.org) is an interpreted general-purpose programming
language.

## Installation

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

### Avoid Errors in Vim

Make sure to add

```vimscript
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
```

to your `init.vim` to avoid usage of `pyenv`s version of python in autocompletion.

## IDE

### Vim

The steps to make Vim a python IDE are described in
[the vim section of this wiki](../linux/vim/python.md).
