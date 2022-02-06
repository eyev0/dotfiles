local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.diagnostics.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file({ ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.yaml" })
		end,
	}),
	-- null_ls.builtins.diagnostics.editorconfig_checker,
	null_ls.builtins.completion.spell,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
}

local defaults = {
	cmd = { "nvim" },
	debounce = 250,
	debug = false,
	default_timeout = 5000,
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log = {
		enable = true,
		level = "warn",
		use_console = "async",
	},
	on_attach = nil,
	on_init = nil,
	on_exit = nil,
	-- root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git", ".nvimrc.lua"),
	update_in_insert = false,
	sources = sources,
}

null_ls.setup(defaults)
