# pdftk

[pdftk](https://gitlab.com/pdftk-java/pdftk) is a port of
[the original PDFtk](https://www.pdflabs.com/tools/pdftk-server/) which is a
[command-line](/wiki/linux/shell.md) tool for scripting or processing PDFs.

## Setup

The pdftk program can be installed from source as described
[on GitLab](https://gitlab.com/pdftk-java/pdftk).
Alternatively many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package pdftk in the `pdftk`.

## Usage

This section addresses the usage of pdftk.

### Ommit pages at the Start or End of a PDF

pdftk can be used to ommit pages at the start or end of a pdf.
This is done by the following command.
`<input-file>` is the input file while `<output-file>` is the path the newly generated file is
saved to.
`<start>` is the first page to include in the output PDF document while `<end>` is the last one.

```sh 
pdftk <input-file> cat <start>-<end> output <output-file>
```

The following command saves the content of the input file `skript.pdf` from the second to the last
page to the output file `skript-new.pdf`.

```sh 
pdftk skript.pdf cat 2-end output skript-new.pdf
```

