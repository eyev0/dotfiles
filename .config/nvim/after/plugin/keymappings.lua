local map = vim.api.nvim_set_keymap

-- go full lua
vim.cmd[[unmap <Space>]]
map('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Packer
map('n', '<Leader>ps', [[:PackerSync<CR>]], { noremap = true })
-- buffers stuff
map('n', '<leader>wq', [[:BufDel<CR>]], { noremap = true, silent = true })
map('n', '<M-w>', [[:wincmd q<CR>]], { noremap = true, silent = true })
-- create splits faster
map('n', '<leader>x', [[:wincmd s<CR>]], { noremap = true, silent = true })
map('n', '<leader>v', [[:wincmd v<CR>]], { noremap = true, silent = true })
-- better indenting
map('v', '<', '<gv', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})
-- clear last search
map('n', '<C-c>', [[:let @/=""<CR>]], { noremap = true, silent = true })
-- hacking search with visual mode
-- search within current selection
map('x', '/i', [[<Esc>/\%V]], { noremap = true })
-- search for selected text
map('v', '/a', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true })
-- jj to escape as well as C-c
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
map('n', '<leader>V', [[ggVG]], { silent = true })
-- yank to EOL
map('n', 'Y', [[y$]], { silent = true })
-- Toggle inline git-blame
map('n', 'yog', ':call ToggleGitBlameText()<CR>', {noremap = true, silent = true})

-- plugin shortcuts
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
-- navigation
if (vim.g.vscode ~= 1) then
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

  map('n', '<C-h>', [[:TmuxNavigateLeft<cr>]], { noremap = true, silent = true })
  map('n', '<C-j>', [[:TmuxNavigateDown<cr>]], { noremap = true, silent = true })
  map('n', '<C-k>', [[:TmuxNavigateUp<cr>]], { noremap = true, silent = true })
  map('n', '<C-l>', [[:TmuxNavigateRight<cr>]], { noremap = true, silent = true })

  map('n', '<leader>n', [[:NvimTreeToggle<CR>]], { noremap = true, silent = true })
  map('n', '<C-p>', [[:lua require'conf.telescope'.project_files()<CR>]], { noremap = true, silent = true })
  map('n', '<leader>fs', [[:Telescope live_grep<cr>]], { noremap = true, silent = true })
  map('n', '<leader>fo', [[:Telescope buffers<cr>]], { noremap = true, silent = true })
  map('n', '<leader>fm', [[:Telescope keymaps<cr>]], { noremap = true, silent = true })
  map('n', '<leader>fh', [[:Telescope help_tags<cr>]], { noremap = true, silent = true })
  map('n', '<leader>fv', [[:Telescope vim_options<cr>]], { noremap = true, silent = true })
  map('n', '<leader>fl', [[:Telescope highlights<cr>]], { noremap = true, silent = true })
  map('n', '<leader>fa', [[:Telescope autocommands<cr>]], { noremap = true, silent = true })
  -- Toggle inline git-blame
  map('n', 'yog', ':call ToggleGitBlameText()<CR>', {noremap = true, silent = true})
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
end
