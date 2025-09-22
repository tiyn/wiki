# Ghostscript

[Ghostscript](https://ghostscript.com) is a program used to convert, compress and render different
formats like PDF, PostScript and more.

## Setup

The Ghostscript program can be installed on most [Linux](/wiki/linux.md) distributions and
[package managers](/wiki/linux/package_manager.md) via a package called `ghostscript`.

## Usage

This section addresses the usage of Ghostscript.

### Compressing a PDF File

A PDF file can be compressed using Ghostscript by running the following command.
`<input-file>` and `<output-file>` are the paths to the input and output PDF files.

```sh
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=<output-file> <input-file>
```
