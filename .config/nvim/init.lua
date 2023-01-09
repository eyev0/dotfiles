require("preload")
require("globals")
require("options")
require("utils.workspace_config").load({ ".nvim" })
require("init_lazy")
require("colorscheme")
-- require("utils.workspace_config").load({ ".dap-config" })
-- keymaps are set in ./after/plugin/keymappings.lua
