let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/sbl/bpmn/editor
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +192 src/components/pages/editor/diagram-editor.vue
badd +4 src/bpmn/engine-context/parser.ts
badd +18 .gitignore
badd +62 src/store.ts
badd +149 node_modules/vuex/types/index.d.ts
badd +4 src/store-modules/execute-history.ts
badd +3 src/store-modules/scenarios-list/index.ts
badd +27 src/store-modules/scenarios-list/scheduler-list/sheduler-scenarios-list.ts
badd +16 node_modules/vuex-module-decorators/dist/types/vuexmodule.d.ts
badd +44 src/store-modules/session.ts
badd +21 node_modules/typescript/lib/lib.es2015.proxy.d.ts
badd +31 src/monaco-editor/jseditor.ts
badd +26 src/bpmn/editor/onclick/ScriptTask.ts
badd +7 src/store-modules/scenarios/index.ts
badd +45 src/store-modules/scenarios/scenarios.ts
badd +3 node_modules/vuex-module-decorators/dist/types/module/index.d.ts
badd +8 src/components/utility/overlaymodal.ts
badd +1 src/components/pages/logs-history/viewer-tab.vue
badd +183 src/router.ts
badd +31 src/components/pages/editor/engine/engine-process-instances-list.vue
badd +1 src/components/pages/editor/engine/engine-deployments-list.vue
badd +134 src/components/pages/editor/diagram-editor/properties-panel/service-call-panel.vue
badd +344 src/components/pages/bpmndb/scriptlist.vue
badd +76 src/components/pages/editor/scheduler.vue
badd +13 src/event-bus.ts
badd +13 src/bpmn/engine-context/worker-manager.ts
badd +25 src/bpmn/engine-context/context.worker.ts
badd +35 src/bpmn/engine-context/types.ts
badd +16 node_modules/typescript/lib/lib.es2015.collection.d.ts
badd +1 src/bpmn/engine-context/ast.ts
badd +17639 node_modules/typescript/lib/lib.dom.d.ts
badd +214 src/bpmn/breakpoints/BreakPointList.ts
badd +21 ~/.config/nvim/lua/conf/lsp/volar.lua
badd +1 src/types/worker-loader.d.ts
badd +29 src/models/diagram.ts
badd +1 src/components/utility/confirm.vue
badd +71 src/monaco-editor/monaco-editor-config.ts
badd +213 src/components/pages/blocks/schedulelist.vue
badd +1 server/src/routes/controllers/bpmn.ts
badd +30 server/config.json
badd +1 src/components/login.vue
badd +12 src/components/utility/code-editor.vue
badd +118 src/index.ts
badd +106 src/lib/websocket.ts
badd +16 server/src/routes/websocket/server.ts
badd +10 server/src/app.ts
badd +181 server/node_modules/@types/express-serve-static-core/index.d.ts
badd +9 ~/dev/sbl/core/nodejs-utils/.gitignore
badd +209 ~/dev/sbl/cs/configs-dev/integrations/gate0/appConfig.json
badd +2 src/App.vue
badd +23 server/package.json
badd +1 server/src/routes/websocket/userstrategy.ts
badd +157 server/src/routes/resources/user.ts
badd +46 server/src/routes/resources/bpmn/db.ts
badd +20 server/tsconfig.json
badd +1 tsconfig.json
badd +21 server/src/core.ts
badd +16 server/src/services/logs/stream.ts
badd +17 server/node_modules/@sblcore/core/lib/index.d.ts
badd +32 .gitlab-ci.yml
badd +36 server/src/index.ts
badd +2 server/node_modules/@sblcore/utils/lib/traps.d.ts
badd +8 server/node_modules/@sblcore/utils/lib/traps.js
badd +33 server/src/routes/resources/bpmn/engine.ts
badd +11 server/node_modules/@sblcore/core/lib/mq/dispatcher.d.ts
badd +2 server/node_modules/@sblcore/core/lib/mq/message.d.ts
badd +23 build/webpack.base.config.ts
badd +16 server/package-lock.json
badd +32 server/yarn.lock
badd +22 build/config.ts
badd +47 src/components/pages/editor/engine.vue
badd +12 src/components/utility/editor-env-version.vue
badd +1 src/components/the-menu.vue
badd +769 src/components/pages/editor/edit.vue
badd +12 src/models/scenarios.ts
badd +148 src/components/pages/editor/diagram-editor/toolbars/diagram-toolbar.vue
badd +38 server/src/routes/controllers/login.ts
badd +193 ~/.config/nvim/lua/plugins.lua
badd +1 ~/.config/nvim/some.norg
badd +89 src/bpmn/breakpoints/BreakPoint.ts
badd +1 src/bpmn/breakpoints/styles.css
badd +150 src/store-modules/scenarios/deployments-list/deployments-scenarios.ts
badd +36 ~/.config/nvim/after/plugin/keymappings.lua
badd +28 ~/.config/nvim/lua/conf/nvim_tree.lua
badd +60 ~/.config/nvim/plugin/packer_compiled.lua
badd +14 TODO.norg
badd +1 src/tab-id.ts
badd +1 index.html
badd +1 src/types/shims-vue.d.ts
badd +1 src/types/vue-prototype.d.ts
badd +3035 node_modules/@types/node/crypto.d.ts
badd +77 node_modules/@types/uuid/index.d.ts
badd +8 src/lib/abrandt.ts
badd +33 src/lib/load.ts
badd +90 src/components/pages/editor/diagram-editor/toolbars/logs-actions-toolbar.vue
badd +11 src/bpmn/variables/Variables.ts
badd +58 src/bpmn/modeler/modelerClass.ts
badd +15 package.json
badd +1 node_modules/@sblcore/utils/package.json
badd +1 node_modules/@sblcore/utils/lib/parseJson.d.ts
badd +9 src/lib/tabextension.js
badd +29 src/sse.ts
badd +1 NvimTree
badd +73 src/store-modules/scenarios-context-definitions.ts
badd +120 src/bpmn/viewer.ts
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit src/bpmn/viewer.ts
argglobal
balt src/store-modules/scenarios-context-definitions.ts
let s:l = 120 - ((14 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 120
normal! 027|
if exists(':tcd') == 2 | tcd ~/dev/sbl/bpmn/editor | endif
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
