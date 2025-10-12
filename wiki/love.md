# LOVE

[LOVE or LÖVE](https://love2d.org) is a [game engine](/wiki/game_engine.md) that can be used
to make 2-dimensional games using the lua programming language.

## Setup

On the [LOVE website](https://love2d.org/wiki/Getting_Started) a guide for
[Windows](/wiki/windows.md), MacOS and [Linux](/wiki/linux.md) can be found.
On most Linux distributions LOVE can usually be installed with the corresponding
[package manager](/wiki/linux/package_manager.md) and the package `love`.

## Usage

This section addresses the usage of LOVE.

### Creating, Running and Packaging Games

On [Linux](/wiki/linux.md) a game directory should be created and the game can be created inside.
A directory has to include a file named `main.lua` at least.

To run the game the following command can be used to run the game.
`<game-directory>` is the path to the game directory.
When inside the directory already, this can just be `.`.

```sh
love <game-directory>
```

For building the game, the game directory has to be compressed first, then compiled and finally the
permissions has to be changed to make the compiled file runnable.
Afterwards the game can be compiled using the following command, where `<game-directory>` is the
path to the game directory and `<game-name>` is the name the compiled file should be called.

```sh
zip -9 -r <game-name>.love <game-directory>
cat /usr/bin/love <game-name>.love > <game-name>
chmod a+x <game-name>
```

Afterwards the compiled file can simply be run using the usual [Shell](/wiki/linux/shell.md)
command.

```sh
./<game-name>
```
