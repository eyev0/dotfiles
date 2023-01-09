-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local keymap_utils = require("utils.keymap")

vim.keymap.del("", "<Space>")
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Packer
-- map("n", "<leader>ps", [[:PackerSync<CR>]], { noremap = true })
map("n", "<leader>ps", [[:Lazy sync<CR>]], { noremap = true })
-- map("n", "<Leader>pi", [[:PackerInstall<CR>]], { noremap = true })
-- map("n", "<leader>pc", [[:PackerCompile<CR>]], { noremap = true })
-- easier navigation, also powered by tmux
map("n", "<C-h>", [[:TmuxNavigateLeft<cr>]], { noremap = true, silent = true })
map("n", "<C-j>", [[:TmuxNavigateDown<cr>]], { noremap = true, silent = true })
map("n", "<C-k>", [[:TmuxNavigateUp<cr>]], { noremap = true, silent = true })
map("n", "<C-l>", [[:TmuxNavigateRight<cr>]], { noremap = true, silent = true })
-- redraw screen
map("n", "<M-l>", [[]], { noremap = true, silent = true })
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
map("n", "<C-F12>", ":qa<CR>", { noremap = true, silent = true })
-- resize with C-arrows
map("", "<C-Up>", [[:resize -3<CR>]], { noremap = true, silent = true })
map("", "<C-Down>", [[:resize +3<CR>]], { noremap = true, silent = true })
map("", "<C-Left>", [[:vertical resize -4<CR>]], { noremap = true, silent = true })
map("", "<C-Right>", [[:vertical resize +4<CR>]], { noremap = true, silent = true })
-- better indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
-- marks
-- map("n", "ma", "m", { noremap = true, silent = true })
-- clear last search
map("n", "<C-c>", function()
	vim.fn.setreg("/", "")
	-- vim.o.nohlsearch = true
end, { noremap = false, silent = true })
-- search and J fix
map("n", "n", function()
	if vim.fn.getreg("/") ~= "" then
		vim.api.nvim_feedkeys("nzzzv", "ni", false)
	end
end, { noremap = true, silent = true })
map("n", "N", function()
	if vim.fn.getreg("/") ~= "" then
		vim.api.nvim_feedkeys("Nzzzv", "ni", false)
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
map("i", ";", [[;<C-g>u]], { noremap = true, silent = true })
map("i", ":", [[:<C-g>u]], { noremap = true, silent = true })
map("i", "<CR>", [[<CR><C-g>u]], { noremap = true, silent = true })
-- jumplist mutation
map("n", "k", [[(v:count > 5 ? "m'" . v:count : "") . 'k']], { noremap = true, silent = true, expr = true })
map("n", "<Up>", [[(v:count > 5 ? "m'" . v:count : "") . '<Up>']], { noremap = true, silent = true, expr = true })
map("n", "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j']], { noremap = true, silent = true, expr = true })
map("n", "<Down>", [[(v:count > 5 ? "m'" . v:count : "") . '<Down>']], { noremap = true, silent = true, expr = true })
-- hacking search with visual mode
-- search within current selection (prompt)
map("x", "/i", [[<Esc>/\%V]], { noremap = true })
-- search for selected text
map("v", "/a", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true })
-- jj to escape as well as C-c
-- map('i', '<C-c>', [[<C-o><Esc>]], { noremap = true, silent = true })
map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("t", "<C-]>", "<C-\\><C-n>", { noremap = true, silent = true })
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
map("i", "<C-k>", function()
	vim.cmd("move .-2")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true) .. "==", "nt", false)
end, { noremap = true, silent = true })
map("i", "<C-j>", function()
	vim.cmd("move .+1")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true) .. "==", "nt", false)
