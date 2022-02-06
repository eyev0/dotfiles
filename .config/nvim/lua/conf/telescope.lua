local actions = require('telescope.actions')
-- local trouble = require('trouble.providers.telescope')

local mappings = {
  i = {
    ["<C-x>"] = actions.select_horizontal + actions.center,
    ["<C-v>"] = actions.select_vertical + actions.center,
    ["<CR>"] = actions.select_default + actions.center,
    -- ["<C-w>"] = trouble.open_with_trouble,
  },
  n = {
    -- ["<C-w>"] = trouble.open_with_trouble,
  }
}


-- require('telescope').load_extension('projects')

require('telescope').setup{
  defaults = {
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    winblend = 0,
    mappings = mappings,
  }
}

return {
  project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
  end
}
