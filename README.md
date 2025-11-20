# 💥 Projects fzf

[![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=fff)](#)
[![Lua](https://img.shields.io/badge/Lua-%232C2D72.svg?logo=lua&logoColor=white)](#)

Simple [fzf-lua](https://github.com/ibhagwan/fzf-lua.git) project manager for [`neovim`](https://github.com/neovim/neovim/releases).

> [!WARNING]
> This is currently a work in progress, expect things to be broken!

<div align="left">
  <img align="center" src="assets/pic.png">
</div>

## ⚡️ Dependencies

- [`neovim`](https://github.com/neovim/neovim/releases) <small>version >=</small> `0.9.0`
- [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) <small>neovim plug-in</small>
- [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) or [`mini.icons`](https://github.com/echasnovski/mini.icons)
  <small><i><b>(optional)</b></i></small>

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'haaag/projects.nvim',
  dependencies = {
    "ibhagwan/fzf-lua",
    -- optional icons
    "nvim-tree/nvim-web-devicons",
    -- or
    "echasnovski/mini.icons",
  },
  opts = {},
  keys = {
    { '<leader>sp', '<CMD>FzfLuaProjects<CR>', desc = 'search projects' },
  },
  enabled = true,
}
```

<details>
<summary><strong>⚙️ Default configuration</strong></summary>

```lua
require('projects').setup({
  name = 'projects.nvim', -- plugin name
  cmd = 'FzfLuaProjects', -- `user-command` in neovim.
  prompt = 'Projects> ', -- fzf's prompt

  -- enable color output
  color = true,

  -- icons
  icons = {
    enabled = true,
    default = '', -- icon for items without type
    warning = '', -- icon for items not found or with errors
    color = nil, -- default color for items without type (type: default)
  },

  -- file store ($XDG_DATA_HOME/nvim or ~/.local/share/nvim)
  fname = vim.fn.stdpath('data') .. '/projects.json',

  -- keybinds
  keymap = {
    add = 'ctrl-a', -- add project
    edit_path = 'ctrl-e', -- edit project's path
    edit_type = 'ctrl-t', -- edit project's type (lua, cpp, python, etc)
    grep = 'ctrl-g', -- grep inside project
    remove = 'ctrl-x', -- remove project
    rename = 'ctrl-r', -- rename project
    restore = 'ctrl-u', -- undo last action
  },
})
```

</details>
