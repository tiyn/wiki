# VIM

[VIM](https://www.vim.org/) is a highly configurable text editor.
There are various forks off it with the most popular being [Neovim](https://neovim.io/).
This entry only addresses VIM but due to the similarities of the forks it still can be drawn on for
them.
Differences of forks to the original VIM will be addressed in specific entries for the forks.

## Setup

The VIM program can be installed from source as described
[on the official website/](https://www.vim.org/download.php).
Alternatively many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package VIM in the `vim` package.

## Usage

This section addresses the usage of VIM.

### Manage Folding

This section is based on a
[guide from Vim From Scratch](https://www.vimfromscratch.com/articles/vim-folding).
VIM can hide chunks of text which is called folding.
The basic usage is as follows.
`zf` marks a piece of text foldable and immediately folds.
`zo` opens up a fold - so it unfolds it - and `zc` closes a fold - so it folds.
