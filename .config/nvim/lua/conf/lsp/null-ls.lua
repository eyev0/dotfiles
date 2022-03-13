local null_ls = require("null-ls")

local with_eslint_config = function(should_have_config)
	return function(utils)
		local value = utils.root_has_file({
			".eslintrc",
			".eslintrc.json",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.mjs",
			".eslintrc.ts",
			".eslintrc.yaml",
		})
		if should_have_config then
			return value
		else
			return not value
		end
	end
end

-- register any number of sources simultaneously
local sources = {
  -- formatting
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettierd.with({
		condition = with_eslint_config(false),
	}),
	null_ls.builtins.formatting.eslint_d.with({
		condition = with_eslint_config(true),
	}),
	null_ls.builtins.formatting.xmllint,
	null_ls.builtins.formatting.google_java_format,
	-- null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.black,
	-- diagnostics
	null_ls.builtins.diagnostics.eslint_d.with({
		condition = with_eslint_config(true),
	}),
	null_ls.builtins.diagnostics.checkmake,
	null_ls.builtins.diagnostics.flake8,
	null_ls.builtins.diagnostics.gitlint,
	-- null_ls.builtins.diagnostics.write_good,
	-- null_ls.builtins.diagnostics.editorconfig_checker,
	-- null_ls.builtins.diagnostics.tsc,
	-- code actions
	null_ls.builtins.code_actions.eslint_d.with({
		condition = with_eslint_config(true),
	}),
	-- null_ls.builtins.code_actions.gitsigns,
  -- completion
	-- null_ls.builtins.completion.spell,
}

local defaults = {
	cmd = { "nvim" },
	debounce = 250,
	debug = true,
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
