---@class projects.Icons
---@field default string: default icon
---@field warning string: default warning icon if project does not exist
---@field color string?: default icon color
---@field enabled boolean: enable icons

---@class projects.Keymaps
---@field add string: add project
---@field edit_path string: edit project path
---@field edit_type string: edit project type
---@field grep string: grep in project path
---@field remove string: remove project
---@field rename string: rename project
---@field restore string: restore state

---@class projects.FzfOpts
---@field header? string: fzf header
---@field actions? projects.Action[]: fzf actions
---@field fzf_opts? table: fzf options

---@class (exact) projects.opts
---@field name? string: plugin name
---@field cmd? string: `user-command` in neovim.
---@field prompt? string: fzf's prompt
---@field fname? string: file store ($XDG_DATA_HOME/nvim or ~/.local/share/nvim)
---@field color? boolean: enable color output
---@field icons? projects.Icons: projects icons
---@field keymap? projects.Keymaps: fzf's keybinds
---@field fzf? projects.FzfOpts: fzf's options
return {
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
}
