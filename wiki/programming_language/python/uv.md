# uv

[uv](https://docs.astral.sh/uv/) is a fast [Python](/wiki/programming_language/python.md) package,
project and version manager.
It can install and manage Python versions, create virtual environments and manage project
dependencies.

## Setup

Refer to the [official installation guide](https://docs.astral.sh/uv/getting-started/installation/)
to install uv on your operating system.

## Usage

This section addresses the usage of uv.


### Automatically Updating `requirements.txt`

Projects that still require a `requirements.txt` file can regenerate it automatically by using a Git
`pre-commit` hook.
The hook is executed before every commit and can export the current project dependencies before the
changes are committed.

For the export command see the
[`requirements.txt` export section](#exporting-requirementstxt).
For a general explanation of Git hooks refer to the
[Git Hooks section](/wiki/linux/git_%28package%29.md#git-hooks) in the
[Git package entry](/wiki/linux/git_%28package%29.md).

### Exporting `requirements.txt`

Although `uv` primarily manages dependencies through `pyproject.toml` and `uv.lock`, some tools like
[pip](/wiki/programming_language/python.md#pip) and other
[virtual environments](/wiki/programming_language/python.md#using-virtual-environments) still expect
a `requirements.txt` file.

The recommended way to generate it is by exporting the locked project dependencies.

```sh
uv export --format requirements-txt -o requirements.txt
```

This creates a reproducible `requirements.txt` based on the project's lock file.

Alternatively, the packages currently installed in the active virtual environment can be exported.

```sh
uv pip freeze > requirements.txt
```

Unlike `uv export`, this command only lists the packages that are currently installed and therefore
depends on the state of the active environment.

If a `requirements.txt` file should always stay in sync with the project dependencies, it can be
automatically regenerated using a Git `pre-commit` hook.
For more information refer to the
[Git Hooks section](/wiki/linux/git_%28package%29.md#git-hooks) in
[Linux' entry about Git](/wiki/linux/git_%28package%29.md).

### Executable Scripts

uv fully supports Python scripts that use the standard Python shebang.

```py
#!/usr/bin/env python
```

This allows scripts to automatically use the Python interpreter provided by the current uv project
or [virtual environment](/wiki/programming_language/python.md#using-virtual-environments).

For a general explanation of shebangs and executable scripts, refer to the
[Shell article](/wiki/linux/shell.md#shebangs).

### Managing Python Versions

Python versions can be installed and pinned for the current project by replacing
`<python-version>` with the desired version.

```sh
uv python install <python-version>
uv python pin <python-version>
```

### Creating a Project

A new project can be created by replacing `<path>` with the desired project
directory.
If omitted, the project will be created in the current working directory.

```sh
uv init <path>
```

To create a minimal project without a `README.md`, use the `--bare` option.

### Virtual Environments

Inside a project directory, create a virtual environment with:

```sh
uv venv
```

This creates a `.venv` directory containing the virtual environment.

### Installing Packages

Packages can be added to the current project by replacing `<package>` with the
desired package.

```sh
uv add <package>
```

### Installing CLI Tools

Besides managing projects and virtual environments, `uv` can also install
[Python-based](/wiki/programming_language/python.md) command-line tools globally.
Each tool is installed into its own isolated environment while remaining available from the command
line.

Install a tool by replacing `<package>` with its name.

```sh
uv tool install <package>
```

Installed tools remain available independently of any project or virtual environment.

Project dependencies, however, should be managed inside the corresponding project using commands
such as the following.

```sh
uv add <package>
uv sync
```

This separation avoids dependency conflicts between globally installed command- line tools and
project-specific Python packages.
