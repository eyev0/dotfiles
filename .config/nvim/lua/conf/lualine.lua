local lsp = vim.lsp
local get_mode = require("lualine.components.mode")

local function is_lsp_attached()
	return next(lsp.buf_get_clients()) ~= nil
end

local function get_diagnostics_count(severity)
	if not is_lsp_attached() then
		return nil
	end

	local count = 0

	for _ in pairs(vim.diagnostic.get(0, { severity = severity })) do
		count = count + 1
	end

	return count
end

local function lsp_attached()
	local count = 0
	for _, _ in pairs(lsp.buf_get_clients()) do
		count = count + 1
	end
	return count > 0 and "  " .. count or ""
end

local function diagnostic_errors()
	local count = get_diagnostics_count(vim.diagnostic.severity.ERROR)
	return count ~= nil and "  " .. count or ""
end

local function diagnostic_warnings()
	local count = get_diagnostics_count(vim.diagnostic.severity.WARN)
	return count ~= nil and "  " .. count or ""
end

local function diagnostic_hints()
	local count = get_diagnostics_count(vim.diagnostic.severity.HINT)
	return count ~= nil and "  " .. count or ""
end

local function diagnostic_info()
	local count = get_diagnostics_count(vim.diagnostic.severity.INFO)
	return count ~= nil and "  " .. count or ""
end

local function position()
	return string.format("%d/%d:%d", vim.fn.line("."), vim.fn.line("$"), vim.fn.col("."))
end
---
--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param ellipsis boolean whether to disable adding '...' at end after truncation
--- @return function function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ""
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (ellipsis and "..." or "")
		end
		return str
	end
end

local function hide(hide_width)
	return trunc(1000, 1000, hide_width)
end

require("lualine").setup({
	options = {
		theme = O.colorscheme,
		extensions = { "nvim-tree", "fugitive", "quickfix" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {
			{
				function()
					if vim.bo.modifiable then
						return get_mode()
					else
						return ""
					end
				end,
				fmt = trunc(90, 4, 30),
			},
		},
		lualine_b = { { "branch", fmt = hide(75) } },
		lualine_c = { { "filename" } },
		lualine_x = {
			{
				function()
					return diagnostic_errors()
						.. diagnostic_warnings()
						.. diagnostic_hints()
						.. diagnostic_info()
						.. lsp_attached()
				end,
				fmt = hide(65),
			},
		},
		lualine_y = {
			{ "filetype", fmt = trunc(100, 1, 40) },
			{ "fileformat", fmt = hide(80) },
			{ "encoding", fmt = hide(85) },
		},
		lualine_z = { { position, fmt = hide(25) } },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
