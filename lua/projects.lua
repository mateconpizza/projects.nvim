---@brief [[
---
---     ┏━┓┏━┓┏━┓ ┏┓┏━╸┏━╸╺┳╸┏━┓ ┏┓╻╻ ╻╻┏┳┓
---     ┣━┛┣┳┛┃ ┃  ┃┣╸ ┃   ┃ ┗━┓ ┃┗┫┃┏┛┃┃┃┃
---     ╹  ╹┗╸┗━┛┗━┛┗━╸┗━╸ ╹ ┗━┛╹╹ ╹┗┛ ╹╹ ╹
---
---     - keep your fun projects close by -
---
---@brief ]]

---@class projects.Project
---@field name string: project name
---@field path string: project path
---@field fmt string?: fzf's string format
---@field last_visit integer?: last visit
---@field exists boolean?: project exists
---@field type string: project type
---@field icon string?: project icon

---@module 'projects'
local M = {}

M.config = require('projects.config')

---@param opts? projects.opts
M.setup = function(opts)
  -- FIX: use vim.validate
  -- vim.validate('opts', opts, 'table', true)
  vim.api.nvim_create_user_command(M.config.cmd, function()
    opts = vim.tbl_deep_extend('keep', opts or {}, M.config)

    -- setup logger name
    require('projects.util').setup(opts)

    -- setup icons support
    if opts.icons.enabled then
      local ok, icons = pcall(require, 'projects.icons')
      if not ok then
        return
      end
      icons.setup(opts.icons)
    end

    require('projects.store').setup(opts)
    require('projects.actions').setup(opts)
  end, {})
end

return M
