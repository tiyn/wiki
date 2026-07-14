# uv

[uv](https://docs.astral.sh/uv/) is a fast [Python](/wiki/programming_language/python.md) package,
project and version manager.
It can install and manage Python versions, create virtual environments and manage project
dependencies.

## Setup

Refer to the [official installation guide](https://docs.astral.sh/uv/getting-started/installation/)
to install `uv` on your operating system.

## Usage

This section addresses the usage of uv.

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
