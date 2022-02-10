local config = {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = {
		enable = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
	},
	context_commentstring = {
		enable = true,
	},
	pairs = {
		enable = false,
		disable = {},
		highlight_pair_events = { "CursorHold" }, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
		highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
		goto_right_end = false, -- whether to go to the end of the right partner or the beginning
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
		keymaps = {
			goto_partner = "<leader>%",
		},
	},
	autotag = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aP"] = "@parameter.outer",
				["iP"] = "@parameter.inner",
				["as"] = "@statement.outer",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["aI"] = "@conditional.outer",
				["iI"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
				-- Or you can define your own textobjects like this
				-- ["iF"] = {
				--   python = "(function_definition) @function",
				-- },
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			goto_next_start = {
				["mf"] = "@function.outer",
				["m]"] = "@class.outer",
				["mc"] = "@call.outer",
				["mb"] = "@block.outer",
				["ms"] = "@statement.outer",
			},
			goto_next_end = {
				["mF"] = "@function.outer",
				["m["] = "@class.outer",
				["mC"] = "@call.outer",
				["mB"] = "@block.outer",
				["mS"] = "@statement.outer",
			},
			goto_previous_start = {
				["Mf"] = "@function.outer",
				["M["] = "@class.outer",
				["Mc"] = "@call.outer",
				["Mb"] = "@block.outer",
				["Ms"] = "@statement.outer",
			},
			goto_previous_end = {
				["MF"] = "@function.outer",
				["M]"] = "@class.outer",
				["MC"] = "@call.outer",
				["MB"] = "@block.outer",
				["MS"] = "@statement.outer",
			},
		},
	},
}

local function disable_treesitter()
	config.highlight = { enable = false }
	require("nvim-treesitter.configs").setup(config)
end

local function disable_rainbow_parens()
	config.rainbow = { enable = false }
	require("nvim-treesitter.configs").setup(config)
end

require("nvim-treesitter.configs").setup(config)

return {
	config = config,
	disable_rainbow_parens = disable_rainbow_parens,
	disable_treesitter = disable_treesitter,
}
