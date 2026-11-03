# Zathura

[Zathura](https://pwmt.org/projects/zathura/) is a lightweight document viewer with
[VIM](/wiki/linux/vim.md)-like keybindings.

## Setup

Zathura can be installed using many [Linux](/wiki/linux.md)
[package managers](/wiki/linux/package_manager.md).
For PDF support a suitable backend such as `zathura-pdf-mupdf` may also be needed.

## Usage

This section addresses the usage of Zathura.

### Best Fit

Press `a` to adjust the document to the best-fit zoom level.
For documents with varying page sizes, best-fit may not use the size of the currently viewed page.
Further information about this behavior can be found in the
[Best Fit discussion](https://unix.stackexchange.com/questions/468875/zathuras-best-fit-command-a-for-documents-with-varying-page-size).
Alternatively `s` can be used to fit the document to the window width.

### Toggle Status Bar

The status bar can be enabled and disabled by pressing `Ctrl+n`.