end, { noremap = true, silent = true })
map("n", "<leader>k", function()
	vim.cmd("move .-2")
	vim.api.nvim_feedkeys("==", "nt", false)
end, { noremap = true, silent = true })
map("n", "<leader>j", function()
	vim.cmd("move .+1")
	vim.api.nvim_feedkeys("==", "nt", false)
end, { noremap = true, silent = true })
-- handy to move around on the line
map("", "H", [[^]], { noremap = true, silent = true })
map("", "L", [[$]], { noremap = true, silent = true })
-- yank whole file
map("n", "gY", [[gg"+yG]], { silent = true })
-- visual select whole file
map("n", "gV", [[ggVG]], { silent = true })
-- yank to EOL
map("n", "Y", [[y$]], { silent = true })
--
map({ "o", "v" }, "ie", "<cmd>exec 'normal! ggVG'<cr>", { noremap = true, silent = true })
-- s for substitute
map("n", "s", [[<plug>(SubversiveSubstitute)]], { noremap = true, silent = true })
map("n", "ss", [[<plug>(SubversiveSubstituteLine)]], { noremap = true, silent = true })
map("n", "S", [[<plug>(SubversiveSubstituteToEndOfLine)]], { noremap = true, silent = true })
-- yank-delete
map("n", "x", [[d]], { noremap = true, silent = true })
map("x", "x", [[d]], { noremap = true, silent = true })
map("n", "xx", [[dd]], { noremap = true, silent = true })
map("n", "X", [[D]], { noremap = true, silent = true })
-- Yoink maps
map("n", "p", [[<plug>(YoinkPaste_p)]], { silent = true })
map("n", "P", [[<plug>(YoinkPaste_P)]], { silent = true })
map("n", "<PageUp>", [[<plug>(YoinkRotateBack)]], { silent = true })
map("n", "<PageDown>", [[<plug>(YoinkRotateForward)]], { silent = true })
map("n", "y", [[<plug>(YoinkYankPreserveCursorPosition)]], { silent = true })
map("x", "y", [[<plug>(YoinkYankPreserveCursorPosition)]], { silent = true })
--
map("n", "<C-F2>", _G.toggle_diagnostic_float, { noremap = true, silent = true })
map("n", "<F2>", _G.toggle_diagnostic_virt_lines, { noremap = true, silent = true })
-- quickfix stuff
map("n", "<C-q><C-q>", [[:cclose<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-o>", [[:cwindow<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-n>", [[:cnewer<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-p>", [[:colder<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-j>", [[:cnext<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-k>", [[:cprevious<CR>]], { noremap = true, silent = true })
-- handy set filetype
map("n", "<leader>vsft", [[:set ft=]], { noremap = true, silent = false })
map("n", "<leader>vsbt", [[:set bt=]], { noremap = true, silent = false })
-- map("n", "<leader>sm", [[:set ft=markdown<CR>]], { noremap = true, silent = false })
-- sometimes scrolloff gets messed up for no obvious reason
map("n", "<leader>vsso", _G.set_scrolloffs, { noremap = true, silent = true })

-- noice scrolling through hover docs
map("n", "<c-f>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-f>"
	end
end, { silent = true, expr = true })

map("n", "<c-b>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-b>"
	end
end, { silent = true, expr = true })

-- plugin shortcuts
-- lsp
map("n", "<leader>le", function()
	vim.diagnostic.setqflist({ severity = { min = vim.diagnostic.severity.WARN, open = false } })
  vim.cmd("cwindow")
end, { noremap = true, silent = true, desc = "Diagnostics to qf list" })
map(
	"n",
	"<C-F3>",
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
	buf_map("n", "<leader>ld", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto Definition" })
	buf_map("n", "<leader>lr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Goto References"  })
	buf_map("n", "<leader>li", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Goto Implementation"  })
	buf_map("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover docs"  })
	buf_map({ "n", "i" }, "<M-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true })
	buf_map("n", "<leader>lar", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename"  })
	buf_map({ "n", "v" }, "<leader>lac", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action"  })
end
_G.set_lsp_buf_shortcuts = set_lsp_buf_shortcuts
-- formatting without calling on_attach (for null-ls)
map("n", "<leader>laf", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })
-- refactoring.nvim
local function set_refactor_shortcuts(params)
	-- do not set shortcuts for java
	if params.file:find(".java") then
		return
	end
	local function buf_map(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = params.buf
		return vim.keymap.set(mode, lhs, rhs, opts)
	end
	buf_map(
		"v",
		"<leader>laef",
		[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
		{ noremap = true, silent = true, desc = "Extract Function" }
	)
	buf_map(
		"v",
		"<leader>laeff",
		[[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
		{ noremap = true, silent = true, desc = "Extract Function To File" }
	)
	buf_map(
		"v",
		"<leader>laev",
		[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
		{ noremap = true, silent = true, desc = "Extract Variable" }
	)
	buf_map({ "n", "v" }, "<leader>laiv", function()
		if keymap_utils.in_vis_mode() then
			vim.api.nvim_input("<Esc>")
		end
		require("refactoring").refactor("Inline Variable")
	end, { noremap = true, silent = true, desc = "Inline Variable" })
end
local set_refactor_shortcuts_aug_id = vim.api.nvim_create_augroup("BufSetRefactorShortcuts", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", { group = set_refactor_shortcuts_aug_id, callback = set_refactor_shortcuts })
-- aerial
local function set_aerial_buf_shortcuts(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- Jump forwards/backwards with '{' and '}'
	map("n", "{", "<cmd>AerialPrev<CR>", opts)
	map("n", "}", "<cmd>AerialNext<CR>", opts)
end
_G.set_aerial_buf_shortcuts = set_aerial_buf_shortcuts
map("n", "<leader>lsa", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
-- vista = tags
map("n", "<leader>lsv", [[:Vista nvim_lsp<CR>]], { noremap = true, silent = true })
--
map("n", "<Esc>", function()
	vim.cmd([[cclose]])
	vim.cmd([[Vista!]])
	vim.cmd([[AerialClose]])
	vim.cmd([[NvimTreeClose]])
	vim.cmd([[TroubleClose]])
end, { noremap = true, silent = true })
-- NvimTree
map("n", "<leader>nt", [[:NvimTreeToggle<CR>]], { noremap = true, silent = true })
map("n", "<leader>no", function()
	package.loaded.oil.open(vim.fn.getcwd())
end, { desc = "Open cwd in oil" })
-- map("n", "<leader>nc", function()
-- 	package.loaded.oil.open()
-- end, { desc = "Open current file location in oil" })
-- floaterm
map("n", "<F1>", [[:FloatermToggle<CR>]], { noremap = true, silent = true })
map("t", "<F1>", [[<C-\><C-n>:FloatermToggle<CR>]], { noremap = true, silent = true })
map("n", "<C-F1>", [[:FloatermNew<CR>]], { noremap = true, silent = true })
map("t", "<C-F1>", [[<C-\><C-n>:FloatermNew<CR>]], { noremap = true, silent = true })
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
	layout_config = {
		mirror = false,
		prompt_position = "top",
		scroll_speed = 5,
		height = 0.4,
		width = 0.65,
		preview_width = 0.47,
	},
}
local telescope = require("telescope.builtin")
map("n", "<C-g>", function()
	local ok = pcall(telescope.git_files, find_files_opts)
	if not ok then
		telescope.find_files(find_files_opts)
	end
end, { noremap = true, silent = true })
map("n", "<C-p>", function()
	telescope.find_files(find_files_opts)
end, { noremap = true, silent = true })
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
map("v", "<leader>og", function()
	telescope.live_grep({
		default_text = get_visual_selection(true),
		initial_mode = "normal",
	})
end, { noremap = true, silent = true, desc = "Grep string under cursor" })
map("n", "<leader>og", function()
	telescope.grep_string({ initial_mode = "normal" })
end, { noremap = true, silent = true, desc = "Grep string under cursor" })
map("n", "<leader>of", function()
	telescope.live_grep()
end, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<leader>on", [[:Telescope notify initial_mode=normal<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovb", [[:Telescope buffers initial_mode=normal<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovm", [[:Telescope keymaps<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovh", [[:Telescope help_tags<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovo", [[:Telescope vim_options<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovl", [[:Telescope highlights<CR>]], { noremap = true, silent = true })
map("n", "<leader>ova", [[:Telescope autocommands<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovc", [[:Telescope commands<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovr", [[:Telescope reloader<CR>]], { noremap = true, silent = true })
-- map("n", "<leader>op", [[:Telescope projects initial_mode=normal<CR>]], { noremap = true, silent = true })
map("n", "<leader>otb", [[:Telescope builtin<CR>]], { noremap = true, silent = true })
map("n", "<leader>ots", [[:TSPlaygroundToggle<CR>]], { noremap = true, silent = true })
-- UndoTree
map("n", "<leader>out", [[:UndotreeToggle<CR>]], { noremap = true, silent = true })
-- todo
map("n", "<leader>otd", [[:TodoQuickFix<CR>]], { noremap = true, silent = true })
-- debug actions
map("n", "<C-F8>", [[:lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
map("n", "<F8>", [[:lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
map("n", "<F6>", [[:lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
map("n", "<F5>", [[:lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
map("n", "<F7>", [[:lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
map("n", "<leader>dr", [[:lua require'dap'.terminate()<CR>]], { noremap = true, silent = true })
local cond_breakpoint_expr = nil
-- set breakpoint condition
map("v", "<leader>db", function()
	vim.cmd('noau normal! "vy"')
	cond_breakpoint_expr = vim.fn.getreg("v")
	-- vim.fn.setreg("v", {})
end, { noremap = true, silent = true })
-- toggle conditional breakpoint
map("n", "<leader>db", function()
	if cond_breakpoint_expr ~= nil then
		-- package.loaded.dap.set_breakpoint()
		package.loaded.dap.set_breakpoint(
			vim.fn.input({ prompt = "Breakpoint condition: ", default = cond_breakpoint_expr })
		)
		cond_breakpoint_expr = nil
	else
		package.loaded.dap.toggle_breakpoint()
	end
end, { noremap = true, silent = true })
map("n", "<leader>dB", function()
	package.loaded.dap.set_breakpoint(vim.fn.input({ prompt = "Breakpoint condition: " }))
end, { noremap = true, silent = true })
map("n", "<leader>dc", [[:lua require'dap'.clear_breakpoints()<CR>]], { noremap = true, silent = true })
map(
	"n",
	"<leader>dL",
	[[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]],
	{ noremap = true, silent = true }
)
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
-- scratch buffers
map("n", "<leader>llf", [[:vsplit | e /tmp/scratch<CR>]], { noremap = true })
map("n", "<leader>llx", [[:Luapad<CR>]], { noremap = true })
-- map("n", "<leader>la", [[:lua require('luapad').toggle()<CR>]], { noremap = true })

-- git stuff
-- status
map("n", "<leader>gs", [[:DiffviewOpen HEAD<CR> :Git<CR> <bar> :resize -7<CR>]], { noremap = true, silent = true })
-- log
map("n", "<leader>gla", [[:DiffviewFileHistory<CR>]], { noremap = true, silent = true })
map("n", "<leader>glf", [[:DiffviewFileHistory %<CR>]], { noremap = true, silent = true })
-- diff
map("n", "<leader>gdm", [[:tabnew <bar> :b# <bar> :Gvdiffsplit!<CR>]], { noremap = true, silent = true })
map("n", "<leader>gdf", [[:DiffviewOpen HEAD -- %:p<CR> <bar> <C-w>l<C-w>l]], { noremap = true, silent = true })
map("n", "<leader>gda", [[:DiffviewOpen HEAD]], { noremap = true })
-- remote
map("n", "<leader>grp", [[:Git push<CR>]], { noremap = true, silent = true })
map("n", "<leader>grl", [[:Git pull<CR>]], { noremap = true, silent = true })
-- git terminal
map(
	"n",
	"<leader>gt",
	[[:FloatermNew --height=0.9 --width=0.7 --wintype=float --name=lazygit --position=center --autoclose=2 lazygit<CR>]],
	{ noremap = true, silent = true }
)
-- gitsigns
local function set_gitsigns_buf_shortcuts(buf_map, gs)
	-- Navigation
	buf_map("n", "<F4>", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
	buf_map("n", "<C-F4>", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
	-- Actions
	buf_map({ "n", "v" }, "<leader>ghs", gs.stage_hunk)
	buf_map({ "n", "v" }, "<leader>ghr", gs.reset_hunk)
	buf_map("n", "<leader>ghS", gs.stage_buffer)
	buf_map("n", "<leader>ghu", gs.undo_stage_hunk)
	buf_map("n", "<leader>ghR", gs.reset_buffer)
	buf_map("n", "<leader>ghp", gs.preview_hunk)
	buf_map("n", "<leader>ghb", function()
		gs.blame_line({ full = true })
	end)
	buf_map("n", "<leader>ghtb", gs.toggle_current_line_blame)
	buf_map("n", "<leader>ghd", gs.diffthis)
	buf_map("n", "<leader>ghD", function()
		gs.diffthis("~")
	end)
	buf_map("n", "<leader>ghtd", gs.toggle_deleted)
	-- Text object
	buf_map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end
_G.set_gitsigns_buf_shortcuts = set_gitsigns_buf_shortcuts

-- project/sessions
map("n", "<leader>ssl", [[:lua require("persistence").load({ last = true })<CR>]], { noremap = true, silent = true })
map("n", "<leader>sso", [[:PersistenceLoad<CR>]], { noremap = true, silent = true })
map("n", "<leader>ssq", [[:lua require("persistence").stop()<CR>]], { noremap = true, silent = true })
map("n", "<leader>ssd", [[:PersistenceDeleteCurrent<CR>]], { noremap = true, silent = true })
-- search-replace
-- map("n", "<C-q>fr", function()
-- 	if #vim.fn.getqflist() == 0 then
-- 		vim.cmd("echo 'No quickfix list'")
-- 		return
-- 	end
-- 	local selection = vim.fn.input({ prompt = "Search: " })
-- 	local replacement = vim.fn.input({ prompt = "Replace with: " })
-- 	if selection ~= "" and replacement ~= "" then
-- 		vim.cmd("cdo s/" .. vim.fn.escape(selection, "/.") .. "/" .. vim.fn.escape(replacement, "/") .. "/cI")
-- 	end
-- end, { noremap = true, silent = true })
map({ "v", "n" }, "<C-q><C-r>", function()
	if #vim.fn.getqflist() == 0 then
		vim.cmd("echo 'No quickfix list'")
		return
	end
	local search
	if keymap_utils.in_vis_mode() then
		vim.cmd('noau normal! "vy"')
		search = vim.fn.getreg("v")
	else
		search = vim.fn.input({ prompt = "Search: " })
	end
	local replacement = vim.fn.input({ prompt = "Replace with: " })
	vim.cmd("cdo s/" .. vim.fn.escape(search, "/.") .. "/" .. vim.fn.escape(replacement, "/") .. "/cI")
end, { noremap = true, silent = true, desc = "Replace within quickfix entries" })
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
-- rest
map("n", "<leader>lhe", [[:RestNvimSelectEnv ]], { noremap = true, silent = false })
map("n", "<leader>lhr", [[<cmd>RestNvimRun<CR>]], { noremap = true, silent = true })
map("n", "<leader>lhp", [[<cmd>RestNvimPreview<CR>]], { noremap = true, silent = true })
map("n", "<leader>lhl", [[<cmd>RestNvimRunLast<CR>]], { noremap = true, silent = true })
-- prettify json
map("n", "<leader>ljp", [[:%!jq<CR>]], { noremap = true, silent = false })
map("v", "<leader>ljp", [[:!jq<CR>]], { noremap = true, silent = false })
map("n", "<leader>ljm", [[:%!jq -c<CR>]], { noremap = true, silent = false })
map("v", "<leader>ljm", [[:!jq -c<CR>]], { noremap = true, silent = false })
