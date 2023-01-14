-- source old config
-- vim.cmd('source ~/.config/nvim/vimscript/init.vim')

-- neovim python api
vim.g.python3_host_prog = "$HOME/.venvs/neovim/bin/python"

vim.o.completeopt = "menuone,noselect,preview"

vim.opt.whichwrap:append("<,>,[,],h,l") -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller

vim.o.hidden = true
vim.o.confirm = true
vim.o.swapfile = false
vim.o.autowrite = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.vim/undodir")
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
vim.o.lazyredraw = false
vim.o.wrapscan = true
vim.o.report = 0
vim.o.synmaxcol = 300
vim.wo.cursorline = true
vim.o.scrolloff = O.scrolloff
vim.o.sidescrolloff = O.sidescrolloff
vim.wo.relativenumber = true
vim.wo.number = true
-- vim.wo.colorcolumn = "80"
vim.o.showmode = false
vim.opt.signcolumn = "yes:2"
vim.opt.clipboard:prepend({ "unnamedplus" })
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.o.termguicolors = true
vim.o.conceallevel = 0
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99
vim.o.splitkeep = "screen"
-- vim.o.langmap="ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"
