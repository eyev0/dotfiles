-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local keymap_utils = require("utils.keymap")
local feedkeys = vim.api.nvim_feedkeys

Keymap = {}

pcall(vim.keymap.del, "", "<Space>")
map("", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Packer
-- map("n", "<leader>ps", [[:PackerSync<CR>]], { noremap = true })
map("n", "<leader>ps", [[:Lazy sync<CR>]], { noremap = true, silent = true })
map("n", "<leader>pp", [[:Lazy profile<CR>]], { noremap = true, silent = true })
-- map("n", "<Leader>pi", [[:PackerInstall<CR>]], { noremap = true })
-- map("n", "<leader>pc", [[:PackerCompile<CR>]], { noremap = true })
-- silent dot
map("n", ".", ".", { noremap = true, silent = true })
-- easier navigation, also powered by tmux
map("n", "<C-h>", [[:TmuxNavigateLeft<cr>]], { noremap = true, silent = true })
map("n", "<C-j>", [[:TmuxNavigateDown<cr>]], { noremap = true, silent = true })
map("n", "<C-k>", [[:TmuxNavigateUp<cr>]], { noremap = true, silent = true })
map("n", "<C-l>", [[:TmuxNavigateRight<cr>]], { noremap = true, silent = true })
-- redraw screen
map("n", "<M-l>", [[<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>]], { noremap = true, silent = true })
-- buffers stuff
-- map("n", "<C-w>d", [[:BufDel<CR>]], { noremap = true, silent = true })
-- tabs stuff
map("n", "<C-w>tn", [[:tabnew<CR>]], { noremap = true, silent = true })
map("n", "<C-w>to", [[:tabonly<CR>]], { noremap = true, silent = true })
map("n", "<C-w>tq", [[:tabc<CR>]], { noremap = true, silent = true })
-- Arrows switch tabs
map("n", "<C-w><C-j>", ":tabprevious<CR>", { noremap = true, silent = true })
map("n", "<C-w><C-k>", ":tabnext<CR>", { noremap = true, silent = true })
vim.cmd([[
func GotoWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfun
]])
-- Maximizer
map("n", "<C-w>m", [[:MaximizerToggle!<CR>]], { noremap = true, silent = true })
--
map("n", "<F36>", ":qa<CR>", { noremap = true, silent = true }) --<C-F12>
-- resize with C-arrows
map("", "<C-Up>", [[:resize -3<CR>]], { noremap = true, silent = true })
map("", "<C-Down>", [[:resize +3<CR>]], { noremap = true, silent = true })
map("", "<C-Left>", [[:vertical resize -4<CR>]], { noremap = true, silent = true })
map("", "<C-Right>", [[:vertical resize +4<CR>]], { noremap = true, silent = true })
-- better indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
-- clear last search
map("n", "<C-c>", function()
	-- vim.fn.setreg("/", "")
	vim.cmd.nohlsearch()
end, { noremap = false, silent = true })
-- search and J fix
map("n", "n", function()
	if vim.fn.getreg("/") ~= "" then
		feedkeys("nzzzv", "ni", false)
	end
end, { noremap = true, silent = true })
map("n", "N", function()
	if vim.fn.getreg("/") ~= "" then
		feedkeys("Nzzzv", "ni", false)
	end
end, { noremap = true, silent = true })
map("n", "J", [[mzJ`z]], { noremap = true, silent = true })
-- undo streak breakers
map("i", ",", [[,<C-g>u]], { noremap = true, silent = true })
map("i", ".", [[.<C-g>u]], { noremap = true, silent = true })
map("i", "!", [[!<C-g>u]], { noremap = true, silent = true })
map("i", "?", [[?<C-g>u]], { noremap = true, silent = true })
map("i", "(", [[(<C-g>u]], { noremap = true, silent = true })
map("i", ")", [[)<C-g>u]], { noremap = true, silent = true })
map("i", "[", [[[<C-g>u]], { noremap = true, silent = true })
map("i", "]", [[]<C-g>u]], { noremap = true, silent = true })
map("i", "{", [[{<C-g>u]], { noremap = true, silent = true })
map("i", "}", [[}<C-g>u]], { noremap = true, silent = true })
map("i", "<", [[<<C-g>u]], { noremap = true, silent = true })
map("i", ">", [[><C-g>u]], { noremap = true, silent = true })
map("i", ":", [[:<C-g>u]], { noremap = true, silent = true })
map("i", "<CR>", [[<CR><C-g>u]], { noremap = true, silent = true })
-- jumplist mutation
map("n", "k", [[(v:count > 5 ? "m'" . v:count : "") . 'k']], { noremap = true, silent = true, expr = true })
map("n", "<Up>", [[(v:count > 5 ? "m'" . v:count : "") . '<Up>']], { noremap = true, silent = true, expr = true })
map("n", "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j']], { noremap = true, silent = true, expr = true })
map("n", "<Down>", [[(v:count > 5 ? "m'" . v:count : "") . '<Down>']], { noremap = true, silent = true, expr = true })
-- hacking search with visual mode
-- search within current selection (prompt)
map("x", "/i", [[<Esc>/\%V]], { noremap = true, silent = true })
-- search for selected text
map("v", "/a", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })
-- jj to escape
map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("t", "<C-]>", "<C-\\><C-n>", { noremap = true, silent = true })
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
-- map("i", "<C-k>", function()
-- 	vim.cmd.move(".-2")
-- 	feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true) .. "==", "nt", false)
-- end, { noremap = true, silent = true })
-- map("i", "<C-j>", function()
-- 	vim.cmd.move(".+1")
-- 	feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true) .. "==", "nt", false)
-- end, { noremap = true, silent = true })
-- map("n", "<leader>k", function()
-- 	vim.cmd.move(".-2")
-- 	feedkeys("==", "nt", false)
-- end, { noremap = true, silent = true, desc = "Move line up" })
-- map("n", "<leader>j", function()
-- 	vim.cmd.move(".+1")
-- 	feedkeys("==", "nt", false)
-- end, { noremap = true, silent = true, desc = "Move line down" })
-- handy to move around on the line
map("", "H", [[^]], { noremap = true, silent = true })
map("", "L", [[$]], { noremap = true, silent = true })
-- yank to EOL
map("n", "Y", [[y$]], { silent = true })
-- 'whole buffer' operator
map({ "o", "v" }, "ie", "<cmd>exec 'normal! ggVG'<cr>", { noremap = true, silent = true, desc = "Whole buffer" })
-- treesitter unit (node)
map(
	"x",
	"in",
	':lua require"treesitter-unit".select()<CR>',
	{ noremap = true, silent = true, desc = "Select treesitter node's inner scope" }
)
map(
	"x",
	"an",
	':lua require"treesitter-unit".select(true)<CR>',
	{ noremap = true, silent = true, desc = "Select treesitter node's outer scope" }
)
map(
	"o",
	"in",
	':<c-u>lua require"treesitter-unit".select()<CR>',
	{ noremap = true, silent = true, desc = "Select treesitter node's inner scope" }
)
map(
	"o",
	"an",
	':<c-u>lua require"treesitter-unit".select(true)<CR>',
	{ noremap = true, silent = true, desc = "Select treesitter node's outer scope" }
)
-- s for substitute
map("n", "s", [[<plug>(SubversiveSubstitute)]], { noremap = true, silent = true })
map("n", "ss", [[<plug>(SubversiveSubstituteLine)]], { noremap = true, silent = true })
map("n", "S", [[<plug>(SubversiveSubstituteToEndOfLine)]], { noremap = true, silent = true })
-- yank-delete
map({ "n", "x" }, "c", [["_c]], { noremap = true, silent = true })
map({ "n", "x" }, "d", [["_d]], { noremap = true, silent = true })
map("n", "dd", [["_dd]], { noremap = true, silent = true })
map({ "n", "x" }, "D", [["_D]], { noremap = true, silent = true })
map({ "n", "x" }, "x", [[d]], { noremap = true, silent = true })
map("n", "xx", [[dd]], { noremap = true, silent = true })
map("n", "X", [[D]], { noremap = true, silent = true })
-- yank maps
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map("n", "<PageUp>", [[<plug>(YankyCycleBackward)]], { silent = true })
map("n", "<PageDown>", [[<plug>(YankyCycleForward)]], { silent = true })
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
-- like unimpaired
map("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
map("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
map("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
map("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
map("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
map("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
map("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
map("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
map("n", "=p", "<Plug>(YankyPutAfterFilter)")
map("n", "=P", "<Plug>(YankyPutBeforeFilter)")
-- substitute
map("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
map("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
map("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
map("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
-- exchange
map("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
map("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
map("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
map("n", "cxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
-- quickfix stuff
local qf_max_height = 7
local get_qf_height = function(height, max_height)
	return math.min(math.max(height, 1), max_height)
end
---Open quickfix list at the bottom of the screen with max height of qf_max_height
local function cwindow_bot()
	local h = #vim.fn.getqflist()
	if h > 0 then
		vim.cmd("horizontal bo copen " .. get_qf_height(h, qf_max_height))
	else
		vim.cmd("cclose")
	end
end
map("n", "<C-q><C-q>", [[:cclose<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-o>", cwindow_bot, { noremap = true, silent = true })
map("n", "<C-q><C-n>", [[:cnewer<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-p>", [[:colder<CR>]], { noremap = true, silent = true })
map("n", "<C-n>", [[:cnext<CR>]], { noremap = true, silent = true })
map("n", "<C-p>", [[:cprevious<CR>]], { noremap = true, silent = true })
-- search-replace within quickfix entries
map({ "v", "n" }, "<C-q><C-r>", function()
	if #vim.fn.getqflist() == 0 then
		vim.cmd("echo 'No quickfix list'")
		return
	end
	local search
	if keymap_utils.is_vis_mode() then
		vim.cmd('noau normal! "vy"')
		search = vim.fn.getreg("v")
	else
		search = vim.fn.input({ prompt = "Search: " })
	end
	local replacement = vim.fn.input({ prompt = "Replace with: " })
	if search == nil or #search == 0 or replacement == nil or #replacement == 0 then
		return
	end
	vim.cmd("cdo s/" .. vim.fn.escape(search, "/.") .. "/" .. vim.fn.escape(replacement, "/") .. "/cI")
end, { noremap = true, silent = true, desc = "Replace within quickfix entries" })
-- handy set filetype
map("n", "<leader>vsft", [[:set ft=]], { noremap = true, silent = false })
map("n", "<leader>vsbt", [[:set bt=]], { noremap = true, silent = false })
-- sometimes scrolloff gets messed up for no obvious reason
map("n", "<leader>vsso", function()
	vim.o.scrolloff = O.scrolloff
	vim.o.sidescrolloff = O.sidescrolloff
end, { noremap = true, silent = true, desc = "Reset scrolloff" })
-- noice scrolling through hover docs
map("n", "<c-d>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-d>"
	end
end, { silent = true, expr = true })
map("n", "<c-u>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-u>"
	end
end, { silent = true, expr = true })
-- lsp
-- toggle diagnostics
map("n", "<F26>", Lsp.toggle_diagnostic_float, { noremap = true, silent = true }) -- C-F2
map("n", "<F2>", Lsp.toggle_diagnostic_virt_lines, { noremap = true, silent = true })
map("n", "<leader>le", function()
	vim.diagnostic.setqflist({ severity = { min = vim.diagnostic.severity.WARN, open = false } })
	cwindow_bot()
end, { noremap = true, silent = true, desc = "Diagnostics to qf list" })
map(
	"n",
	"<F27>", -- <C-F3>
	"<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
	{ noremap = true, silent = true, desc = "Go to previous diagnostic ERROR" }
)
map(
	"n",
	"<F3>",
	"<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
	{ noremap = true, silent = true, desc = "Go to next diagnostic ERROR" }
)
local function set_lsp_buf_shortcuts(_, bufnr)
	local function buf_map(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = bufnr
		return vim.keymap.set(mode, lhs, rhs, opts)
	end
	local on_list = function(options)
		vim.fn.setqflist({}, " ", options)
		cwindow_bot()
		-- open quickfix only if it exists and switch to previous buffer instantly
		-- vim.api.nvim_exec("cwindow | wincmd p", false)
	end
	buf_map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto Definition" })
	buf_map("n", "gr", function()
		vim.lsp.buf.references({ includeDeclaration = false }, { on_list = on_list })
	end, { noremap = true, silent = true, desc = "List References" })
	buf_map("n", "gI", function()
		vim.lsp.buf.implementation({ on_list = on_list })
	end, { noremap = true, silent = true, desc = "List Implementations" })
	buf_map("n", "gCi", vim.lsp.buf.incoming_calls, { noremap = true, silent = true, desc = "List Incoming Calls" })
	buf_map("n", "gCo", vim.lsp.buf.outgoing_calls, { noremap = true, silent = true, desc = "List Outgoing Calls" })
	buf_map("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover docs" })
	buf_map(
		{ "n", "i" },
		"<M-k>",
		vim.lsp.buf.signature_help,
		{ noremap = true, silent = true, desc = "Signature help" }
	)
	buf_map("n", "<leader>lar", function()
		require("conf.lsp").buffer_clients.clients[bufnr] = vim.lsp.get_active_clients({ bufnr = bufnr })
		require("conf.lsp").buffer_clients.current_rename_bufnr = bufnr
		vim.lsp.buf.rename()
	end, { noremap = true, silent = true, desc = "Rename symbol" })
	buf_map(
		{ "n", "v" },
		"<leader>lac",
		vim.lsp.buf.code_action,
		{ noremap = true, silent = true, desc = "Code action" }
	)
end
Keymap.set_lsp_buf_shortcuts = set_lsp_buf_shortcuts
-- formatting without calling on_attach (for null-ls)
map("n", "<leader>laf", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })
-- refactoring.nvim
local function set_refactor_shortcuts(params)
	local function buf_map(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = params.buf
		return vim.keymap.set(mode, lhs, rhs, opts)
	end
	buf_map(
		"v",
		"<leader>laef",
		[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
		{ noremap = true, silent = true, desc = "refactor: Extract Function" }
	)
	buf_map(
		"v",
		"<leader>laetf",
		[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
		{ noremap = true, silent = true, desc = "refactor: Extract Function To File" }
	)
	buf_map({ "n", "v" }, "<leader>laiv", function()
		if keymap_utils.is_vis_mode() then
			feedkeys("<Esc>", "n", false)
		end
		require("refactoring").refactor("Inline Variable")
	end, { noremap = true, silent = true, desc = "refactor: Inline Variable" })
	-- do not map extract variable for java
	if params.file:find(".java") then
		return
	end
	buf_map(
		"v",
		"<leader>laev",
		[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
		{ noremap = true, silent = true, desc = "refactor: Extract Variable" }
	)
end
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("RefactoringNvimShortcuts", {}),
	callback = set_refactor_shortcuts,
})
-- aerial
local function set_aerial_buf_shortcuts(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- Jump forwards/backwards with '{' and '}'
	map("n", "{", require("aerial").prev, opts)
	map("n", "}", require("aerial").next, opts)
end
Keymap.set_aerial_buf_shortcuts = set_aerial_buf_shortcuts
map("n", "<leader>lsa", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
-- vista = tags
map("n", "<leader>lsv", [[:Vista nvim_lsp<CR>]], { noremap = true, silent = true })
--
map("n", "<Esc>", function()
	vim.cmd.cclose()
	vim.cmd([[Vista!]])
	vim.cmd([[AerialClose]])
	vim.cmd([[NvimTreeClose]])
	vim.cmd([[TroubleClose]])
end, { noremap = true, silent = true })
-- NvimTree
map("n", "<leader>n", [[:NvimTreeToggle<CR>]], { noremap = true, silent = true })
-- floaterm
map("n", "<F1>", [[:FloatermToggle<CR>]], { noremap = true, silent = true })
map("t", "<F1>", [[<C-\><C-n>:FloatermToggle<CR>]], { noremap = true, silent = true })
map("n", "<F25>", [[:FloatermNew<CR>]], { noremap = true, silent = true }) -- <C-F1>
map("t", "<F25>", [[<C-\><C-n>:FloatermNew<CR>]], { noremap = true, silent = true }) -- <C-F1>
map("t", "<C-PageDown>", [[<C-\><C-n>:FloatermPrev<CR>]], { noremap = true, silent = true })
map("t", "<C-PageUp>", [[<C-\><C-n>:FloatermNext<CR>]], { noremap = true, silent = true })
map("n", "<C-PageDown>", [[:FloatermPrev<CR>]], { noremap = true, silent = true })
map("n", "<C-PageUp>", [[<:FloatermNext<CR>]], { noremap = true, silent = true })
map("t", "<C-w>q", [[<C-\><C-n>:FloatermKill<CR>]], { silent = true })
map("t", "<C-h>", [[<C-\><C-n>:TmuxNavigateLeft<CR>]], { silent = true })
map("t", "<C-j>", [[<C-\><C-n>:TmuxNavigateDown<CR>]], { silent = true })
map("t", "<C-k>", [[<C-\><C-n>:TmuxNavigateUp<CR>]], { silent = true })
map("t", "<C-l>", [[<C-\><C-n>:TmuxNavigateRight<CR>]], { silent = true })
map("t", "<C-Up>", [[<C-\><C-n>:resize -2<CR>]], { noremap = true, silent = true })
map("t", "<C-Down>", [[<C-\><C-n>:resize +2<CR>]], { noremap = true, silent = true })
-- Telescope - opener
local find_files_opts = {
	layout_strategy = "horizontal",
	no_ignore = true,
	hidden = true,
	layout_config = {
		mirror = false,
		prompt_position = "top",
		scroll_speed = 5,
		height = 0.4,
		width = 0.65,
		preview_width = 0.47,
	},
}
local function with_default_opts(opts)
	opts = opts or {}
	return vim.tbl_deep_extend("force", {
		layout_strategy = "center",
		layout_config = { mirror = true, prompt_position = "top", scroll_speed = 7, height = 0.45, width = 0.6 },
	}, opts)
end
local telescope = require("telescope.builtin")
local default_mode = "git"
local mode = default_mode
-- remove experimental surround mappings, I don't use them
vim.keymap.del("i", "<C-g>s")
vim.keymap.del("i", "<C-g>S")
map({ "n", "i" }, "<C-g>", function()
	if vim.bo.filetype == "TelescopePrompt" then
		-- toggle mode
		mode = mode == "git" and "files" or "git"
		vim.api.nvim_win_close(0, true)
	else
		mode = default_mode
	end
	if mode == "git" then
		local has_git = pcall(telescope.git_files, find_files_opts)
		if not has_git then
			telescope.find_files(find_files_opts)
		end
	else
		telescope.find_files(find_files_opts)
	end
end, { noremap = true, silent = true, desc = "Find files" })
local function get_visual_selection(escaped)
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})
	text = string.gsub(text, "\n", "")
	if #text > 0 then
		if escaped then
			return vim.fn.escape(text, "/\\(){}[].+*")
		else
			return text
		end
	else
		return ""
	end
end
-- grepping
-- Telescope grep_string search="" only_sort_text=true
map("v", "<C-f>", function()
	telescope.live_grep(with_default_opts({
		default_text = get_visual_selection(true),
		initial_mode = "normal",
	}))
end, { noremap = true, silent = true, desc = "Grep string under cursor" })
map("n", "<C-f>", function()
	telescope.live_grep(with_default_opts())
end, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<leader>og", function()
	telescope.grep_string(with_default_opts({ initial_mode = "normal" }))
end, { noremap = true, silent = true, desc = "Grep string under cursor" })
map("n", "<leader>os", function()
	require("telescope").extensions.persisted.persisted(with_default_opts({}))
end, { noremap = true, silent = true, desc = "View sessions" })
map("n", "<leader>ox", function()
	require("telescope").extensions.tmuxinator.projects(require("telescope.themes").get_dropdown({}))
end, { noremap = true, silent = true, desc = "View tmuxinator projects" })
map("n", "<leader>om", function()
	vim.ui.input({ prompt = "Show man page for", completion = "shellcmd" }, function(input)
		if input ~= nil then
			vim.cmd("vert Man " .. input)
		end
	end)
end, { noremap = true, silent = true, desc = "Prompt for man page" })
map("n", "<leader>oni", function()
	require("telescope").extensions.noice.noice({ initial_mode = "normal", sorting_strategy = "descending" })
end, { noremap = true, silent = true, desc = "View messages(noice)" })
map("n", "<leader>onm", function()
	vim.cmd("NoiceHistory")
end, { noremap = true, silent = true, desc = "View messages" })
map("n", "<leader>onf", function()
	require("telescope").extensions.notify.notify({ initial_mode = "normal", sorting_strategy = "descending" })
end, { noremap = true, silent = true, desc = "View notifications" })
map("n", "<leader>ovb", function()
	telescope.buffers(with_default_opts({ initial_mode = "normal" }))
end, { noremap = true, silent = true, desc = "View buffers" })
map("n", "<leader>ovf", function()
	telescope.oldfiles(with_default_opts({ initial_mode = "normal" }))
end, { noremap = true, silent = true, desc = "View oldfiles" })
map("n", "<leader>ovm", function()
	telescope.keymaps(with_default_opts())
end, { noremap = true, silent = true, desc = "View keymaps" })
map("n", "<leader>ovh", function()
	telescope.help_tags(with_default_opts())
end, { noremap = true, silent = true, desc = "View help tags" })
map("n", "<leader>ovo", function()
	telescope.vim_options(with_default_opts())
end, { noremap = true, silent = true, desc = "View vim options" })
map("n", "<leader>ovl", function()
	telescope.highlights(with_default_opts())
end, { noremap = true, silent = true, desc = "View highlights" })
map("n", "<leader>ova", function()
	telescope.autocommands(with_default_opts())
end, { noremap = true, silent = true, desc = "View autocommands" })
map("n", "<leader>ovc", function()
	telescope.commands(with_default_opts())
end, { noremap = true, silent = true, desc = "View commands" })
map("n", "<leader>ovr", function()
	telescope.reloader(with_default_opts())
end, { noremap = true, silent = true, desc = "View reloader" })
map("n", "<leader>otb", function()
	telescope.builtin(with_default_opts())
end, { noremap = true, silent = true, desc = "View telescope builtin" })
map("n", "<leader>ots", [[:TSPlaygroundToggle<CR>]], { noremap = true, silent = true })
-- UndoTree
map("n", "<leader>out", [[:UndotreeToggle <bar> UndotreeFocus<CR>]], { noremap = true, silent = true })
-- todo
map("n", "<leader>otd", [[:TodoQuickFix<CR>]], { noremap = true, silent = true })
-- open current file's dir in separate tmux window
map("n", "<leader>ocd", function()
	local cur_file_dir_path = vim.fn.expand("%:p:h")
	vim.ui.input({
		prompt = "Enter directory to open: ",
		default = cur_file_dir_path,
		completion = "file",
	}, function(dir_to_open)
		if dir_to_open == nil then
			return
		end
		-- trim trailing slash
		dir_to_open = string.gsub(dir_to_open, "/$", "")
		if vim.loop.fs_realpath(dir_to_open) then
			local name = vim.fn.fnamemodify(dir_to_open, ":t")
			if #name == 0 then
				name = "new_window"
			end
			vim.cmd("!tmux new-window -n " .. name .. " -c " .. dir_to_open .. " ';' set -w remain-on-exit off")
		else
			print("Invalid directory")
		end
	end)
end, { noremap = true, silent = true, desc = "Open dir in separate tmux window" })
-- debug actions
local dap = require("dap")
-- map("n", "<C-F8>", [[:lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
map("n", "<F8>", dap.continue, { noremap = true, silent = true })
map("n", "<F6>", dap.step_over, { noremap = true, silent = true })
map("n", "<F5>", dap.step_into, { noremap = true, silent = true })
map("n", "<F7>", dap.step_out, { noremap = true, silent = true })
map("n", "<leader>dr", dap.terminate, { noremap = true, silent = true })
map("n", "<leader>dp", function()
	dap.toggle_breakpoint()
end, { noremap = true, silent = true, desc = "Toggle breakpoint" })
-- set breakpoint condition
local cond_breakpoint_expr = nil
map("v", "<leader>dP", function()
	vim.cmd('noau normal! "vy"')
	cond_breakpoint_expr = vim.fn.getreg("v")
	-- vim.fn.setreg("v", {})
end, { noremap = true, silent = true, desc = "Set breakpoint condition" })
-- set breakpoint with condition
local function set_breakpoint_with_condition(s)
	if s == nil then
		return
	end
	dap.set_breakpoint(s)
end
map("n", "<leader>dP", function()
	if cond_breakpoint_expr ~= nil then
		vim.ui.input(
			{ prompt = "Breakpoint condition: ", default = cond_breakpoint_expr },
			set_breakpoint_with_condition
		)
		cond_breakpoint_expr = nil
	else
		vim.ui.input({ prompt = "Breakpoint condition: " }, set_breakpoint_with_condition)
	end
end, { noremap = true, silent = true, desc = "Set breakpoint with condition" })
map("n", "<leader>dc", dap.clear_breakpoints, { noremap = true, silent = true, desc = "Clear breakpoints" })
map("n", "<leader>dL", function()
	dap.set_breakpoint(nil, nil, vim.fn.input({ prompt = "Log point message: " }))
end, { noremap = true, silent = true, desc = "Set log point message" })
map("n", "<leader>du", [[:lua require'dapui'.toggle()<CR>]], { noremap = true, silent = true })
map("n", "<leader>de", [[:lua require("dapui").eval()<CR>]], { noremap = true, silent = true })
map("v", "<leader>de", [[:lua require("dapui").eval()<CR>]], { noremap = true, silent = true })
map("n", "<leader>df", [[:lua require("dapui").float_element()<CR>]], { noremap = true, silent = true })
-- debug jest
map("n", "<leader>dj", [[:JesterActions<CR>]], { noremap = true, silent = true })
-- telescope dap
map("n", "<leader>dlb", [[:Telescope dap list_breakpoints<CR>]], { noremap = true, silent = true })
map("n", "<leader>dlv", [[:Telescope dap variables<CR>]], { noremap = true, silent = true })
map("n", "<leader>dlf", [[:Telescope dap configurations<CR>]], { noremap = true, silent = true })
map("n", "<leader>dlc", [[:Telescope dap commands<CR>]], { noremap = true, silent = true })
-- :Telescope dap commands
-- :Telescope dap configurations
-- :Telescope dap list_breakpoints
-- :Telescope dap variables
-- :Telescope dap frames
-- dadbod
map("n", "<leader>ddu", [[:DBUIToggle<CR>]], { noremap = true, silent = true })
-- scratch buffers
map("n", "<leader>llf", [[:vsplit | e /tmp/scratch<CR>]], { noremap = true, silent = true })
map("n", "<leader>llx", [[:Luapad<CR>]], { noremap = true, silent = true })
map("n", "<leader>llr", [[:LuaRun<CR>]], { noremap = true, silent = true })
-- map("n", "<leader>la", [[:lua require('luapad').toggle()<CR>]], { noremap = true })

-- git stuff
-- status
map(
	"n",
	"<leader>gs",
	[[:DiffviewOpen HEAD<CR> :Git<CR> <bar> :resize -7<CR>]],
	{ noremap = true, silent = true, desc = "Git status" }
)
-- log
map("n", "<leader>gla", [[:DiffviewFileHistory<CR>]], { noremap = true, silent = true, desc = "Git log - all files" })
map(
	"n",
	"<leader>glf",
	[[:DiffviewFileHistory %<CR>]],
	{ noremap = true, silent = true, desc = "Git log - current file" }
)
-- diff
map(
	"n",
	"<leader>gdm",
	[[:tabnew <bar> :b# <bar> :Gvdiffsplit!<CR>]],
	{ noremap = true, silent = true, desc = "Git merge 3-way diff" }
)
map(
	"n",
	"<leader>gdf",
	[[:DiffviewOpen HEAD -- %:p<CR> <bar> <C-w>l<C-w>l]],
	{ noremap = true, silent = true, desc = "Git diff file against index" }
)
map(
	"n",
	"<leader>gda",
	[[:DiffviewOpen HEAD]],
	{ noremap = true, silent = false, desc = "Git diff all (prompts for revision)" }
)
-- remote
map("n", "<leader>grp", [[:Git push<CR>]], { noremap = true, silent = true, desc = "Git push" })
map("n", "<leader>grl", [[:Git pull<CR>]], { noremap = true, silent = true, desc = "Git pull" })
-- git terminal
map(
	"n",
	"<leader>gt",
	[[:FloatermNew --height=0.9 --width=0.7 --wintype=float --name=lazygit --position=center --autoclose=2 lazygit<CR>]],
	{ noremap = true, silent = true, desc = "Lazygit in floaterm" }
)
-- manage dotfiles
map(
	"n",
	"<leader>gm",
	[[:FloatermNew --height=0.9 --width=0.7 --wintype=float --name=lazygit --position=center --autoclose=2 'lazygit -g expand("$HOME")/.dotfiles -w expand("$HOME")'<CR>]],
	{ noremap = true, silent = true, desc = "Dotfiles git" }
)
-- gitsigns
local function set_gitsigns_buf_shortcuts(buf_map, gs)
	-- Navigation
	buf_map(
		"n",
		"<F4>",
		"&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
		{ noremap = true, silent = true, expr = true, desc = "git: Next hunk" }
	)
	buf_map(
		"n",
		"<F28>", --<C-F4>
		"&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
		{ noremap = true, silent = true, expr = true, desc = "git: Prev hunk" }
	)
	-- Actions
	buf_map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, { noremap = true, silent = true, desc = "git: Stage hunk" })
	buf_map({ "n", "v" }, "<leader>ghr", gs.reset_hunk, { noremap = true, silent = true, desc = "git: Reset hunk" })
	buf_map("n", "<leader>ghS", gs.stage_buffer, { noremap = true, silent = true, desc = "git: Stage buffer" })
	buf_map("n", "<leader>ghu", gs.undo_stage_hunk, { noremap = true, silent = true, desc = "git: Undo stage hunk" })
	buf_map("n", "<leader>ghR", gs.reset_buffer, { noremap = true, silent = true, desc = "git: Reset buffer" })
	buf_map("n", "<leader>ghp", gs.preview_hunk, { noremap = true, silent = true, desc = "git: Preview hunk" })
	buf_map("n", "<leader>ghb", function()
		gs.blame_line({ full = true })
	end, { noremap = true, silent = true, desc = "git: Blame line" })
	buf_map(
		"n",
		"<leader>ghtb",
		gs.toggle_current_line_blame,
		{ noremap = true, silent = true, desc = "git: Toggle current line blame" }
	)
	buf_map("n", "<leader>ghd", gs.diffthis, { noremap = true, silent = true, desc = "git: Diff to index" })
	buf_map("n", "<leader>ghD", function()
		gs.diffthis("HEAD~1")
	end, { noremap = true, silent = true, desc = "git: Diff to previous commit" })
	buf_map("n", "<leader>ghtd", gs.toggle_deleted, { noremap = true, silent = true, desc = "git: Toggle deleted" })
	-- Text object
	buf_map(
		{ "o", "x" },
		"ih",
		":<C-U>Gitsigns select_hunk<CR>",
		{ noremap = true, silent = true, desc = "git: Select hunk" }
	)
end
Keymap.set_gitsigns_buf_shortcuts = set_gitsigns_buf_shortcuts
-- project/sessions
map("n", "<leader>ssl", [[:SessionLoadLast<CR>]], { noremap = true, silent = true })
map("n", "<leader>sso", [[:SessionLoad<CR>]], { noremap = true, silent = true })
map("n", "<leader>ssq", [[:SessionStop<CR>]], { noremap = true, silent = true })
map("n", "<leader>ssd", [[:SessionDelete<CR>]], { noremap = true, silent = true })
-- harpoon
map("n", "<leader>ha", [[:lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })
map("n", "<leader>hv", [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true, silent = true })
map("n", "<M-a>", [[:lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true })
map("n", "<M-s>", [[:lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true })
map("n", "<M-d>", [[:lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true })
map("n", "<M-f>", [[:lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })
map("n", "<M-g>", [[:lua require("harpoon.ui").nav_file(5)<CR>]], { noremap = true, silent = true })
map("n", "<M-h>", [[:lua require("harpoon.ui").nav_file(6)<CR>]], { noremap = true, silent = true })
map("n", "<leader>ht", [[:lua require("harpoon.term").gotoTerminal(1)<CR>]], { noremap = true, silent = true })
-- portal
-- map("n", "<leader>i", require("portal").jump_backward, { noremap = true, silent = true })
-- map("n", "<leader>i", require("portal").jump_forward, { noremap = true, silent = true })
-- rest
map("n", "<leader>lhe", [[:RestSelectEnv ]], { noremap = true, silent = false })
map("n", "<leader>lhr", [[<cmd>RestNvimRun<CR>]], { noremap = true, silent = true })
map("n", "<leader>lhp", [[<cmd>RestNvimPreview<CR>]], { noremap = true, silent = true })
map("n", "<leader>lhl", [[<cmd>RestNvimRunLast<CR>]], { noremap = true, silent = true })
-- prettify json
map("n", "<leader>ljsp", [[:%!jq<CR>]], { noremap = true, silent = true, desc = "Prettify json" })
map("v", "<leader>ljsp", [[:!jq<CR>]], { noremap = true, silent = true, desc = "Prettify json" })
map("n", "<leader>ljsm", [[:%!jq -c<CR>]], { noremap = true, silent = true, desc = "Minify json" })
map("v", "<leader>ljsm", [[:!jq -c<CR>]], { noremap = true, silent = true, desc = "Minify json" })
-- cmdbuf
map({ "n", "v" }, "qo", function()
	require("cmdbuf").split_open(vim.o.cmdwinheight)
end, { noremap = true, silent = true, nowait = true })
map("c", "<C-f>", function()
	require("cmdbuf").split_open(vim.o.cmdwinheight, { line = vim.fn.getcmdline(), column = vim.fn.getcmdpos() })
	feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
end)
-- open lua command-line window
map("n", "ql", function()
	require("cmdbuf").split_open(vim.o.cmdwinheight, { type = "lua/cmd" })
end, { noremap = true, silent = true, nowait = true })
-- map("n", "q:", "<NOP>")
local cmdwin_aug_id = vim.api.nvim_create_augroup("CmdwinHacks", {})
vim.api.nvim_create_autocmd({ "CmdwinEnter" }, {
	group = cmdwin_aug_id,
	callback = function()
		map("n", "<Esc>", [[<Cmd>quit<CR>]], { noremap = true, silent = true, buffer = true })
		map("n", "q", [[<Cmd>quit<CR>]], { nowait = true, buffer = true })
		map("n", "<C-k>", [[<Cmd>quit<CR>]], { nowait = true, buffer = true })
		vim.cmd("TSBufDisable incremental_selection")
		vim.cmd("TSContextDisable")
	end,
})
vim.api.nvim_create_autocmd({ "CmdwinLeave" }, {
	group = cmdwin_aug_id,
	callback = function()
		vim.cmd("TSContextEnable")
	end,
})
vim.api.nvim_create_autocmd({ "User" }, {
	group = vim.api.nvim_create_augroup("cmdbuf_setting", {}),
	pattern = { "CmdbufNew" },
	callback = function()
		map("n", "q", [[<Cmd>quit<CR>]], { nowait = true, buffer = true })
		map("n", "<Esc>", [[<Cmd>quit<CR>]], { noremap = true, silent = true, buffer = true })
		map("n", "dd", [[<Cmd>lua require('cmdbuf').delete()<CR>]], { buffer = true })
		vim.wo.winfixheight = true
		local sources = {
			{ name = "nvim_lua", group_index = 1, priority = 3 },
			{ name = "path", group_index = 2, priority = 2 },
		}
		if vim.bo.filetype == "lua" then
			table.insert(sources, { name = "vsnip", group_index = 1, priority = 10 })
		else
			table.insert(sources, { name = "cmdline", group_index = 1, priority = 4 })
		end
		require("cmp").setup.buffer({
			sources = sources,
		})
	end,
})
-- filetype-specific shortcuts
local esc_quit_fts = { "help", "NvimTree", "notify", "aerial", "vista_kind" }
local esc_quit_lookup_t = U.to_lookup_map(esc_quit_fts)
local esc_tabc_fts = { "fugitive", "DiffviewFiles" }
local esc_tabc_lookup_t = U.to_lookup_map(esc_tabc_fts)
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("CustomFiletypeShortcuts", {}),
	callback = function(opts)
		if esc_quit_lookup_t[opts.match] ~= nil then
			-- close only current buffer with Esc
			vim.keymap.set("n", "<Esc>", ":quit<CR>", { noremap = true, silent = true, nowait = true, buffer = true })
		elseif opts.match == "qf" then
			vim.keymap.set("n", "<Esc>", function()
				vim.cmd.wincmd("p")
				vim.cmd.cclose()
			end, { noremap = true, silent = true, nowait = true, buffer = true })
		elseif esc_tabc_lookup_t[opts.match] ~= nil then
			-- close current tab
			vim.keymap.set("n", "<Esc>", function()
				vim.cmd("tabc! " .. vim.fn.tabpagenr())
			end, { noremap = true, silent = true, buffer = true })
		end
	end,
})
