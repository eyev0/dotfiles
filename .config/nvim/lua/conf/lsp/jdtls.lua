local setup = require("jdtls.setup")
local jdtls = require("jdtls")
local u = require("utils")
local dap = require("dap")
local root_markers = { "build.gradle", "gradle.build", "pom.xml" }
local root_dir = setup.find_root(root_markers)
local home = vim.fn.expand("$HOME")
local workspace_folder = home .. "/.local/share/eclipse.jdt.ls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local initialized = false

local config = {
	cmd = { "java-lsp.sh", workspace_folder },
	filetypes = { "java" },
	flags = {
		allow_incremental_sync = true,
	},
	on_attach = function(client, bufnr)
		jdtls.setup_dap()
		-- u.tprint(require("dap").adapters)
		if not initialized then
			local java_adapter = dap.adapters.java
			dap.adapters.java = function(callback, config)
				if config.preLaunchTask then
					vim.cmd("!" .. config.preLaunchTask)
				end
				return java_adapter(callback, config)
			end
      initialized = true
		end
		setup.add_commands()

		client.resolved_capabilities.document_formatting = false
		_G.lsp_on_attach(client, bufnr)

		local function buf_map(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		buf_map("n", "<M-m>", "<Cmd>lua pcall(require('jdtls').code_action())<CR>", { noremap = true, silent = true })
		buf_map("v", "<M-m>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>", { noremap = true, silent = true })
		buf_map(
			"v",
			"<leader>lao",
			"<Cmd>lua require('jdtls').organize_imports()<CR>",
			{ noremap = true, silent = true }
		)
		buf_map("n", "<F10>", "<Cmd>lua require('jdtls').organize_imports()<CR>", { noremap = true, silent = true })
		buf_map(
			"n",
			"<leader>laf",
			"<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>",
			{ noremap = true, silent = true }
		)
		buf_map("n", "<leader>laev", "<Cmd>lua require('jdtls').extract_variable()<CR>", { noremap = true, silent = true })
		buf_map(
			"v",
			"<leader>laev",
			"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
			{ noremap = true, silent = true }
		)
		buf_map("n", "<leader>laec", "<Cmd>lua require('jdtls').extract_constant()<CR>", { noremap = true, silent = true })
		buf_map(
			"v",
			"<leader>laem",
			"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
			{ noremap = true, silent = true }
		)
	end,
	capabilities = _G.lsp_capabilities,
	init_options = {
		extendedClientCapabilities = extendedClientCapabilities,
	},
	settings = {
		java = {
			signatureHelp = { enabled = true },
			-- contentProvider = { preferred = "fernflower" },
			-- completion = {
			-- 	favoriteStaticMembers = {
			-- 		"org.hamcrest.MatcherAssert.assertThat",
			-- 		"org.hamcrest.Matchers.*",
			-- 		"org.hamcrest.CoreMatchers.*",
			-- 		"org.junit.jupiter.api.Assertions.*",
			-- 		"java.util.Objects.requireNonNull",
			-- 		"java.util.Objects.requireNonNullElse",
			-- 		"org.mockito.Mockito.*",
			-- 	},
			-- },
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
			},
		},
	},
}

config.on_init = function(client, _)
	client.notify("workspace/didChangeConfiguration", { settings = config.settings })
end

local bundles = {
	vim.fn.glob(
		home .. "/dev/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
	),
}

-- TODO: java debug tests - later
-- vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/git/clones/vscode-java-test/server/*.jar"), "\n"))
config.init_options = {
	extendedClientCapabilities = extendedClientCapabilities,
	bundles = bundles,
}

return {
	setup = function()
		require("jdtls").start_or_attach(config)
	end,
}
