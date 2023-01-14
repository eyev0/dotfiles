-- local u = require("utils")
Lsp = {}

Lsp.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- vim.api.nvim_command("setlocal signcolumn=yes:1")
	Keymap.set_lsp_buf_shortcuts(client, bufnr)
	-- require("conf.lspsignature").on_attach()
	require("illuminate").on_attach(client)
end
-- LSP Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
-- for cmp.nvim
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
Lsp.capabilities = capabilities

-- hover window with borders
-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

-- virtual text diagnostics
-- use the same configuration you would use for `vim.lsp.diagnostic.on_publish_diagnostics`.
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- 	-- require("lsp_extensions.workspace.diagnostic").handler,
-- 	vim.lsp.diagnostic.on_publish_diagnostics,
-- 	{
-- 		virtual_text = {
-- 			source = "if_many",
-- 			severity = { min = vim.diagnostic.severity.WARN },
-- 		},
-- 		update_in_insert = false,
-- 		severity_sort = true,
-- 		underline = true,
-- 		-- signs = {
-- 		-- 	priority = 2,
-- 		-- },
-- 	}
-- )

local diag_float_winid = nil
local diag_float_bufnr = nil
local function open_diag_float()
	diag_float_bufnr, diag_float_winid = vim.diagnostic.open_float({
		bufnr = 0,
		scope = "cursor",
		severity_sort = true,
		-- source = "if_many",
		source = true,
		focusable = false,
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
			"BufLeave",
			"InsertEnter",
			"InsertLeave",
			"TextYankPost",
			"CmdlineChanged",
			"CmdlineEnter",
			"CmdlineLeave",
			"BufModifiedSet",
		},
	})
end

local diagnostic_aug_id = nil
local function toggle_diagnostic_float_aug(flag)
	if flag then
		diagnostic_aug_id = vim.api.nvim_create_augroup("DiagnosticFloatPreview", { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			group = diagnostic_aug_id,
			callback = open_diag_float,
		})
	else
		if diagnostic_aug_id ~= nil then
			vim.api.nvim_del_augroup_by_id(diagnostic_aug_id)
		end
	end
end

local diagnostic_float_active = false
Lsp.toggle_diagnostic_float = function()
	diagnostic_float_active = not diagnostic_float_active
	if not diagnostic_float_active and diag_float_winid ~= nil then
		vim.api.nvim_win_close(diag_float_winid, false)
	end
	toggle_diagnostic_float_aug(diagnostic_float_active)
end

local diagnostics_virt_lines_switch = false
Lsp.toggle_diagnostic_virt_lines = function()
	if diagnostics_virt_lines_switch then
		vim.diagnostic.config({ virtual_lines = false })
	else
		vim.diagnostic.config({ virtual_lines = true })
	end
	diagnostics_virt_lines_switch = not diagnostics_virt_lines_switch
end

-- disable updating diagnostics in insert
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	virtual_lines = false,
	virtual_text = false,
})

require("conf.neoconf")

require("conf.neodev")

require("conf.lsp.vuels")
-- require("conf.lsp.eslint")
require("conf.lsp.tsserver")
-- require("conf.lsp.volar")
require("conf.lsp.sumneko")
-- require("conf.lsp.rust_analyzer")
require("conf.lsp.rls")
require("conf.lsp.solidity")
require("conf.lsp.pyright")
require("conf.lsp.jsonls")
require("conf.lsp.bashls")
require("conf.lsp.yamlls")
require("conf.lsp.dockerls")
require("conf.lsp.html")
require("conf.lsp.clangd")
require("conf.lsp.gopls")
require("conf.lsp.graphql")

vim.cmd([[command! JdtlsStartOrAttach lua require("conf.lsp.jdtls").setup()]])
vim.cmd([[
augroup JdtlsInit
    autocmd!
    autocmd FileType java JdtlsStartOrAttach
augroup end
]])

local M = {}

---@class LspClient
---@field id number

---@class RenameBufferClients
---@field current_rename_bufnr? number
---@field clients table<number, LspClient>
M.buffer_clients = { clients = {}, current_rename_bufnr = nil }

return M
