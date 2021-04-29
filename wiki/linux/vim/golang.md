# GoLang in Vim

GoLang is a common programming language.
In this entry we will focus on making vim support Go and use vim as an ide for it.
This guide is based on a guide from [octetz.com](https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/).

## Build, Test, Run, Docs, Debug, Format

To enable most of the basic functions of an IDE you need to install `vim-go` via
`vim plug`.
For this add `Plug 'fatih/vim-go' " better support for golang` in your plug section
in the `init.vim` file.
Then run `:PlugInstall` and `:GoInstallBinaries` inside `nvim`.
Finally add `let g:go_def_mapping_enabled = 0` to your `init.vim` to make sure
the mapping `gd` will be used by `coc` and its language server.

## Autocompletion

### Coc

To enable autocompletion for [coc](coc.md) you need to install `ccls`.
After that you need to add the following lines to your coc config file.

```json
{
   "languageserver": {
        "golang": {
            "command": "gopls",
            "rootPatterns": [
                "go.mod",
                ".vim/",
                ".git/",
                ".hg/"
            ],
            "filetypes": [
                "go"
            ]
        }
   }
}
```
