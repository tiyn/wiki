# pip

[pip](https://pip.pypa.io/) is the default package manager for Python.
It is used to install, update and remove Python packages from the Python Package Index (PyPI) and
other package repositories.

## Usage

### Installing Packages

A package can be installed by replacing `<package>` with its name.

```sh
pip install <package>
```

It is generally recommended to install packages inside a
[virtual environment](/wiki/programming_language/python.md#using-virtual-environments).
Alternatively, project-based package managers such as [uv](/wiki/programming_language/python/uv.md)
can be used.

Global installation using pip is not recommended and 
[system package manager](/wiki/linux/package_manager.md#list-of-package-managers) should be
preferred.
When installing globally, however, on some Linux distributions global installation may require the
`--break-system-packages` flag.

```sh
pip install --break-system-packages <package>
```


### Migrating Global Packages to the System Package Manager

Due to it being more favorable to install global packages using a
[system package manager](/wiki/linux/package_manager.md) or a
[Python](/wiki/programming_language/python.md) package manager such as
[uv](/wiki/programming_language/python/uv.md) which is able to handle global installations, it may
be useful to migrate to a system package manager.

For [Arch Linux](/wiki/linux/arch-linux.md) systems the process for this is explained in the
[Pacman and AUR entry](/wiki/linux/package_manager/pacman_and_aur.md).
