-- source old config
-- vim.cmd('source ~/.config/nvim/vimscript/init.vim')

-- neovim python api
vim.g.python3_host_prog = "$HOME/.venvs/neovim/bin/python"

vim.o.completeopt = "menuone,noselect,preview"

vim.cmd("set whichwrap+=<,>,[,],h,l") -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller

vim.o.hidden = true
vim.o.confirm = true
vim.o.swapfile = false
vim.o.autowrite = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.cmd([[set undodir=~/.vim/undodir]])
vim.o.updatetime = 100
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
O.set_scrolloffs()
vim.wo.relativenumber = true
vim.wo.number = true
-- vim.cmd[[set signcolumn=auto:1-3]]
vim.cmd([[set signcolumn=yes:1]])
-- vim.wo.colorcolumn = "80"
vim.o.showmode = false
vim.opt.clipboard:prepend({ "unnamedplus" })
vim.o.termguicolors = true
vim.cmd([[set shortmess+=c]])
vim.cmd([[set iskeyword+=-]])
vim.o.conceallevel = 3 -- So that I can see `` in markdown files
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.foldmethod = "expr"
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
vim.o.foldlevelstart = 99
-- vim.o.langmap="ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"

-- tmux italics
vim.cmd([[let &t_ZH="\e[3m"]])
vim.cmd([[let &t_ZR="\e[23m"]])

-- tmux cursor
vim.cmd([[
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
if exists('$TMUX')
   " set insert mode to a cyan vertical line   
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>[6 q\<esc>\\"
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>]12;cyan\x7\<esc>\\"
   " set normal mode to a green block
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>]12;green\x7\<esc>\\"
   " set replace mode to an orange underscore
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>[4 q\<esc>\\"
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>]12;orange\x7\<esc>\\"

   " initialize cursor shape/color on startup (silent !echo approach doesn't seem to work for tmux)
   augroup ResetCursorShape
      au!
      "autocmd VimEnter * startinsert | stopinsert
      autocmd VimEnter * normal! :startinsert :stopinsert
      "autocmd VimEnter * :normal :startinsert :stopinsert
   augroup END

   " reset cursor when leaving tmux
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033]12;gray\007\033\\"
 endif
]])

-- highlight yank for a short period of time
vim.cmd([[au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})]])

-- gui stuff
vim.cmd([[au UIEnter * let g:has_gui=1]])
vim.cmd([[
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guifont=Source\ Code\ Pro\ Medium:h13
]])

-- plugin settings
--
--
-- disable highlighting matching parens
vim.g.loaded_matchparen = 1
-- firenvim
vim.g.firenvim_config = {
	["globalSettings"] = { ["takeover"] = "never" },
	-- ["localSettings"] = { [".*"] = { ["takeover"] = "never" } },
}
-- quick-scope
vim.g.qs_max_chars = 150
vim.g.qs_lazy_highlight = 1
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
-- Yoink
vim.g.yoinkMaxItems = 20
vim.g.yoinkIncludeDeleteOperations = 1
vim.g.yoinkMoveCursorToEndOfPaste = 1
vim.g.yoinkSavePersistently = 0
if vim.fn.executable("rg") then
	vim.g.rg_derive_root = "true"
end
-- tmux-navigator
vim.g.tmux_navigator_no_mappings = 1
-- vimspector (dir not working)
-- vim.g.vimspector_base_dir = vim.fn.expand("$HOME/.vim/vimspector-config")
-- vim.g.vimspector_install_gadgets = { "debugpy", "vscode-node-debug2" }
--
vim.g.Illuminate_delay = 30
