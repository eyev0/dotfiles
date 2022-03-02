require("preload")
require("globals")
require("options")
require("utils.workspace_config").load({ ".nvim" })
require("plugins")
require("colorscheme")
require("utils.workspace_config").load({ ".dap-config" })
-- hey vscode extension
-- if vim.g.vscode == nil then
require("utils.trim_whitespace")
-- require("utils.inline_gitblame")
-- end
-- keymaps are set in ./after/plugin/keymappings.lua
