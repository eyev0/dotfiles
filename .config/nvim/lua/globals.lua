local scrolloff = 9
local sidescrolloff = 3

-- options
O = {
	colorscheme = "gruvbox-material",
	pallete = "mix",
	background = "dark",
	contrast = "hard",
	-- colors = vim.g.gruvbox_colors,
	colors = nil,
	set_scrolloffs = function()
		vim.o.scrolloff = scrolloff
		vim.o.sidescrolloff = sidescrolloff
	end,
}

-- utils
U = {}

-- DEBUG_CONFIGS should be something like:
-- { typescript = {{ config1 }, { config2 }, ... }, lua = { { ... }, { ... } }}
DEBUG_CONFIGS = {}
