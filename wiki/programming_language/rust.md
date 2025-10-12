# Rust

[Rust](https://www.rust-lang.org/) is a multiparadigm compiled systems programming language.

## Setup

Rust can be setup as explained on the [Rust website](https://rust-lang.org/tools/install/).
It is always recommended to install Rust via rustup.
Alternatively many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md)
package rustup in the `rustup` package.

## Usage

This section addresses the usage of Rust.

### Create a New Project

To create a new project use the command `cargo`.
The following is an example in which `<project-name>` is a placeholder for the projects name.
It will create a new directory called the same as the given project name.

```sh
cargo new <project-name>
```

If a project parent directory is already present the following command can be used which will turn
the parent directory in the root directory for a project.

```sh
cargo init
```

### Running Programs and Projects

When inside a project the main file can simply be run by using the following command.
This command can be called from anywhere within the project folder structure.

```sh
cargo run
```

If no project was initialized and just a Rust file is present run a command simliar to the
following, where `<rust-file>` is the name of the Rust file without the `.rs`-extension.

```sh
rustc <rust-file>.rs
./<rust-file>
```

### Managing Packages and Libraries

To use external libraries or packages `cargo` project has to be present since it is used to manage
them.
Using the following command a package can be downloaded and added to the dependencies for the 
project.
`<package-name>` is a placeholder for the name of the package (for example `z3` for the theorem
prover).

```sh
cargo add <package-name>
```
