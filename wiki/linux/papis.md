# Papis

[Papis](/wiki/linux/papis.md) is a [command-line based](/wiki/linux/shell.md) for
[Linux](/wiki/linux.md) [bibliography manager](/wiki/bibliographic_software.md) that can be used
for LaTeX using the BibTeX format.

## Setup

Papis can be installed on most [Linux](/wiki/linux.md) distributions by acquiring the `papis`
package.
On some distributions there may be problems installing this from the official repository.
Another option to install papis is to use [pip](/wiki/programming_languages/python.md).
Alternatively it can be downloaded from [the GitHub page](https://github.com/papis/papis).

### Configuration

To use Papis a config file needs to be created.
The path of the global config file is `~/.config/papis/config`.
A minimal config can look like the following.
Make sure to change the path of the papers directory.

```txt
[papers]
dir = ~/cloud/bibliography/papis

[settings]
default-library = papers
```

## Usage

The following section describes various ways of usage of Papis.

### Adding, Removing, Editing and Browsing Entries

An entry can be added by running a command similar to the following.
The values for the different keys needs to be changed, added or omitted accordingly.

```sh
papis add ~/Documents/interesting.pdf \
    --folder-name interesting-paper-2021 \
    --set author 'John Smith' \
    --set title 'The interesting life of bees' \
    --set year 1985 \
    --set tags 'biology interesting bees'
```

Papis can also add sources directly via their DOI code.

```sh
papis add --from doi 10.10763/1.3237134
```

For the most well known journals are also recognized by Papis

```sh
papis add https://arxiv.org/abs/1712.03134
```

To remove an entry the following command can be run.
Afterwards the entry that should be removed can be easily selected via the terminal user interface.

```sh
papis rm
```

Entries can be edited by using the following command.

```sh
papis edit
```

Entries can be browsed and viewed either in the terminal or via a local website.
For the first run the following command.

```sh
papis browse
```

For the latter the following command can be run to start the server.
The command-line output will show the address to reach the service.

```sh
papis serve
```

### Create a BibTeX file

A BibTeX file containing all the entries of all the libraries can be created by running the
following command.
For this the command will create a file called `lib.bib`.

```sh
papis export --all --format bibtex --out lib.bib
```

### Clearing the Cache

The cache of Papis can be cleared by running the following command.

```sh
papis --cc
```

### Import Entries from a BibTeX File

This section will discuss the way to add the contents of a BibTeX file to the database.
First the BibTeX file (in this case called `mylib.bib`) will be used to create a new database
inside the folder `tmp-db`.

```sh
papis bibtex read mylib.bib import -a -o tmp-db
```

Afterwards the contents of the temporary database should be checked to be correctly imported.

```sh
papis -l tmp-db edit
```

Afterwards the contents of the temporary library should be moved to the actualy directory where
papis stores its entries.
The path for that can be found in the [config file](#configuration).

```sh
mv tmp-db/* /path/to/your/library/folder/
```

Finally the cache needs to be cleared for Papis to display the new entries correctly.

```sh
papis --cc
```

Finally the cache needs to be [cleared](#clearing-the-cache) for Papis to display the new entries
correctly.
