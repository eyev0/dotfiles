let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/sbl/bpmn/appcamunda
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +14 src/main/java/ru/spinosa/bpmn/App.java
badd +1 ~/dev/sbl/bpmn/appcamunda/.gitlab-ci.yml
badd +29 ~/dev/sbl/bpmn/appcamunda/src/main/java/ru/spinosa/bpmn/listeners/PromHistogramMetric.java
argglobal
%argdel
edit src/main/java/ru/spinosa/bpmn/App.java
argglobal
balt ~/dev/sbl/bpmn/appcamunda/src/main/java/ru/spinosa/bpmn/listeners/PromHistogramMetric.java
let s:l = 14 - ((13 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
