let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim/lua
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +4 conf/lsp/pyright.lua
badd +20 lua/configure/autopairs.lua
badd +168 keymappings.lua
badd +6 plugins.lua
badd +6 lua/configure/outline.lua
badd +79 lua/configure/treesitter.lua
badd +61 lua/configure/nvim_tree.lua
badd +11 ~/.config/nvim/init.lua
badd +11 lua/configure/indentguides.lua
badd +27 colorscheme.lua
badd +37 conf/lsp/init.lua
badd +1 utils.lua
badd +57 utils/inline_gitblame.lua
badd +107 options.lua
badd +10 globals.lua
badd +5 utils/local_nvimrc.lua
badd +4 utils/trim_whitespace.lua
badd +1 ~/.config/nvim/after/plugin/maps.vim
badd +14 conf/outline.lua
badd +50 conf/nvim_tree.lua
badd +20 conf/autopairs.lua
badd +32 conf/diffview.lua
badd +37 conf/gitsigns.lua
badd +94 conf/treesitter.lua
badd +4 conf/revj.lua
badd +20 conf/telescope.lua
badd +31 conf/compe.lua
badd +4 conf/lspsaga.lua
badd +36 conf/lsp/shared_conf.lua
badd +136 ~/.config/nvim/vimscript/init.vim
badd +74 conf/lualine.lua
badd +10 conf/indentguides.lua
badd +4 conf/lsp/yamlls.lua
badd +4 conf/lsp/vuels.lua
badd +1 ~/.config/nvim/ftplugin/html.vim
badd +1 ~/.config/nvim/ftplugin/vue.vim
badd +4 conf/cmdbuf.lua
badd +271 /usr/local/share/nvim/runtime/doc/autocmd.txt
badd +1 conf/lsp/sumneko.lua
badd +9 types.lua
badd +45 conf/lsp/tsserver.lua
badd +5 conf/lsp/rust_analyzer.lua
badd +14 conf/lsp/efm.lua
badd +4 conf/lsp/html.lua
badd +1 conf/lsp/bashls.lua
badd +1 conf/lsp/clangd.lua
badd +4 conf/lsp/jsonls.lua
badd +4 conf/lsp/dockerls.lua
badd +1 FAR\ 2
badd +1 conf/lsp/FAR\ 3
badd +1 conf/lsp/FAR\ 4
badd +2 ~/.config/nvim/FAR\ 5
badd +2 ~/.config/nvim/FAR\ 6
badd +2 ~/.config/nvim/FAR\ 1
badd +2 ~/.config/nvim/FAR\ 7
badd +9 ~/.config/nvim/FAR\ 8
badd +1 ~/.config/nvim/FAR\ 10
badd +2 ~/.config/nvim/FAR\ 11
badd +93 ~/.config/nvim/FAR\ 12
badd +5 conf/far.lua
badd +1 conf/FAR\ 9
badd +17 conf/FAR\ 13
badd +1 conf/FAR\ 14
badd +2 conf/FAR\ 16
badd +1 conf/FAR\ 18
badd +1 conf/FAR\ 22
badd +3 FAR\ 17
badd +1 FAR\ 20
badd +1 FAR\ 23
badd +1 FAR\ 24
badd +1 man://local(n)
badd +8 FAR\ 19
badd +1 FAR\ 25
badd +16 FAR\ 27
badd +1 efm.lua
badd +13 FAR\ 29
argglobal
%argdel
edit conf/lsp/efm.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt conf/far.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
18
normal! zo
37
normal! zo
let s:l = 51 - ((42 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 51
normal! 03|
wincmd w
argglobal
if bufexists("conf/lsp/shared_conf.lua") | buffer conf/lsp/shared_conf.lua | else | edit conf/lsp/shared_conf.lua | endif
if &buftype ==# 'terminal'
  silent file conf/lsp/shared_conf.lua
endif
balt conf/far.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10 - ((9 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 0
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
