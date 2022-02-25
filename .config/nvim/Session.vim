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
badd +1 after/plugin/keymappings.lua
badd +60 plugin/packer_compiled.lua
badd +28 lua/conf/nvim_tree.lua
badd +1 lua/conf/lsp/null-ls.lua
badd +1 lua/conf/floaterm.lua
badd +16 lua/conf/lsp/init.lua
badd +1 lua/conf/diffview.lua
badd +50 lua/conf/gitsigns.lua
badd +143 lua/conf/treesitter.lua
badd +1 lua/conf/trouble.lua
badd +1 lua/conf/lsptrouble.lua
badd +1 lua/conf/twilight.lua
badd +1 lua/conf/todo-comments.lua
badd +23 lua/globals.lua
badd +62 lua/conf/cmp.lua
badd +2 lua/conf/ts-context.lua
badd +32 lua/conf/telescope.lua
badd +1 Session.vim
badd +91 lua/options.lua
badd +16 ~/dev/sbl/bpmn/editor/server/src/routes/resources/bpmn/engine.ts
badd +106 lua/conf/lsp/tsserver.lua
badd +1 lua/utils/inline_gitblame.lua
badd +8 lua/conf/lsp/jsonls.lua
badd +4 lua/conf/scrollbar.lua
badd +19 lua/colorscheme.lua
badd +1 ftplugin/javascript.vim
badd +1 lua/conf/lsp/vuels.lua
badd +49 lua/conf/lsp/volar.lua
badd +1 init.lua
badd +11 ~/.local/lsp/lua/meta/LuaJIT\ en-us/package.lua
badd +1 lua/conf/navigator.lua
badd +8 lua/utils/init.lua
badd +92 lua/conf/lualine.lua
badd +1 lua/conf/indentguides.lua
badd +1 lua/conf/lspsignature.lua
badd +9 lua/conf/outline.lua
badd +266 ~/dev/sbl/cs/configs-dev/sorteruniplan/soapserver/wsdl/statusOrder.v1.wsdl
badd +69 ~/.local/lsp/lua/meta/LuaJIT\ en-us/basic.lua
badd +1 ~/.config/nvim
badd +71 lua/plugins.lua
badd +1 lua/conf/dap/node2.lua
badd +1 lua/conf/dap/init.lua
badd +27 lua/utils/nvimrc.lua
badd +1 lua/conf/dap/ui.lua
badd +1 ftdetect/graphql.vim
badd +1 ftdetect/nvimrc.vim
badd +1 ftdetect/dap-config.vim
badd +1 ftplugin/json.vim
badd +1 ftplugin/lua.vim
badd +5 lua/conf/indent_blankline.lua
badd +1 new
badd +6 lua/conf/dap/virtual-text.lua
badd +12 ~/dev/sbl/core/nodejs/.dap-config
badd +35 ~/dev/sbl/core/nodejs/src/index.ts
badd +5 ftdetect/json.vim
badd +67 syntax/jsonc.vim
badd +1 .nvimrc.lua
badd +1 some.norg
badd +9 lua/conf/lsp/sumneko.lua
badd +1 .nvim
badd +1 config.nvim
badd +1 .nvimrc
badd +1 config.nvimrc
badd +7 lua/utils/types.lua
badd +1 /usr/local/share/nvim/runtime/lua/vim/inspect.lua
badd +1 /usr/local/share/nvim/runtime/lua/vim/uri.lua
badd +1 FAR\ 2
badd +1 FAR\ 4
badd +4 lua/conf/neorg.lua
badd +5 ~/dev/sbl/bpmn/editor/TODO.norg
badd +1 ~/dev/sbl/core/nodejs/package.json
badd +177 ~/.zshrc
argglobal
%argdel
$argadd ~/.config/nvim
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit after/plugin/keymappings.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
balt lua/options.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 37 - ((9 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 0
wincmd w
argglobal
if bufexists("lua/options.lua") | buffer lua/options.lua | else | edit lua/options.lua | endif
if &buftype ==# 'terminal'
  silent file lua/options.lua
endif
balt after/plugin/keymappings.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 91 - ((9 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 91
normal! 04|
wincmd w
argglobal
if bufexists("lua/plugins.lua") | buffer lua/plugins.lua | else | edit lua/plugins.lua | endif
if &buftype ==# 'terminal'
  silent file lua/plugins.lua
endif
balt after/plugin/keymappings.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
17
normal! zo
19
normal! zo
63
normal! zo
77
normal! zo
234
normal! zo
let s:l = 91 - ((11 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 91
normal! 03|
wincmd w
2wincmd w
wincmd =
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext
edit ~/.config/nvim/lua/conf/treesitter.lua
argglobal
balt ~/.config/nvim/after/plugin/keymappings.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
126
normal! zo
134
normal! zo
let s:l = 135 - ((21 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 135
normal! 0
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext 1
set stal=1
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
