-- require'globals'

require'globals'
require'options'
require'plugins'
require'colorscheme'

-- hey vscode extension
if (vim.g.vscode == nil) then
  require'utils.trim_whitespace'
  require'utils.inline_gitblame'
  require'utils.local_nvimrc'.load()
end

-- keymaps are sourced in after/plugin/maps.vim
-- require'keymappings'
