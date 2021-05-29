vim.cmd[[
function! Cmdbuf() abort
  nnoremap <nowait> <buffer> q <Cmd>quit<CR>
  nnoremap <buffer> dd <Cmd>lua require('cmdbuf').delete()<CR>
endfunction
augroup cmdbuf_setting
  autocmd!
  autocmd User CmdbufNew call Cmdbuf()
augroup END
]]
