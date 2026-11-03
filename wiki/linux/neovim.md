# Neovim

[Neovim](https://neovim.io/) is a fork of [VIM](/wiki/linux/vim.md) with support for Lua-based
configuration and plugins.

## Setup

Neovim is available from many [Linux](/wiki/linux.md)
[package managers](/wiki/linux/package_manager.md) as `neovim`.

### ogpt.nvim

[ogpt.nvim](https://github.com/huynle/ogpt.nvim) is a plugin for integrating language models
into Neovim.
It can be used with a locally running [Ollama](/wiki/ollama.md) server.
For this Ollama has to be [set up](/wiki/ollama.md#setup) and a model such as `deepseek-r1:7b`
needs to be [downloaded](/wiki/ollama.md#usage).
Additionally, `curl` has to be installed.

When using the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager, the following
minimal configuration can be used as `~/.config/nvim/lua/plugins/ogpt.lua` if the plugin
specifications from that directory are loaded.

```lua
return {
  "huynle/ogpt.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>ao", "<cmd>OGPT<CR>", desc = "OGPT: Open chat" },
  },
  opts = {
    default_provider = "ollama",
    providers = {
      ollama = {
        api_host = "http://localhost:11434",
        api_key = "",
        model = "deepseek-r1:7b",
      },
    },
  },
}
```

Afterward the chat can be opened with `<leader>ao` or `:OGPT`.
