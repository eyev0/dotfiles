local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local mappings = {
	i = {
		["<C-/>"] = "which_key",
		["<C-x>"] = actions.select_horizontal + actions.center,
		["<C-v>"] = actions.select_vertical + actions.center,
		["<CR>"] = actions.select_default + actions.center,
		-- ["<C-q>"] = trouble.open_with_trouble,
		-- ["<M-q>"] = trouble.open_selected_with_trouble,
		["<C-s>"] = actions.toggle_selection,
		-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
		-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
	},
	n = {
		["<C-q>"] = trouble.open_with_trouble,
		["<M-q>"] = trouble.open_selected_with_trouble,
	},
}

-- require("telescope").load_extension("projects")
require("telescope").setup({
	defaults = {
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		winblend = 0,
		mappings = mappings,
	},
})

require("telescope").load_extension("fzf")

return {
	project_files = function()
		local opts = { hidden = true } -- define here if you want to define something
		local ok = pcall(require("telescope.builtin").git_files, opts)
		if not ok then
			require("telescope.builtin").find_files(opts)
		end
	end,
}
