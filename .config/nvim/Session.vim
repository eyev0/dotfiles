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
argglobal
%argdel
edit after/plugin/keymappings.lua
argglobal
balt keymappings.old.lua
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
normal! 023|
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext 1
badd +19 ~/.config/nvim/lua/conf/lualine.lua
badd +0 ~/.config/nvim/keymappings.old.lua
badd +13 ~/.config/nvim/after/plugin/keymappings.lua
badd +1 ~/.config/nvim/undotree_2
badd +3 ~/.config/nvim/lua/conf/lsp/pyright.lua
badd +20 lua/configure/autopairs.lua
badd +109 ~/.config/nvim/lua/keymappings.lua
badd +57 ~/.config/nvim/lua/plugins.lua
badd +6 lua/configure/outline.lua
badd +79 lua/configure/treesitter.lua
badd +61 lua/configure/nvim_tree.lua
badd +10 ~/.config/nvim/init.lua
badd +11 lua/configure/indentguides.lua
badd +21 ~/.config/nvim/lua/colorscheme.lua
badd +25 ~/.config/nvim/lua/conf/lsp/init.lua
badd +1 ~/.config/nvim/lua/utils.lua
badd +57 ~/.config/nvim/lua/utils/inline_gitblame.lua
badd +49 ~/.config/nvim/lua/options.lua
badd +1 ~/.config/nvim/lua/globals.lua
badd +48 ~/.config/nvim/lua/utils/local_nvimrc.lua
badd +4 ~/.config/nvim/lua/utils/trim_whitespace.lua
badd +1 ~/.config/nvim/after/plugin/maps.vim
badd +8 ~/.config/nvim/lua/conf/outline.lua
badd +48 ~/.config/nvim/lua/conf/nvim_tree.lua
badd +1 ~/.config/nvim/lua/conf/autopairs.lua
badd +32 ~/.config/nvim/lua/conf/diffview.lua
badd +1 ~/.config/nvim/lua/conf/gitsigns.lua
badd +113 ~/.config/nvim/lua/conf/treesitter.lua
badd +6 ~/.config/nvim/lua/conf/telescope.lua
badd +42 ~/.config/nvim/lua/conf/compe.lua
badd +5 ~/.config/nvim/lua/conf/lspsaga.lua
badd +136 vimscript/init.vim
badd +2 ~/.config/nvim/lua/conf/indentguides.lua
badd +1 ~/.config/nvim/lua/conf/lsp/yamlls.lua
badd +3 ~/.config/nvim/lua/conf/lsp/vuels.lua
badd +1 ~/.config/nvim/ftplugin/html.vim
badd +1 ~/.config/nvim/ftplugin/vue.vim
badd +271 /usr/local/share/nvim/runtime/doc/autocmd.txt
badd +27 ~/.config/nvim/lua/conf/lsp/sumneko.lua
badd +9 ~/.config/nvim/lua/types.lua
badd +3 ~/.config/nvim/lua/conf/lsp/tsserver.lua
badd +3 ~/.config/nvim/lua/conf/lsp/rust_analyzer.lua
badd +2 ~/.config/nvim/lua/conf/lsp/efm.lua
badd +1 ~/.config/nvim/lua/conf/lsp/html.lua
badd +4 ~/.config/nvim/lua/conf/lsp/bashls.lua
badd +1 ~/.config/nvim/lua/conf/lsp/clangd.lua
badd +3 ~/.config/nvim/lua/conf/lsp/jsonls.lua
badd +1 ~/.config/nvim/lua/conf/lsp/dockerls.lua
badd +1 ~/.config/nvim/lua/FAR\ 2
badd +1 ~/.config/nvim/lua/conf/lsp/FAR\ 3
badd +1 ~/.config/nvim/lua/conf/lsp/FAR\ 4
badd +2 ~/.config/nvim/FAR\ 5
badd +2 ~/.config/nvim/FAR\ 6
badd +2 ~/.config/nvim/FAR\ 1
badd +2 ~/.config/nvim/FAR\ 7
badd +9 ~/.config/nvim/FAR\ 8
badd +1 ~/.config/nvim/FAR\ 10
badd +2 ~/.config/nvim/FAR\ 11
badd +93 ~/.config/nvim/FAR\ 12
badd +5 ~/.config/nvim/lua/conf/far.lua
badd +1 ~/.config/nvim/lua/conf/FAR\ 9
badd +17 ~/.config/nvim/lua/conf/FAR\ 13
badd +1 ~/.config/nvim/lua/conf/FAR\ 14
badd +2 ~/.config/nvim/lua/conf/FAR\ 16
badd +1 ~/.config/nvim/lua/conf/FAR\ 18
badd +1 ~/.config/nvim/lua/conf/FAR\ 22
badd +3 ~/.config/nvim/lua/FAR\ 17
badd +1 ~/.config/nvim/lua/FAR\ 20
badd +1 ~/.config/nvim/lua/FAR\ 23
badd +1 ~/.config/nvim/lua/FAR\ 24
badd +1 man://local(n)
badd +8 ~/.config/nvim/lua/FAR\ 19
badd +1 ~/.config/nvim/lua/FAR\ 25
badd +16 ~/.config/nvim/lua/FAR\ 27
badd +1 ~/.config/nvim/lua/efm.lua
badd +13 ~/.config/nvim/lua/FAR\ 29
badd +1 ~/.config/nvim/.nvimrc.lua
badd +12 ~/.config/nvim/lua/conf/lspsignature.lua
badd +125 ~/.config/nvim/plugin/packer_compiled.vim
badd +11 ~/.zshrc
badd +164 ~/.vim/vimrc
badd +15 ~/.zprofile
badd +29 ~/.config/nvim/lua/conf/lsp/jdtls.lua
badd +1 man://splain(1perl)
badd +1 ~/.config/nvim/ftplugin/javascript.vim
badd +1 ~/.config/nvim/ftplugin/java.vim
badd +30 ~/.config/nvim/lua/conf/dap.lua
badd +1 ~/.config/nvim/lua/conf/lsptrouble.lua
badd +1 ~/.config/nvim/lua/conf/floaterm.lua
badd +1 ~/.config/nvim/HEAD
badd +1 ~/.config/nvim/VS.Vim.Buffer:\ 2:\ VS.Vim.Buffer.Default
badd +1 ~/.config/nvim/VS.Vim.Buffer:\ 3:\ VS.Vim.Buffer.Default
badd +1 ~/.config/nvim/VS.Vim.Buffer:\ 4:\ VS.Vim.Buffer.Default
badd +1 ~/.config/nvim/VS.Vim.Buffer:\ 5:\ VS.Vim.Buffer.Default
badd +1 ~/.config/nvim/VS.Vim.Buffer:\ 6:\ VS.Vim.Buffer.Default
badd +1 ~/.config/nvim/VS.Vim.Buffer:\ 7:\ VS.Vim.Buffer.Default
badd +5 ~/bin/java-lsp.sh
badd +1 ~/.config/nvim/lua/utils/types.lua
badd +34 ~/dev/sbl/kafkaclient/build.gradle
badd +112 ~/.ideavimrc
badd +9 ~/.config/nvim/plugin/packer_compiled.lua
badd +71 ~/.config/nvim/lua/plugins.old.lua
badd +1 __vscode_neovim__-file:///home/yev/dev/sbl/cs/configs-prod/templates/frankenstain_nodejs.json
badd +1 __vscode_neovim__-file:///home/yev/dev/sbl/gitlab/base-image/nodejs-16/Dockerfile
badd +1 ~/dev/sbl/gitlab/base-image/NvimTree
badd +1 __vscode_neovim__-file:///home/yev/dev/sbl/bpmn/admin-ui/api/src/routes/resources/bpmn/engine/deployment/start.ts
badd +1 __vscode_neovim__-file:///home/yev/dev/sbl/integrations/jsv/package.json
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
