-- source old config
-- vim.cmd('source ~/.config/nvim/vimscript/init.vim')

-- neovim python api
vim.g.python3_host_prog = '$HOME/.venvs/neovim/bin/python'

vim.o.completeopt = "menuone,noselect,preview"

vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller

vim.o.hidden = true
vim.o.confirm = true
vim.o.swapfile = false
vim.o.autowrite = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.cmd[[set undodir=~/.vim/undodir]]
vim.o.updatetime = 35
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.ttimeout = false
vim.o.shiftround = true
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.mouse = "a"
vim.o.ruler = true
vim.o.laststatus = 2
vim.o.cmdheight = 2
vim.o.title = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.startofline = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ttyfast = true
vim.o.lazyredraw = true
vim.o.wrapscan = true
vim.o.report = 0
vim.o.synmaxcol = 200
vim.wo.cursorline = true
vim.o.scrolloff = 9
vim.o.sidescrolloff = 3
vim.wo.relativenumber = true
vim.wo.number = true
-- vim.cmd[[set signcolumn=auto:1-3]]
vim.cmd[[set signcolumn=yes:2]]
vim.wo.colorcolumn = "80"
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.cmd[[set shortmess+=c]]
vim.cmd[[set iskeyword+=-]]
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.foldmethod = "expr"
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
vim.o.foldlevelstart = 99
-- vim.o.langmap="ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"

-- highlight yank for a short period of time
vim.cmd[[au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})]]

--gui stuff
vim.cmd[[
au UIEnter * let g:has_gui=1
]]
vim.cmd[[
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guifont=Source\ Code\ Pro\ Medium:h13
]]

-- plugin settings
--
--
-- disable highlighting matching parens
vim.g.loaded_matchparen = 1
-- firenvim
vim.g.firenvim_config = {
  ['globalSettings'] = {},
  ['localSettings'] = {['.*'] = { ['takeover'] = 'never' }}
}
-- quick-scope
vim.g.qs_max_chars = 150
vim.g.qs_lazy_highlight = 1
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
-- ALE, use only for fixing
vim.g.ale_disable_lsp = 1
-- vim.g.ale_linters = {}
vim.g.ale_linters_explicit = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_fixers = {
  ['python'] = {'black', 'isort', 'trim_whitespace'},
  ['xml'] = {'xmllint', 'remove_trailing_lines', 'trim_whitespace'},
  ['javascript'] = {'prettier'},
  ['javascriptreact'] = {'prettier'},
  ['typescript'] = {'prettier'},
  ['typescriptreact'] = {'prettier'},
  ['graphql'] = {'prettier'},
  ['json'] = {'prettier'},
  ['vue'] = {'prettier'},
  ['html'] = {'prettier'},
  ['lua'] = {'luafmt', 'trim_whitespace', 'remove_trailing_lines'},
}
-- Yoink
vim.g.yoinkMaxItems = 20
vim.g.yoinkIncludeDeleteOperations = 1
vim.g.yoinkMoveCursorToEndOfPaste = 1
vim.g.yoinkSavePersistently = 1
if vim.fn.executable('rg') then
  vim.g.rg_derive_root='true'
end
-- vim.g.tagbar_autofocus = 1
-- vim.g.tagbar_autoclose = 1
-- vim.g.tagbar_map_showproto = ''
vim.g.tmux_navigator_no_mappings = 1
-- vim-visual-multi
vim.g.VM_default_mappings = 0
vim.cmd[[
let g:VM_maps = {}
let g:VM_maps["Find Under"]                  = '<C-n>'
let g:VM_maps["Find Subword Under"]          = '<C-n>'
let g:VM_maps["Select All"]                  = '\A'
let g:VM_maps["Start Regex Search"]          = '\/'
let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
let g:VM_maps["Add Cursor At Pos"]           = '\\'
let g:VM_maps["Visual Regex"]                = '\r'
let g:VM_maps["Visual All"]                  = '\A'
let g:VM_maps["Visual Add"]                  = '\a'
let g:VM_maps["Visual Find"]                 = '\f'
let g:VM_maps["Visual Cursors"]              = '\c'
]]
