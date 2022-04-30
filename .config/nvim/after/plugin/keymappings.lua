local map = vim.api.nvim_set_keymap

-- go full lua
vim.cmd([[unmap <Space>]])
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Packer
map("n", "<leader>ps", [[:PackerSync<CR>]], { noremap = true })
-- map("n", "<Leader>pi", [[:PackerInstall<CR>]], { noremap = true })
map("n", "<leader>pc", [[:PackerCompile<CR>]], { noremap = true })
-- easier navigation, also powered by tmux
map("n", "<C-h>", [[:TmuxNavigateLeft<cr>]], { noremap = true, silent = true })
map("n", "<C-j>", [[:TmuxNavigateDown<cr>]], { noremap = true, silent = true })
map("n", "<C-k>", [[:TmuxNavigateUp<cr>]], { noremap = true, silent = true })
map("n", "<C-l>", [[:TmuxNavigateRight<cr>]], { noremap = true, silent = true })
-- redraw screen
map("n", "<M-l>", [[]], { noremap = true, silent = true })
-- buffers stuff
map("n", "<C-w>d", [[:BufDel<CR>]], { noremap = true, silent = true })
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
map("n", "ma", "m", { noremap = true, silent = true })
-- clear last search
map("n", "<C-c>", [[:let @/=""<CR>]], { noremap = true, silent = true })
-- search and J fix
map("n", "n", [[nzzzv]], { noremap = true, silent = true })
map("n", "N", [[Nzzzv]], { noremap = true, silent = true })
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
map("i", "<C-k>", "<C-o>:move .-2<CR><C-o>==", { noremap = true, silent = true })
map("i", "<C-j>", "<C-o>:move .+1<CR><C-o>==", { noremap = true, silent = true })
map("n", "<leader>k", ":move .-2<CR>==", { noremap = true, silent = true })
map("n", "<leader>j", ":move .+1<CR>==", { noremap = true, silent = true })
-- handy to move around on the line
map("", "H", [[^]], { noremap = true, silent = true })
map("", "L", [[$]], { noremap = true, silent = true })
-- yank whole file
map("n", "gY", [[gg"+yG]], { silent = true })
-- visual select whole file
map("n", "gV", [[ggVG]], { silent = true })
-- yank to EOL
map("n", "Y", [[y$]], { silent = true })
-- Toggle inline git-blame
map("n", "yog", ":call ToggleGitBlameText()<CR>", { noremap = true, silent = true })
-- Toggle lsp diagnostics preview window auto-popup
map("n", "<F2>", ":call ToggleDiagnosticsPreviewText()<CR>", { noremap = true, silent = true })
-- quickfix stuff
map("n", "<C-q><C-q>", [[:cclose<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-o>", [[:copen<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-n>", [[:cnewer<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-p>", [[:colder<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-j>", [[:cnext<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-k>", [[:cprevious<CR>]], { noremap = true, silent = true })
-- handy set filetype
map("n", "<leader>sft", [[:set ft=]], { noremap = true, silent = false })
-- sometimes scrolloff gets messed up for no obvious reason
map("n", "<leader>sso", [[:lua O.set_scrolloffs()<CR>]], { noremap = true, silent = true })

-- plugin shortcuts
-- lsp
local function set_lsp_buf_shortcuts(_, bufnr)
	local function map(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	map("n", "<leader>ld", ":Trouble lsp_definitions<CR>", { noremap = true, silent = true })
	map("n", "<leader>lr", ":Trouble lsp_references<CR>", { noremap = true, silent = true })
	map("n", "<leader>li", ":Trouble lsp_implementations<CR>", { noremap = true, silent = true })
	map(
		"n",
		"<C-F3>",
		"<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
		{ noremap = true, silent = true }
	)
	map(
		"n",
		"<F3>",
		"<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
		{ noremap = true, silent = true }
	)
	map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
	map("n", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
	map("i", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
	map("n", "<leader>lar", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
	-- map("n", "<CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
	map("n", "<CR>", ":CodeActionMenu<CR>", { noremap = true, silent = true })
	map("v", "<CR>", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
end
_G.set_lsp_buf_shortcuts = set_lsp_buf_shortcuts
-- formatting without calling on_attach (for null-ls)
map("n", "<leader>laf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
-- map("n", "<F11>", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
map("v", "<leader>laf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
-- map("v", "<F11", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
-- lsptrouble
-- map("n", "<leader>ge", ":TroubleToggle<CR>", { noremap = true, silent = true })
map("n", "<Esc>", ":TroubleClose<CR>", { noremap = false, silent = true })
-- vista = tags
map("n", "<leader>ls", [[:Vista nvim_lsp<CR>]], { noremap = true, silent = true })
-- NvimTree
map("n", "<leader>n", [[:NvimTreeToggle<CR>]], { noremap = true, silent = true })
-- s for substitute
map("n", "s", [[<plug>(SubversiveSubstitute)]], { silent = true })
map("n", "ss", [[<plug>(SubversiveSubstituteLine)]], { silent = true })
map("n", "S", [[<plug>(SubversiveSubstituteToEndOfLine)]], { silent = true })
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
-- debug actions
map("n", "<C-F8>", [[:lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
map("n", "<F8>", [[:lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
map("n", "<F6>", [[:lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
map("n", "<F5>", [[:lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
map("n", "<F7>", [[:lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
map("n", "<leader>dr", [[:lua require'dap'.terminate()<CR> <bar> :tabonly<CR>]], { noremap = true, silent = true })
map("n", "<leader>db", [[:lua require'dap'.toggle_breakpoint()<CR>]], { noremap = true, silent = true })
map(
	"n",
	"<leader>dB",
	[[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]],
	{ noremap = true, silent = true }
)
map("n", "<leader>dcb", [[:lua require'dap'.clear_breakpoints()<CR>]], { noremap = true, silent = true })
map(
	"n",
	"<leader>dL",
	[[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]],
	{ noremap = true, silent = true }
)
map("n", "<leader>du", [[:lua require'dapui'.toggle()<CR>]], { noremap = true, silent = true })
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
map("n", "<leader>xf", [[:vsplit | e /tmp/scratch<CR>]], { noremap = true })
map("n", "<leader>xl", [[:Luapad<CR>]], { noremap = true })
-- map("n", "<leader>la", [[:lua require('luapad').toggle()<CR>]], { noremap = true })
-- Telescope - opener
map("n", "<C-p>", [[:lua require'conf.telescope'.project_files()<CR>]], { noremap = true, silent = true })
map("n", "<leader>of", [[:Telescope live_grep<cr>]], { noremap = true, silent = true })
map("n", "<leader>og", [[yiw<bar>:Telescope live_grep<CR><C-R>"]], { noremap = true, silent = true })
map("v", "<leader>og", [[y<bar>:Telescope live_grep<CR><C-R>"]], { noremap = true, silent = true })
map("n", "<leader>ob", [[:Telescope buffers<cr>]], { noremap = true, silent = true })
map("n", "<leader>ovm", [[:Telescope keymaps<cr>]], { noremap = true, silent = true })
map("n", "<leader>ovh", [[:Telescope help_tags<cr>]], { noremap = true, silent = true })
map("n", "<leader>ovo", [[:Telescope vim_options<cr>]], { noremap = true, silent = true })
map("n", "<leader>ovl", [[:Telescope highlights<cr>]], { noremap = true, silent = true })
map("n", "<leader>ova", [[:Telescope autocommands<cr>]], { noremap = true, silent = true })
map("n", "<leader>ovc", [[:Telescope commands<cr>]], { noremap = true, silent = true })
map("n", "<leader>or", [[:Telescope reloader<cr>]], { noremap = true, silent = true })
map("n", "<leader>op", [[:Telescope projects<cr>]], { noremap = true, silent = true })
map("n", "<leader>otb", [[:Telescope builtin<cr>]], { noremap = true, silent = true })
map("n", "<leader>ots", [[:TSPlaygroundToggle<CR>]], { noremap = true, silent = true })
-- UndoTree
map("n", "<leader>out", [[:UndotreeToggle<CR>]], { noremap = true, silent = true })

-- git stuff
-- status
map("n", "<leader>gs", [[:DiffviewOpen HEAD<CR> :Git<CR> <bar> :resize -7<CR>]], { noremap = true, silent = true })
-- log
map("n", "<leader>gla", [[:DiffviewFileHistory .<CR>]], { noremap = true, silent = true })
map("n", "<leader>glf", [[:DiffviewFileHistory<CR>]], { noremap = true, silent = true })
-- diff
map("n", "<leader>gdm", [[:tabnew <bar> :b# <bar> :Gvdiffsplit! HEAD<CR>]], { noremap = true, silent = true })
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
local function set_gitsigns_buf_shortcuts(map, gs)
	-- Navigation
	map("n", "<F4>", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
	map("n", "<C-F4>", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
	-- Actions
	map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>")
	map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>")
	map("n", "<leader>ghS", gs.stage_buffer)
	map("n", "<leader>ghu", gs.undo_stage_hunk)
	map("n", "<leader>ghR", gs.reset_buffer)
	map("n", "<leader>ghp", gs.preview_hunk)
	map("n", "<leader>ghb", function()
		gs.blame_line({ full = true })
	end)
	map("n", "<leader>ghtb", gs.toggle_current_line_blame)
	map("n", "<leader>ghd", gs.diffthis)
	map("n", "<leader>ghD", function()
		gs.diffthis("~")
	end)
	map("n", "<leader>ghtd", gs.toggle_deleted)

	-- Text object
	map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end
_G.set_gitsigns_buf_shortcuts = set_gitsigns_buf_shortcuts

-- project/sessions
map("n", "<leader>sl", [[:lua require("persistence").load({ last = true })<CR>]], { noremap = true, silent = true })
map("n", "<leader>so", [[:PersistenceLoad<CR>]], { noremap = true, silent = true })
map("n", "<leader>sq", [[:lua require("persistence").stop()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sr", [[:PersistenceDeleteCurrent<CR>]], { noremap = true, silent = true })
map("n", "<leader>sd", [[:ProjectRoot<CR>]], { noremap = true, silent = true }) -- set directory
-- treesitter-unit
map("x", "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
map("x", "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
map("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
map("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
-- harpoon
map("n", "<leader>ha", [[:lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })
map("n", "<leader>hv", [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true, silent = true })
map("n", "<M-a>", [[:lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true })
map("n", "<M-s>", [[:lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true })
map("n", "<M-d>", [[:lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true })
map("n", "<M-f>", [[:lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })
map("n", "<leader>ht", [[:lua require("harpoon.term").gotoTerminal(1)<CR>]], { noremap = true, silent = true })
