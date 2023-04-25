-- disable highlighting matching parens
vim.g.loaded_matchparen = 1
vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = 0

pcall(vim.keymap.del, "", "<Space>")
vim.keymap.set("", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

---@alias ColorschemeOption "gruvbox-material" | "catppuccin"

--- options
---@class Options
---@field scrolloff number
---@field sidescrolloff number
---@field colorscheme ColorschemeOption
O = {
  scrolloff = 9,
  sidescrolloff = 3,
  signcolumn = "yes:2",
  colorscheme = "catppuccin",
  lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
  pluginspath = vim.fn.stdpath("data") .. "/lazy",
  devpath = vim.env.HOME .. "/dev/nvim/plugins",
  copilot = true, -- TODO: create coroutine that fetches "curl -s ipinfo.io | jq '.country'" and store it, than await it and turn Copilot on
}

ENV = {
  PYTHON_MODULE = "app",
}

vim.o.background = "dark"

_G.autocmd = vim.api.nvim_create_autocmd
_G.augroup = vim.api.nvim_create_augroup
_G.feedkeys = function(keys, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), mode, false)
end
_G.pprint = function(...)
  print(vim.inspect(...))
end

-- utils
U = require("rc.utils")

-- DEBUG_CONFIGS should have following structure:
-- { typescript = {{ config1 }, { config2 }, ... }, lua = { { ... }, { ... } }}
DEBUG_CONFIGS = {}

-- set options
require("rc.options")

-- plugins
-- init lazy
if not vim.loop.fs_stat(O.lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    O.lazypath,
  })
end
vim.opt.rtp:prepend(O.lazypath)
local opts = {
  defaults = { lazy = false },
  install = { missing = true },
  dev = {
    path = O.devpath,
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        -- "tarPlugin",
        "tohtml",
        "tutor",
        -- "zipPlugin",
      },
    },
  },
}

local plugins = MY_CONFIG_DEBUG ~= nil and require("rc.plugins.debug") or require("rc.plugins")
require("lazy").setup(plugins, opts)

-- command to load session
-- vim.cmd([[command! SessionLoad lua require("persisted").load()]])
vim.cmd([[command! SessionLoad lua require("persistence").load()]])

U.clear_reg_marks()
-- keymaps are set in ./after/plugin/keymappings.lua
