# Nim

[Nim](https://nim-lang.org) is a statically typed compiled systems programming
language.

## Setup

You can install nim using choosenim with
`curl https://nim-lang.org/choosenim/init.sh -sSf | sh`.
If you're on an arch-based machine you can also run `yay -S choosenim` (install `yay` if necessary).

## Usage

This section addresses the usage of Nim.

### Use Python Packages

[Python modules](/wiki/programming_language/python.md#modules) can easily be used in Nim using the
module [nimpy](#nimpy).

## Modules

There are various modules for Nim.
As package manager `nimble` is used most of the time.

This section addresses various different modules.

### Arraymancer

[Arraymancer](https://github.com/mratsim/Arraymancer) is a tensor library for Nim which can be used
to run deep learning on CPUs, GPUs and embedded devices.

### nimpy

[nimpy](https://github.com/yglukhov/nimpy) is a [Python](/wiki/programming_language/python.md)
bridge for the Nim programming languages.
With it [Python modules](/wiki/programming_language/python.md#modules) can be used easily inside
Nim.

### SciNim

[SciNim](https://github.com/SciNim) is a collection of modules more than a single one.
It features various tools for scientific purposes from curve fitting to data visualization.

An overview of it can be achieved on the
[getting-started repository](https://github.com/SciNim/getting-started/blob/main/book/overview/index.md).
