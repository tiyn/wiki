# VHDL in Vim

VHDL is a hardware description language.
In this entry we will focus on making vim support VHDL.

## Linting

### Coc

To enable linting and other language server features for [coc](coc.md) you need
to install [hdl-checker](https://github.com/suoto/hdl_checker).
After that you need to add the following lines to your coc config file.

```json
{
    "hdlChecker": {
        "command": "hdl_checker",
        "args": [
            "--lsp"
        ],
        "filetypes": [
            "vhdl",
            "verilog",
            "systemverilog"
        ]
    }
}
```
