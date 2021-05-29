local map = vim.api.nvim_set_keymap

-- go full lua
vim.cmd[[unmap <Space>]]
map('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Packer
map('n', '<Leader>ps', [[:PackerSync<CR>]], { noremap = true })
map('n', '<Leader>pi', [[:PackerInstall<CR>]], { noremap = true })
map('n', '<Leader>pc', [[:PackerCompile<CR>]], { noremap = true })
-- save buffer and edit
-- map('n', '<leader>sf', [[:w <bar> :e<CR>]], { noremap = true, silent = true })
-- easier navigation, also powered by tmux
map('n', '<C-h>', [[:TmuxNavigateLeft<cr>]], { noremap = true, silent = true })
map('n', '<C-j>', [[:TmuxNavigateDown<cr>]], { noremap = true, silent = true })
map('n', '<C-k>', [[:TmuxNavigateUp<cr>]], { noremap = true, silent = true })
map('n', '<C-l>', [[:TmuxNavigateRight<cr>]], { noremap = true, silent = true })
-- buffers stuff
map('n', '<leader>wq', [[:BufDel<CR>]], { noremap = true, silent = true })
map('n', '<M-w>', [[:wincmd q<CR>]], { noremap = true, silent = true })
-- create splits faster
map('n', '<leader>x', [[:wincmd s<CR>]], { noremap = true, silent = true })
map('n', '<leader>v', [[:wincmd v<CR>]], { noremap = true, silent = true })
-- faster enew
map('n', '<leader>en', [[:enew<CR>]], { noremap = true, silent = true })
-- tabs stuff
map('n', '<leader>tn', [[:tabnew<CR>]], { noremap = true, silent = true })
map('n', '<leader>tq', [[:tabc<CR>]], { noremap = true, silent = true })
-- Arrows switch tabs
map('n', '<Right>', ':tabnext<CR>', {noremap = true, silent = true})
map('n', '<Left>', ':tabprevious<CR>', {noremap = true, silent = true})
-- resize with C-arrows
map('', '<C-Up>', [[:resize -2<CR>]], { noremap = true, silent = true })
map('', '<C-Down>', [[:resize +2<CR>]], { noremap = true, silent = true })
map('', '<C-Left>', [[:vertical resize -2<CR>]], { noremap = true, silent = true })
map('', '<C-Right>', [[:vertical resize +2<CR>]], { noremap = true, silent = true })
-- better indenting
map('v', '<', '<gv', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})
-- clear last search
map('n', '<C-c>', [[:let @/=""<CR>]], { noremap = true, silent = true })
-- hacking search with visual mode
map('x', '<leader>/', [[<Esc>/\%V]], { noremap = true, silent = true })
map('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })
-- jj to escape as well as C-c
-- map('i', '<C-c>', [[<C-o><Esc>]], { noremap = true, silent = true })
map('i', 'jj', '<ESC>', {noremap = true, silent = true})
map('t', '<C-]>', '<C-\\><C-n>', {noremap = true, silent = true})
-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})
-- handy to move around on the line
map('', 'H', [[^]], { noremap = true, silent = true })
map('', 'L', [[$]], { noremap = true, silent = true })
-- disjoin line
map('n', 'dJ', [[i<CR><Esc>k$]], { noremap = true, silent = true })
-- yank and select whole file
map('n', '<leader>Y', [[gg"+yG]], { silent = true })
map('n', '<leader>V', [[ggvG]], { silent = true })
-- paste at the end of current line
map('n', '<leader>P', [[$p]], { silent = true })
map('n', 'Y', [[y$]], { silent = true })
-- Toggle inline git-blame
map('n', 'yog', ':call ToggleGitBlameText()<CR>', {noremap = true, silent = true})
-- Toggle lsp diagnostics preview window auto-popup
map('n', 'yoe', ':call ToggleDiagnosticsPreviewText()<CR>', {noremap = true, silent = true})
-- sometimes scrolloff gets messed up for no obvious reason
map('n', '<leader>sso', [[:set scrolloff=9 <bar> :set sidescrolloff=3]], { noremap = true, silent = true })
-- quickfix stuff
map('n', '<C-q><C-q>', [[:cclose<CR>]], { noremap = true, silent = true })
map('n', '<C-q><C-o>', [[:copen<CR>]], { noremap = true, silent = true })
map('n', '<C-q><C-n>', [[:cnewer<CR>]], { noremap = true, silent = true })
map('n', '<C-q><C-p>', [[:colder<CR>]], { noremap = true, silent = true })
map('n', '<C-q><C-j>', [[:cnext<CR>]], { noremap = true, silent = true })
map('n', '<C-q><C-k>', [[:cprevious<CR>]], { noremap = true, silent = true })
-- handy set filetype
map('n', '<leader>st', [[:set ft=]], { noremap = true, silent = false })
-- toggle fold
map('n', 'gz', [[za]], { noremap = false, silent = true })

-- plugin shortcuts
-- completion
map('i', '<C-space>', [[compe#complete()]], { noremap=true, silent=true, expr=true })
map('i', '<CR>', 'v:lua.completion_confirm()', {expr = true , noremap = true})
map('i', '<C-e>', [[compe#close('<C-e>')]], { noremap=true, silent=true, expr=true })
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vsnip - Expand snippet
map('i', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], { silent = true, expr = true })
map('s', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], { silent = true, expr = true })
-- NvimTree
map('n', '<leader>n', [[:NvimTreeToggle<CR>]], { noremap = true, silent = true })
map('n', '<leader><leader>n', [[:NvimTreeFindFile<CR>]], { noremap = true, silent = true })
-- s for substitute
map('n', 's', [[<plug>(SubversiveSubstitute)]], { silent = true })
map('n', 'ss', [[<plug>(SubversiveSubstituteLine)]], { silent = true })
map('n', 'S', [[<plug>(SubversiveSubstituteToEndOfLine)]], { silent = true })
-- yank-delete
map('n', 'x', [[d]], { noremap = true, silent = true })
map('x', 'x', [[d]], { noremap = true, silent = true })
map('n', 'xx', [[dd]], { noremap = true, silent = true })
map('n', 'X', [[D]], { noremap = true, silent = true })
-- Yoink maps
map('n', 'p', [[<plug>(YoinkPaste_p)]], { silent = true })
map('n', 'P', [[<plug>(YoinkPaste_P)]], { silent = true })
map('n', '[r', [[<plug>(YoinkRotateBack)]], { silent = true })
map('n', ']r', [[<plug>(YoinkRotateForward)]], { silent = true })
map('n', 'y', [[<plug>(YoinkYankPreserveCursorPosition)]], { silent = true })
map('x', 'y', [[<plug>(YoinkYankPreserveCursorPosition)]], { silent = true })
-- floating lazygit = awesome
map('n', 'gt', [[<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>]], { noremap=true, silent=true })
map('t', '<M-w>', [[<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]], { silent=true })
-- vimspector
vim.cmd[[
func GotoWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfun
]]
map('n', '<leader>dd', [[:call vimspector#Launch()<CR>]], { noremap = true, silent = true })
map('n', '<leader>de', [[:call vimspector#Reset()<CR>]], { silent = true })
map('n', '<leader>dc', [[:call vimspector#ClearBreakpoints()<CR>]], { silent = true })
map('n', '<leader>ds', [[<Plug>VimspectorToggleBreakpoint]], { silent = true })
-- for normal mode - preview the word under the cursor
map('n', '<Leader>di', [[<Plug>VimspectorBalloonEval]], { silent = true })
-- for visual mode, preview visually selected text
map('x', '<Leader>di', [[<Plug>VimspectorBalloonEval]], { silent = true })
map('n', '<F5>', [[<Plug>VimspectorStepInto]], { silent = true })
map('n', '<F6>', [[<Plug>VimspectorStepOver]], { silent = true })
map('n', '<F7>', [[<Plug>VimspectorStepOut]], { silent = true })
map('n', '<F8>', [[<Plug>VimspectorContinue]], { silent = true })
map('n', '<F9>', [[<Plug>VimspectorRunToCursor]], { silent = true })
-- Maximizer
map('n', '<leader>m', [[:MaximizerToggle!<CR>]], { noremap = true, silent = true })
-- Telescope
map('n', '<C-p>', [[:Telescope find_files<CR>]], { noremap = true, silent = true })
map('n', '<leader><C-p>', [[:Telescope git_files<cr>]], { noremap = true, silent = true })
map('n', '<leader>fs', [[:Telescope live_grep<cr>]], { noremap = true, silent = true })
map('n', '<leader>fo', [[:Telescope buffers<cr>]], { noremap = true, silent = true })
map('n', '<leader>fm', [[:Telescope keymaps<cr>]], { noremap = true, silent = true })
map('n', '<leader>fh', [[:Telescope help_tags<cr>]], { noremap = true, silent = true })
map('n', '<leader>fv', [[:Telescope vim_options<cr>]], { noremap = true, silent = true })
map('n', '<leader>fl', [[:Telescope highlights<cr>]], { noremap = true, silent = true })
map('n', '<leader>fa', [[:Telescope autocommands<cr>]], { noremap = true, silent = true })
-- symbols_outline
map('n', '<leader>so', [[:SymbolsOutline<CR>]], { noremap = true, silent = true })
-- treesitter playground
map('n', '<leader>tsp', [[:TSPlaygroundToggle<CR>]], { noremap = true, silent = true })
-- git stuff
map('n', 'gss', [[:tab Git<CR>]], { noremap = true, silent = true })
map('n', 'glg', [[:tabnew <bar> Gclog -50 <bar> copen<CR>]], { noremap = true, silent = true })
map('n', 'gls', [[:tabnew <bar> Gclog -50 --stat <bar> copen<CR>]], { noremap = true, silent = true })
map('n', 'glf', [[:tabnew <bar> :b# <bar> :Gclog -50 -- % <bar> copen<CR>]], { noremap = true, silent = true })
map('n', 'gd', [[:tabnew <bar> :b# <bar> :Gvdiffsplit! HEAD<CR>]], { noremap = true, silent = true })
map('n', 'gb', [[:Git blame<CR>]], { noremap = true, silent = true })
map('n', 'gp', [[:Git push<CR>]], { noremap = true, silent = true })
map('n', 'gll', [[:Git pull<CR>]], { noremap = true, silent = true })
-- Diffview.nvim
map('n', '<leader>dv', [[:DiffviewOpen HEAD]], { noremap = true })
-- UndoTree
map('n', '<leader>ut', [[:UndotreeToggle<CR>]], { noremap = true, silent = true })
-- ALE fixes things
map('n', '<leader>rf', [[:ALEFix<CR>]], { noremap = true, silent = true })
-- far.vim
map('n', '<leader>ff', [[:Farf<CR>]], { noremap = true, silent = true })
map('v', '<leader>ff', [[:Farf<CR>]], { noremap = true, silent = true })
