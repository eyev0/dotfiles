local scrolloff = 9
local sidescrolloff = 3

-- options
O = {
	colorscheme = "gruvbox-material",
  background = "dark",
	pallete = "mix", -- mix, material, original
	contrast = "hard", -- soft, medium, hard
	-- colors = vim.g.gruvbox_colors,
	colors = nil,
}

_G.set_scrolloffs = function()
  vim.o.scrolloff = scrolloff
  vim.o.sidescrolloff = sidescrolloff
end

-- utils
U = {}

-- DEBUG_CONFIGS should be something like:
-- { typescript = {{ config1 }, { config2 }, ... }, lua = { { ... }, { ... } }}
DEBUG_CONFIGS = {}
