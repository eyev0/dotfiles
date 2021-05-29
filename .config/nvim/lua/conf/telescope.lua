local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

local mappings = {
  i = {
    ["<C-x>"] = actions.select_horizontal + actions.center,
    ["<C-v>"] = actions.select_vertical + actions.center,
    ["<CR>"] = actions.select_default + actions.center,
    ["<C-w>"] = trouble.open_with_trouble,
  },
  n = {
    ["<C-w>"] = trouble.open_with_trouble,
  }
}

require('telescope').setup{
  defaults = {
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    mappings = mappings,
  }
}
