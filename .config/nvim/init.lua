-- options
O = {
	scrolloff = 9,
	sidescrolloff = 3,
}

vim.o.background = "dark"

-- utils
U = require("utils")
U.clear_reg_marks()

-- DEBUG_CONFIGS should be something like:
-- { typescript = {{ config1 }, { config2 }, ... }, lua = { { ... }, { ... } }}

DEBUG_CONFIGS = {}

-- tmux italics
vim.cmd([[let &t_ZH="\e[3m"]])
vim.cmd([[let &t_ZR="\e[23m"]])

-- gui stuff
vim.cmd([[au UIEnter * let g:has_gui=1]])
vim.cmd([[
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guifont=Source\ Code\ Pro\ Medium:h13
]])

-- disable highlighting matching parens
vim.g.loaded_matchparen = 1

-- set options
require("options")

-- init lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
local opts = {
	defaults = { lazy = false },
}

-- plugins
require("lazy").setup(require("plugins"), opts)

-- persistence command to load session
vim.cmd([[command! SessionLoad lua require("persisted").load()]])
-- vim.cmd([[command! SessionLoad lua require("persistence").load()]])

-- keymaps are set in ./after/plugin/keymappings.lua
