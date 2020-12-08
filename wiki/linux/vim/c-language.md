# C

C is a common programming language.
In this entry we will focus on making vim support c and use vim as an ide for c.

## Autocompletion

### Coc

To enable autocompletion for [coc](coc.md) you need to install `ccls`.
After that you need to add the following lines to your coc config file.

```json
{
   "languageserver": {
       "ccls": {
           "command": "ccls",
           "filetypes": [
               "c",
               "cpp",
               "objc",
               "objcpp"
           ],
           "rootPatterns": [
               ".ccls",
               "compile_commands.json",
               ".vim/",
               ".git/",
               ".hg/"
           ],
           "initializationOptions": {
               "cache": {
                   "diretory": "/tmp/ccls"
               }
           }
       }
   }
}
```
