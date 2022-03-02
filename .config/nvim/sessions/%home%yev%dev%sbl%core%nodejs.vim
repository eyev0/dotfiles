let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/sbl/core/nodejs
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +31 src/metrics/manager.ts
badd +1 ~/dev/sbl/core/nodejs
badd +9 .gitignore
badd +1 Session.vim
badd +11 package-lock.json
badd +1 .npmignore
badd +25 src/metrics/metric-wrapper.ts
badd +12 src/metrics/request-duration-seconds.ts
badd +1 config.json
badd +9 src/config.ts
badd +1 src/maintenance.ts
badd +6 package.json
badd +11 src/tests/test-custom-listener.ts
badd +1 man://class(n)
badd +10 src/metrics/publisher.ts
badd +73 node_modules/prom-client/index.d.ts
badd +61 ~/.config/nvim/lua/plugins.lua
badd +2 node_modules/@sblcore/utils/lib/tryCatch.d.ts
badd +4 ~/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor/plugin/nvim-treesitter-refactor.vim
badd +22 .vimspector.json
badd +14 term://~/dev/sbl/core/nodejs//2455294:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +15 term://~/dev/sbl/core/nodejs//2463302:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +88 src/index.ts
badd +100 src/mq/dispatcher.ts
badd +95 src/mq/connection.ts
badd +15 term://~/dev/sbl/core/nodejs//2563911:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +16 src/tests/requests/test-fanout.ts
badd +11 src/tests/test-listen-nohandler.ts
badd +11 src/tests/test-metrics.ts
badd +1 src/tests/test-log.ts
badd +72 src/healthcheck.ts
badd +153 src/mq/resolver.ts
badd +141 src/logger.ts
badd +5 node_modules/@sblcore/utils/lib/logger.d.ts
badd +18 ~/.config/nvim/lua/globals.lua
badd +31 tsconfig.json
badd +21 lib/tests/test-listen-fanout.js
badd +1 term://~/dev/sbl/core/nodejs//2392176:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +23 .vscode/launch.json
badd +13 .dap-config.lua
badd +1 ~/.config/nvim/after/plugin/keymappings.lua
badd +2 term://~/dev/sbl/core/nodejs//2461212:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +7 term://~/dev/sbl/core/nodejs//2469886:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//2476627:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//2478214:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +19 .dap-config
badd +10 term://~/dev/sbl/core/nodejs//2526938:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +59 term://~/dev/sbl/core/nodejs//2546843:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//2550324:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +59 term://~/dev/sbl/core/nodejs//2570188:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +59 term://~/dev/sbl/core/nodejs//2573293:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//2576443:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +58 term://~/dev/sbl/core/nodejs//2578385:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 src/tests/test-listen.ts
badd +1 lib/appid.d.ts.map
badd +57 term://~/dev/sbl/core/nodejs//2660446:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//2661470:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +57 term://~/dev/sbl/core/nodejs//3299524:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +23 ~/.config/nvim/lua/conf/dap/init.lua
badd +2 ~/.config/nvim/lua/conf/lsp/jsonls.lua
badd +1 term://~/dev/sbl/core/nodejs//230379:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//1377275:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//1395609:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +5 term://~/dev/sbl/core/nodejs//2518167:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +57 term://~/dev/sbl/core/nodejs//2520519:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//2529603:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +57 term://~/dev/sbl/core/nodejs//2537746:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +42 src/tests/requests/test-direct.ts
badd +103 src/mq/controller.ts
badd +2 man://type(1p)
badd +246 src/mq/message.ts
badd +41 src/tests/requests/test-controller.ts
badd +8 src/mq/listener.ts
badd +27 src/tests/init.ts
badd +1 selfUUID.txt
badd +1 src/tests/listenerUUID.txt
badd +11 src/appid.ts
badd +1 node_modules/@sblcore/utils/lib/index.d.ts
badd +1 .nvmrc
badd +1 src/events.ts
badd +116 term://~/dev/sbl/core/nodejs//656561:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +1 term://~/dev/sbl/core/nodejs//682152:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +48 node_modules/@types/amqplib/index.d.ts
badd +19 ~/dev/sbl/bpmn/editor/src/sse.ts
badd +120 term://~/dev/sbl/core/nodejs//330492:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +120 term://~/dev/sbl/core/nodejs//333869:/home/yev/.nvm/versions/node/v16.13.0/bin/node
badd +0 node_modules/@types/node/process.d.ts
badd +124 node_modules/@types/node/events.d.ts
argglobal
%argdel
$argadd ~/dev/sbl/core/nodejs
edit src/mq/listener.ts
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt node_modules/@types/node/events.d.ts
let s:l = 7 - ((6 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 05|
if exists(':tcd') == 2 | tcd ~/dev/sbl/core/nodejs | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
