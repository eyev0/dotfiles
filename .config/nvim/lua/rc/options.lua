-- neovim python api
vim.g.python3_host_prog = "$HOME/.venvs/neovim/bin/python"

vim.o.completeopt = "menuone,noselect,preview"

vim.opt.whichwrap:append("<,>,[,],h,l") -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller

vim.o.confirm = true
vim.o.swapfile = false
vim.o.autowrite = true
vim.o.writebackup = false
vim.o.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.vim/undodir")
vim.o.updatetime = 100
vim.o.timeoutlen = 300
vim.o.ttimeout = false
vim.o.shiftround = true
vim.o.mouse = "a"
vim.o.laststatus = 3
-- vim.o.cmdheight = 2
vim.o.title = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.startofline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ttyfast = true
vim.o.report = 0
vim.o.synmaxcol = 300
vim.wo.cursorline = true
vim.o.scrolloff = O.scrolloff
vim.o.sidescrolloff = O.sidescrolloff
-- vim.wo.colorcolumn = "80"
vim.o.showmode = false
-- vim.opt.signcolumn = "number"
vim.opt.clipboard:prepend({ "unnamedplus" })
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.o.termguicolors = true
-- vim.o.conceallevel = 0
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99
vim.o.splitkeep = "screen"
vim.o.switchbuf = "usetab,uselast"
vim.o.jumpoptions = "stack"
-- vim.o.langmap="ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"
-- vim.o.statuscolumn = "%=%{v:relnum?v:relnum:0} %{v:lnum}│"
-- vim.o.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "
vim.o.relativenumber = true
vim.o.number = true
vim.o.signcolumn = "yes:2"
vim.o.fillchars = "eob: "

-- disable statuscolumn in non-file buffers
local relnum_ignore_filetypes = { "NvimTree", "fugitive", "DiffviewFiles", "DiffviewFileHistory" }
autocmd("BufEnter", {
  callback = function(opts)
    if vim.tbl_contains(relnum_ignore_filetypes, vim.bo[opts.buf].filetype) then
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = "yes:1"
    end
  end,
})

local function set_wo(window, name, value)
  local eventignore = vim.opt.eventignore:get()
  vim.opt.eventignore:append("OptionSet")
  vim.api.nvim_win_set_option(window, name, value)
  vim.opt.eventignore = eventignore
end
--
-- cursorline
autocmd("WinLeave", {
  callback = function()
    set_wo(vim.api.nvim_get_current_win(), "cursorlineopt", "number")
  end,
})
autocmd("WinEnter", {
  callback = function()
    set_wo(vim.api.nvim_get_current_win(), "cursorlineopt", "screenline,number") -- "both"
  end,
})

-- tmux italics
vim.cmd([[let &t_ZH="\e[3m"]])
vim.cmd([[let &t_ZR="\e[23m"]])

-- gui stuff
vim.cmd([[au UIEnter * let g:has_gui=1]])
vim.cmd([[
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guifont=Source\ Code\ Pro\ Medium:h13
]])
