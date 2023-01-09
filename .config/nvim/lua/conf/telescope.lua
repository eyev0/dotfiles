local telescope = require("telescope")
local actions = require("telescope.actions")

local mappings = {
	i = {
		["<Esc>"] = actions.close,
		["<C-c"] = false,
		["<C-/>"] = actions.which_key,
		["<C-x>"] = actions.select_horizontal + actions.center,
		["<C-v>"] = actions.select_vertical + actions.center,
		["<CR>"] = actions.select_default + actions.center,
		["<C-s>"] = actions.toggle_selection,
		-- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		["<C-q>"] = actions.smart_send_to_qflist,
	},
	n = {
		["<C-q>"] = actions.smart_send_to_qflist,
	},
}

require("telescope").setup({
	defaults = {
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "center",
		layout_config = { mirror = true, prompt_position = "top", scroll_speed = 7, height = 0.45, width = 0.6 },
		winblend = 0,
		mappings = mappings,
		path_display = { truncate = 5 },
		hidden = true,
		no_ignore = true,
		follow = true,
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
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("dap")
telescope.load_extension("harpoon")
telescope.load_extension("notify")
-- telescope.load_extension("git_worktree")

vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal wrap]])
