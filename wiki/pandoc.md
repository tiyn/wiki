# Pandoc

[Pandoc](https://pandoc.org/) is a free-software parser for documents that is able to convert
various document formats between each other. 

## Usage

This section focusses on the usage of Pandoc.

### Converting MS Word to LaTeX

By using the following command a proprietary Microsoft Word document (named `input.docx` in this
example) can be converted to a file in [LaTeX](/wiki/markup_language.md#latex)-Format (in this
example named `output.tex`).

```sh 
pandoc input.docx -o output.tex
```
