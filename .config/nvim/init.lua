-- require'globals'

require("globals")
require("options")
require("plugins")
-- require'colorscheme'
require("utils.local_nvimrc").load()

-- hey vscode extension
if vim.g.vscode == nil then
	require("utils.trim_whitespace")
	-- require("utils.inline_gitblame")
end
-- keymaps are set in ./after/plugin/keymappings.lua
-- require'keymappings'
