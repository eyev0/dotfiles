local setup = require("jdtls.setup")
local jdtls = require("jdtls")
-- local u = require("utils")
local dap = require("dap")
local root_markers = { "build.gradle", "gradle.build", "pom.xml" }
local root_dir = setup.find_root(root_markers)
local home = vim.fn.expand("$HOME")
local workspace_folder = home .. "/.local/share/eclipse.jdt.ls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

vim.cmd("command! JdtlsClearWorkspaceFolder !rm -r " .. workspace_folder)

jdtls.jol_path = home .. "/bin/jol-cli-latest.jar"

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

		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		Lsp.on_attach(client, bufnr)

		local function map(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = bufnr
			return vim.keymap.set(mode, lhs, rhs, opts)
		end
		map(
			"n",
			"<leader>lao",
			"<Cmd>lua require('jdtls').organize_imports()<CR>",
			{ noremap = true, silent = true, desc = "Organize imports" }
		)
		map("n", "<leader>laev", function()
			require("jdtls").extract_variable()
		end, { noremap = true, silent = true, desc = "jdtls: extract_variable" })
		map("v", "<leader>laec", function()
			vim.api.nvim_input("<Esc>")
			require("jdtls").extract_constant(true)
		end, { noremap = true, silent = true, desc = "jdtls: extract_constant" })
		map(
			"v",
			"<leader>laem",
			"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
			{ noremap = true, silent = true, desc = "jdtls: extract_method" }
		)
		map("n", "<leader>ljb", "<Cmd>lua require('jdtls').compile('full')<CR>", { noremap = true, silent = true })
		map(
			"n",
			"<leader>ljuc",
			"<Cmd>lua require('jdtls').update_project_config()<CR>",
			{ noremap = true, silent = true, desc = "jdtls: update_project_config" }
		)
		map("n", "<leader>ljcw", function()
			vim.cmd("JdtlsClearWorkspaceFolder")
			vim.cmd("!rm -rf .settings .project .classpath .gradle gradlew gradlew.bat bin/")
		end, { noremap = true, silent = true, desc = "Clear workspace and build files" })
		map("n", "<leader>ljr", "<Cmd>JdtRestart<CR>", { noremap = true, silent = true, desc = "Restart jdtls" })
	end,
	capabilities = Lsp.capabilities,
	init_options = {
		extendedClientCapabilities = extendedClientCapabilities,
	},
	settings = {
		java = {
			signatureHelp = { enabled = true },
			-- contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					-- "org.hamcrest.MatcherAssert.assertThat",
					-- "org.hamcrest.Matchers.*",
					-- "org.hamcrest.CoreMatchers.*",
					-- "org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					-- "org.mockito.Mockito.*",
				},
			},
			project = {
				referencedLibraries = {
					"/home/yev/dev/sbl/core/java/build/libs/java-5.0.cc0fac44.jar",
				},
			},
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

-- TODO: java debug tests
-- vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/git/clones/vscode-java-test/server/*.jar"), "\n"))
config.init_options = {
	extendedClientCapabilities = extendedClientCapabilities,
	bundles = bundles,
}

return {
	setup = function()
		-- print("setup jdtls")
		require("jdtls").start_or_attach(config)
	end,
}
