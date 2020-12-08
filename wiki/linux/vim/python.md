# Python

Python is a common programming language.
In this entry we will focus on making vim support python and use vim as an ide
for it.

## Autocompletion

### Coc

To enable autocompletion for [coc](coc.md) you need to install the coc-package
`coc-python`. Do that by adding it to the extension section of your `init.vim`.

## Formatting

Install `autopep8` to your system.
Then add `autocmd FileType python setlocal formatprg=autopep8\ -` and
`autocmd FileType python noremap <F8> gggqG` to your
`init.vim` to reformat on F8.

## Line length

To set your python buffers to show column 80 add
`autocmd BufEnter,FileType python set colorcolumn=80` to your `init.vim`.
