# Nim

[Nim](https://nim-lang.org) is a statically typed compiled systems programming

## Autocompletion

### Coc

To enable autocompletion for coc you need to install `nimlsp`
(`nimble install nimlsp`).
After that you need to add the following lines to your coc config file.

```json
{
    "languageserver": {
        "nim": {
            "command": "nimlsp",
            "filetypes": ["nim"],
            "trace.server": "verbose"
        }
   }
}
```

### Highlighting

To enable highlighting you can install a
[nvim plugin by alaviss](https://github.com/alaviss/nim.nvim).
