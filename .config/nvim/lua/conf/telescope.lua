local telescope = require("telescope")
local actions = require("telescope.actions")
-- local trouble = require("trouble.providers.telescope")

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
		-- ["<C-q>"] = trouble.open_with_trouble,
		-- ["<M-q>"] = trouble.open_selected_with_trouble,
	},
}

require("telescope").setup({
	defaults = {
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		winblend = 0,
		mappings = mappings,
		path = "smart",
		hidden = true,
		-- wrap_results = true,
	},
	extensions = {
		["ui-select"] = {
			-- require("telescope.themes").get_dropdown({}),
			-- require("telescope.themes").get_ivy({}),
			require("telescope.themes").get_cursor({ wrap_results = true }),
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("projects")
telescope.load_extension("dap")
telescope.load_extension("harpoon")
telescope.load_extension("git_worktree")

vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal wrap]])

require("conf.dap.file_picker")

return {
	project_files = function()
		local opts = { hidden = true } -- define here if you want to define something
		local ok = pcall(require("telescope.builtin").git_files, opts)
		if not ok then
			require("telescope.builtin").find_files(opts)
		end
	end,
}
