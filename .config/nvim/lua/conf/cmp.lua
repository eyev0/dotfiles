-- Setup nvim-cmp.
local cmp = require("cmp")
local compare = require("cmp.config.compare")
-- local default_config = require("cmp.config.default")
local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")

---@diagnostic disable-next-line: unused-local, unused-function
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local next_item = cmp.mapping(function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif vim.fn["vsnip#available"](1) == 1 then
		feedkey("<Plug>(vsnip-expand-or-jump)", "")
		-- elseif has_words_before() then
		-- 	cmp.complete()
	else
		fallback()
	end
end, { "i", "s" })

local prev_item = cmp.mapping(function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		feedkey("<Plug>(vsnip-jump-prev)", "")
	else
		fallback()
	end
end, { "i", "s" })

local confirm = cmp.mapping(function(fallback)
	if cmp.visible() then
		if vim.bo.filetype == "DressingInput" then
			cmp.confirm({ select = false })
			feedkey("<Esc>", "n")
			fallback()
		else
			cmp.confirm({ select = true })
		end
	else
		fallback()
	end
end)

local scroll_docs = function(offset)
	return cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.scroll_docs(offset)
		else
			fallback()
		end
	end, { "i", "c" })
end
-- no tags please
vim.keymap.set("i", "<C-n>", "<NOP>")
vim.keymap.set("i", "<C-p>", "<NOP>")
-- remap omnifunc
vim.keymap.set("i", "<C-x><C-o>", cmp.complete, { noremap = true, silent = true })

local mappings = {
	["<C-d>"] = scroll_docs(4),
	["<C-u>"] = scroll_docs(-4),
	["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
	["<C-y>"] = cmp.config.disable,
	["<C-e>"] = cmp.mapping(function()
		if cmp.visible() then
			cmp.abort()
		else
			cmp.complete()
		end
	end),
	["<CR>"] = confirm,
	["<C-n>"] = next_item,
	["<Tab>"] = next_item,
	["<C-p>"] = prev_item,
	["<S-Tab>"] = prev_item,
}

local merge = function(a, b)
	return vim.tbl_deep_extend("force", {}, a, b)
end

cmp.setup({
	-- enabled = function()
	-- 	return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	-- end,
	preselect = cmp.PreselectMode.Item,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = mappings,
	sorting = {
		priority_weight = 3,
		comparators = {
			compare.offset,
			compare.exact,
			compare.score,
			compare.recently_used,
			compare.locality,
			-- require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		},
	},
	sources = cmp.config.sources({
		{ name = "copilot", group_index = 1, priority = 20 },
		{ name = "nvim_lsp", group_index = 1, priority = 15 },
		{ name = "vsnip", group_index = 1, priority = 10 },
		-- { name = "rg", group_index = 2, priority = 5, max_item_count = 2, keyword_length = 3 },
		{ name = "buffer", group_index = 2, priority = 5, max_item_count = 3, keyword_length = 3 },
		{ name = "path", group_index = 2, priority = 3 },
		{ name = "nvim_lsp_signature_help", group_index = 3, priority = 1 },
		-- { name = "npm", group_index = 4, keyword_length = 4 },
	}),
	window = {
		documentation = merge(cmp.config.window.bordered(), {
			max_height = 15,
			max_width = 75,
		}),
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			preset = "codicons",
			symbol_map = {
				copilot = "",
			},
			maxwidth = 62, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, item)
				-- Get the full snippet (and only keep first line)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end
				word = str.oneline(word)
				if
					entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
					and string.sub(item.abbr, -1, -1) == "~"
				then
					word = "~" .. word .. "~"
				end
				if string.len(word) > 0 then
					item.abbr = word
				end
				local short_name = {
					nvim_lsp = "lsp",
					nvim_lua = "nvim-lua",
				}
				-- u.tprint(entry)
				local menu_name = short_name[entry.source.name] or entry.source.name
				item.menu = string.format("[%s]", menu_name)
				return item
			end,
		}),
	},
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	sources = cmp.config.sources({
		{ name = "buffer" },
		-- { name = "rg", keyword_length = 3, max_item_count = 5 },
	}),
	mapping = cmp.mapping.preset.cmdline(mappings),
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "cmdline", group_index = 1, priority = 4 },
		{ name = "nvim_lua", group_index = 1, priority = 3 },
		{ name = "path", group_index = 2, priority = 2 },
	}),
	mapping = cmp.mapping.preset.cmdline(mappings),
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
	sources = {
		{ name = "dap" },
	},
})
