local nvim_lsp = require("lspconfig")
local ts_utils = require("nvim-lsp-ts-utils")

nvim_lsp.tsserver.setup({
	-- Needed for inlayHints. Merge this table with your settings or copy
	-- it from the source if you want to add your own init_options.
	init_options = ts_utils.init_options,
	--
	on_attach = function(client, bufnr)
		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		-- defaults
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,

			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,
			-- if false will avoid organizing imports
			always_organize_imports = true,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},

			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = "Comment",
			inlay_hints_priority = 1, -- priority of the hint extmarks
			inlay_hints_throttle = 150, -- throttle the inlay hint request
			inlay_hints_format = { -- format options for individual hint kind
				-- Type = {},
				Parameter = {
					highlight = "Comment",
					text = function(text)
						return ""
					end,
				},
				Enum = {},
				-- Example format customization for `Type` kind:
				Type = {
					highlight = "Comment",
					text = function(text)
						return ":" .. text:sub(3)
					end,
				},
			},

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		})

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", { silent = true })

		-- call regular on_attach
		_G.lsp_on_attach(client, bufnr)
	end,
	capabilities = _G.lsp_capabilities,
})
