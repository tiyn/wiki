# fdupes

[fdupes](https://github.com/adrianlopezroche/fdupes) is a command-line utility
for identifying and deleting duplicate files residing within one or more
specified directories.

## Setup

The fdupes program can be installed by going to the
[GitHub page of it](https://github.com/adrianlopezroche/fdupes/releases).
Alternatively many linux package managers package fdupes in the `fdupes`
package.

## Usage

Running `fdupes <path to directory>` find the duplicates inside the given
directory.
Using the `-r` flag the program will search in the subdirectories aswell.
`-d` signals to delete the duplicates and will force a dialogue to select which
version of the file to keep.
This dialogue can be skipped by using `-N` which will select the first file of
a set of multiple duplicates.

A complete and automatic removal of all duplicates within a directory and its
subdirectories works with the following command:
`fdupes -rNd <path to directory>`.
