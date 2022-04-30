-- Setup nvim-cmp.
local cmp = require("cmp")
-- local compare = require("cmp.config.compare")
-- local default_config = require("cmp.config.default")
local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")

-- setup cmp-npm
require("cmp-npm").setup({})

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
	elseif has_words_before() then
		cmp.complete()
	else
		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
	end
end, { "i", "s" })

local prev_item = cmp.mapping(function()
	if cmp.visible() then
		cmp.select_prev_item()
	elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		feedkey("<Plug>(vsnip-jump-prev)", "")
	end
end, { "i", "s" })

cmp.setup({
	preselect = cmp.PreselectMode.Item,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-n>"] = next_item,
		["<Tab>"] = next_item,
		["<C-p>"] = prev_item,
		["<S-Tab>"] = prev_item,
	},
	-- sorting = default_config.sorting,
	-- sorting = {
	-- 	comparators = {
	-- 		compare.offset,
	-- 		compare.exact,
	-- 		compare.score,
	-- 		compare.recently_used,
	-- 		require("cmp-under-comparator").under,
	-- 		compare.kind,
	-- 		compare.sort_text,
	-- 		compare.length,
	-- 		compare.order,
	-- 	},
	-- },
	sorting = {
		priority_weight = 3,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1, priority = 15 },
		{ name = "vsnip", group_index = 1, priority = 5 },
		{ name = "buffer", group_index = 2, priority = 2, max_item_count = 3, keyword_length = 4 },
		{ name = "path", group_index = 2, priority = 1 },
		{ name = "nvim_lsp_signature_help", group_index = 3 },
		{ name = "npm", group_index = 4, keyword_length = 4 },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- TODO: show source file in PUM if possible
			-- print("---------")
			-- tprint(entry, 2)
			--
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			-- with_text = false,
			before = function(entry, vim_item)
				-- Get the full snippet (and only keep first line)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end
				word = str.oneline(word)
				if
					entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
					and string.sub(vim_item.abbr, -1, -1) == "~"
				then
					word = "~" .. word .. "~"
				end
				if string.len(word) > 0 then
					vim_item.abbr = word
				end
				return vim_item
			end,
		}),
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "cmdline", group_index = 1, priority = 4 },
		{ name = "nvim_lua", group_index = 1, priority = 3 },
		{ name = "path", group_index = 2, priority = 2 },
	}),
})
