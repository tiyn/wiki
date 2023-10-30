# 7-zip

[7-zip](https://7-zip.org/) is a free and open-source file archiver.
It places files or directories in an archive and is able to compress them.

## Setup

7-zip can be installed by installing the packages `p7zip-full` and `p7zip-rar` on Ubuntu systems.
On [Arch Linux](/wiki/linux/arch-linux.md) it can be installed with the package `7-zip`
from the [AUR](/wiki/linux/package_manager.md#arch-linux-pacman-and-yay).

## Usage

### Compressing and Uncompressing a Directory

For directories to be compressed the Lempel–Ziv–Markov chain algorithm is recommended.
It is fast with good compression results.

As explained by
[kenorb on superuser.com](https://superuser.com/questions/281573/what-are-the-best-options-to-use-when-compressing-files-using-7-zip)
An effective way to compress a directory is the following command where `directory` is the directory
that is to be compressed.
The archive will be created by the same name as the directory but with the `.7z` extension.
This command uses [expansion](/wiki/linux/shell.md#expansion).
The directory is not deleted automatically afterwards.

```sh
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on directory{.7z,}
```

To uncompress it run the following command.

```sh
7z x directory.7z
```

### Peek Contents of an Archive

To list the content files of a 7-zip archive the following command can be used.
The name of the archive is assumed to be `directory.7z`.

```sh
7z l directory.7z
```

### Remove a File from an Existing Archive

To remove a file with the assumed name `file.ext` from an archive called `directory.7z` run the
following command as explained by
[user3409415 on stack overflow](https://stackoverflow.com/questions/22344587/how-to-delete-a-file-from-multiple-zip-archives-using-7-zip).

```sh
7z d -r directory.7z file.ext
```
