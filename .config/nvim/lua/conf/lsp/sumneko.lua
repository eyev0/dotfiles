local lsputil = require("lspconfig.util")

local sumneko_root_path = vim.fn.expand("$HOME") .. "/.local/lsp/lua"
local sumneko_binary_path = sumneko_root_path .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local config = {
	cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				-- Setup your lua path
				-- path = vim.split(package.path, ";"),
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.expand("$HOME/.config/nvim")] = true,
				},
				-- Make the server aware of Neovim runtime files
				-- library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	root_dir = lsputil.root_pattern(".git", ".nvim"),
	on_attach = _G.lsp_on_attach,
	capabilities = _G.lsp_capabilities,
}

require("lspconfig").sumneko_lua.setup(config)
