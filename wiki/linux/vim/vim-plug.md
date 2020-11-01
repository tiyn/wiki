# Vim-Plug

[Vim-Plug](https://github.com/junegunn/vim-plug) is a minimalist plugin manager.

## Installation

You can add the following lines to your vim config file to make sure vim-plug is
installed with the correct folder-structure.

```vimscript
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif
```

Below is an example plugin section.

```vimscript
call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'uiiaoo/java-syntax.vim' , {'for': 'java'}
call plug#end()
```

## Important commands

- `:PlugInstall` - install plugins specified in the Plug section
- `:PlugClean` - remove plugins that are not specified in the Plug section

For both of these command remember to write the file and reload the buffer if
you just added a new plugin or removed one.
