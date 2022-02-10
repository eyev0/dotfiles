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
badd +38 lua/plugins.lua
badd +10 after/plugin/keymappings.lua
badd +1 ~/.config/nvim
badd +1 plugin/packer_compiled.lua
badd +34 lua/conf/nvim_tree.lua
badd +41 lua/conf/lsp/null-ls.lua
badd +1 lua/conf/floaterm.lua
badd +67 lua/conf/lsp/init.lua
badd +1 lua/conf/diffview.lua
badd +1 lua/conf/gitsigns.lua
badd +8 lua/conf/treesitter.lua
badd +5 lua/conf/trouble.lua
badd +1 lua/conf/lsptrouble.lua
badd +1 lua/conf/twilight.lua
badd +10 lua/conf/todo-comments.lua
badd +5 lua/globals.lua
badd +5 lua/conf/cmp.lua
badd +17 lua/conf/ts-context.lua
badd +2 lua/conf/telescope.lua
badd +1 Session.vim
badd +21 lua/options.lua
badd +16 ~/dev/sbl/bpmn/editor/server/src/routes/resources/bpmn/engine.ts
badd +46 lua/conf/lspsignature.lua
badd +22 lua/conf/lsp/tsserver.lua
badd +18 lua/utils/inline_gitblame.lua
badd +2 lua/conf/vimspector.lua
badd +3 lua/conf/lsp/jsonls.lua
badd +2 lua/conf/scrollbar.lua
badd +1 lua/colorscheme.lua
argglobal
%argdel
$argadd ~/.config/nvim
edit after/plugin/keymappings.lua
argglobal
balt lua/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
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
