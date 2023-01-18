vim.cmd([[runtime! ftdetect/*.vim]])
vim.cmd([[runtime! ftdetect/*.lua]])
local surround = require("nvim-surround")
local surround_config = require("nvim-surround.config")

require("filetype").setup({
	overrides = {
		-- extensions = {
		-- 	c = "c",
		-- },
		function_extensions = {
			lua = function()
				vim.bo.filetype = "lua"
				surround.buffer_setup({
					surrounds = {
						-- f = vim.tbl_deep_extend("force", surround_config.default_opts.surrounds["f"], {
						-- 	delete = "^(.-%()().-(%))()$",
						-- }),
						F = {
							add = { { "function() " }, { " end" } },
							find = function()
								return surround_config.get_selection({ motion = "af" })
							end,
							-- TODO: delete (and change?) patterns
							-- delete = "^([^=%s]+%()().-(%))()$",
						},
					},
				})
			end,
		},
		function_literal = {
			[".dap-config"] = function()
				vim.bo.filetype = "lua"
			end,
			[".nvim"] = function()
				vim.bo.filetype = "lua"
			end,
		},
		function_complex = {
			[".*vscode/launch.json"] = function()
				vim.bo.filetype = "jsonc"
			end,
		},
	},
})
