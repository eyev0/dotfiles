let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +13 init.lua
badd +1 .nvim
badd +320 lua/plugins.lua
badd +1 TODO
badd +1 ftdetect/keymap.vim
badd +119 after/plugin/keymappings.lua
badd +1 lua/conf/lightbulb.lua
badd +1 lua/conf/dashboard.lua
badd +13 lua/conf/telescope.lua
badd +20 lua/conf/project.lua
badd +1 lua/conf/indentguides.lua
badd +111 lua/conf/lualine.lua
badd +1 lua/conf/persistence.lua
badd +1 lua/conf/scrollbar.lua
badd +1 lua/options.lua
badd +23 lua/globals.lua
badd +29 lua/conf/dap/init.lua
badd +146 lua/conf/treesitter.lua
badd +16 lua/conf/lsp/init.lua
badd +46 lua/colorscheme.lua
badd +57 lua/conf/todo-comments.lua
badd +32 lua/conf/gitsigns.lua
badd +114 lua/conf/cmp.lua
badd +2 ~/.config/nvim/lua/preload.lua
badd +23 ./lua/conf/dap/node2.lua
argglobal
%argdel
$argadd init.lua
edit lua/plugins.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ./lua/conf/dap/node2.lua
let s:l = 320 - ((27 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 320
normal! 04|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFcI
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
