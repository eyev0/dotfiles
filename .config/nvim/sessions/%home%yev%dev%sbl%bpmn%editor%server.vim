let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/sbl/bpmn/editor/server
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +192 ~/dev/sbl/bpmn/editor/src/components/pages/editor/diagram-editor.vue
badd +4 ~/dev/sbl/bpmn/editor/src/bpmn/engine-context/parser.ts
badd +18 ~/dev/sbl/bpmn/editor/.gitignore
badd +62 ~/dev/sbl/bpmn/editor/src/store.ts
badd +149 ~/dev/sbl/bpmn/editor/node_modules/vuex/types/index.d.ts
badd +4 ~/dev/sbl/bpmn/editor/src/store-modules/execute-history.ts
badd +3 ~/dev/sbl/bpmn/editor/src/store-modules/scenarios-list/index.ts
badd +27 ~/dev/sbl/bpmn/editor/src/store-modules/scenarios-list/scheduler-list/sheduler-scenarios-list.ts
badd +16 ~/dev/sbl/bpmn/editor/node_modules/vuex-module-decorators/dist/types/vuexmodule.d.ts
badd +44 ~/dev/sbl/bpmn/editor/src/store-modules/session.ts
badd +21 ~/dev/sbl/bpmn/editor/node_modules/typescript/lib/lib.es2015.proxy.d.ts
badd +31 ~/dev/sbl/bpmn/editor/src/monaco-editor/jseditor.ts
badd +26 ~/dev/sbl/bpmn/editor/src/bpmn/editor/onclick/ScriptTask.ts
badd +7 ~/dev/sbl/bpmn/editor/src/store-modules/scenarios/index.ts
badd +45 ~/dev/sbl/bpmn/editor/src/store-modules/scenarios/scenarios.ts
badd +3 ~/dev/sbl/bpmn/editor/node_modules/vuex-module-decorators/dist/types/module/index.d.ts
badd +8 ~/dev/sbl/bpmn/editor/src/components/utility/overlaymodal.ts
badd +1 ~/dev/sbl/bpmn/editor/src/components/pages/logs-history/viewer-tab.vue
badd +183 ~/dev/sbl/bpmn/editor/src/router.ts
badd +31 ~/dev/sbl/bpmn/editor/src/components/pages/editor/engine/engine-process-instances-list.vue
badd +1 ~/dev/sbl/bpmn/editor/src/components/pages/editor/engine/engine-deployments-list.vue
badd +134 ~/dev/sbl/bpmn/editor/src/components/pages/editor/diagram-editor/properties-panel/service-call-panel.vue
badd +344 ~/dev/sbl/bpmn/editor/src/components/pages/bpmndb/scriptlist.vue
badd +76 ~/dev/sbl/bpmn/editor/src/components/pages/editor/scheduler.vue
badd +13 ~/dev/sbl/bpmn/editor/src/event-bus.ts
badd +13 ~/dev/sbl/bpmn/editor/src/bpmn/engine-context/worker-manager.ts
badd +25 ~/dev/sbl/bpmn/editor/src/bpmn/engine-context/context.worker.ts
badd +35 ~/dev/sbl/bpmn/editor/src/bpmn/engine-context/types.ts
badd +16 ~/dev/sbl/bpmn/editor/node_modules/typescript/lib/lib.es2015.collection.d.ts
badd +1 ~/dev/sbl/bpmn/editor/src/bpmn/engine-context/ast.ts
badd +17222 ~/dev/sbl/bpmn/editor/node_modules/typescript/lib/lib.dom.d.ts
badd +214 ~/dev/sbl/bpmn/editor/src/bpmn/breakpoints/BreakPointList.ts
badd +21 ~/.config/nvim/lua/conf/lsp/volar.lua
badd +1 ~/dev/sbl/bpmn/editor/src/types/worker-loader.d.ts
badd +29 ~/dev/sbl/bpmn/editor/src/models/diagram.ts
badd +1 ~/dev/sbl/bpmn/editor/src/components/utility/confirm.vue
badd +10 ~/dev/sbl/bpmn/editor/src/monaco-editor/monaco-editor-config.ts
badd +213 ~/dev/sbl/bpmn/editor/src/components/pages/blocks/schedulelist.vue
badd +1 src/routes/controllers/bpmn.ts
badd +30 config.json
badd +1 ~/dev/sbl/bpmn/editor/src/components/login.vue
badd +12 ~/dev/sbl/bpmn/editor/src/components/utility/code-editor.vue
badd +79 ~/dev/sbl/bpmn/editor/src/index.ts
badd +39 ~/dev/sbl/bpmn/editor/src/lib/websocket.ts
badd +16 src/routes/websocket/server.ts
badd +47 src/app.ts
badd +181 node_modules/@types/express-serve-static-core/index.d.ts
badd +9 ~/dev/sbl/core/nodejs-utils/.gitignore
badd +209 ~/dev/sbl/cs/configs-dev/integrations/gate0/appConfig.json
badd +2 ~/dev/sbl/bpmn/editor/src/App.vue
badd +23 package.json
badd +1 src/routes/websocket/userstrategy.ts
badd +157 src/routes/resources/user.ts
badd +46 src/routes/resources/bpmn/db.ts
badd +1 tsconfig.json
badd +1 ~/dev/sbl/bpmn/editor/tsconfig.json
badd +21 src/core.ts
badd +16 src/services/logs/stream.ts
badd +17 node_modules/@sblcore/core/lib/index.d.ts
badd +32 ~/dev/sbl/bpmn/editor/.gitlab-ci.yml
badd +36 src/index.ts
badd +2 node_modules/@sblcore/utils/lib/traps.d.ts
badd +8 node_modules/@sblcore/utils/lib/traps.js
badd +33 src/routes/resources/bpmn/engine.ts
badd +11 node_modules/@sblcore/core/lib/mq/dispatcher.d.ts
badd +2 node_modules/@sblcore/core/lib/mq/message.d.ts
badd +23 ~/dev/sbl/bpmn/editor/build/webpack.base.config.ts
badd +16 package-lock.json
badd +32 yarn.lock
badd +14 ~/dev/sbl/bpmn/editor/build/config.ts
badd +47 ~/dev/sbl/bpmn/editor/src/components/pages/editor/engine.vue
badd +12 ~/dev/sbl/bpmn/editor/src/components/utility/editor-env-version.vue
badd +1 ~/dev/sbl/bpmn/editor/src/components/the-menu.vue
badd +783 ~/dev/sbl/bpmn/editor/src/components/pages/editor/edit.vue
badd +12 ~/dev/sbl/bpmn/editor/src/models/scenarios.ts
badd +148 ~/dev/sbl/bpmn/editor/src/components/pages/editor/diagram-editor/toolbars/diagram-toolbar.vue
badd +41 src/routes/controllers/login.ts
badd +193 ~/.config/nvim/lua/plugins.lua
badd +1 ~/.config/nvim/some.norg
badd +89 ~/dev/sbl/bpmn/editor/src/bpmn/breakpoints/BreakPoint.ts
badd +1 ~/dev/sbl/bpmn/editor/src/bpmn/breakpoints/styles.css
badd +150 ~/dev/sbl/bpmn/editor/src/store-modules/scenarios/deployments-list/deployments-scenarios.ts
badd +36 ~/.config/nvim/after/plugin/keymappings.lua
badd +28 ~/.config/nvim/lua/conf/nvim_tree.lua
badd +60 ~/.config/nvim/plugin/packer_compiled.lua
badd +14 ~/dev/sbl/bpmn/editor/TODO.norg
badd +13 ~/dev/sbl/bpmn/editor/src/tab-id.ts
badd +1 ~/dev/sbl/bpmn/editor/index.html
badd +1 ~/dev/sbl/bpmn/editor/src/types/shims-vue.d.ts
badd +1 ~/dev/sbl/bpmn/editor/src/types/vue-prototype.d.ts
badd +3035 ~/dev/sbl/bpmn/editor/node_modules/@types/node/crypto.d.ts
badd +77 ~/dev/sbl/bpmn/editor/node_modules/@types/uuid/index.d.ts
badd +8 ~/dev/sbl/bpmn/editor/src/lib/abrandt.ts
badd +33 ~/dev/sbl/bpmn/editor/src/lib/load.ts
badd +90 ~/dev/sbl/bpmn/editor/src/components/pages/editor/diagram-editor/toolbars/logs-actions-toolbar.vue
badd +11 ~/dev/sbl/bpmn/editor/src/bpmn/variables/Variables.ts
badd +58 ~/dev/sbl/bpmn/editor/src/bpmn/modeler/modelerClass.ts
badd +15 ~/dev/sbl/bpmn/editor/package.json
badd +1 ~/dev/sbl/bpmn/editor/node_modules/@sblcore/utils/package.json
badd +1 ~/dev/sbl/bpmn/editor/node_modules/@sblcore/utils/lib/parseJson.d.ts
badd +9 ~/dev/sbl/bpmn/editor/src/lib/tabextension.js
badd +8 src/routes/routers/api.ts
badd +22 src/routes/routers/ajax.ts
badd +40 src/routes/controllers/events.ts
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit src/routes/controllers/events.ts
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
balt src/routes/routers/api.ts
let s:l = 79 - ((38 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 79
normal! 0
tabnext
edit ~/dev/sbl/bpmn/editor/TODO.norg
argglobal
let s:l = 14 - ((13 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 028|
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
