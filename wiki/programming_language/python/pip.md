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

On some Linux distributions global installation may require the
`--break-system-packages` flag.

```sh
pip install --break-system-packages <package>
```

This option should only be used if the package cannot be installed using the
[system package manager](/wiki/linux/package_manager.md#list-of-package-managers) or inside a
virtual environment.

### Removing Packages

Installed packages can be removed by replacing `<package>` with the package
name.

```sh
pip uninstall <package>
```

### Creating a `requirements.txt` File

To automatically create a `requirements.txt` file for the current project,
navigate to the project directory and run `pipreqs`.

```sh
pipreqs .
```
