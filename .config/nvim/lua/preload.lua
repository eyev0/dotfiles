-- persistence command to load session
vim.cmd([[command! PersistenceLoad lua require("persistence").load()]])
vim.cmd([[command! PersistenceDeleteCurrent lua require("persistence").delete_current()]])

-- vim.cmd([[autocmd User ChangeNvimCursor normal! :startinsert :stopinsert]])

require("impatient")

vim.g.did_load_filetypes = 1
vim.cmd([[runtime! ftdetect/*.vim]])
vim.cmd([[runtime! ftdetect/*.lua]])

vim.cmd([[
func ClearTempStuff()
  " clear registers
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
  " clear marks
  delm!
  delm A-Z0-9
endfun
]])

-- vim.cmd([[ au VimEnter call ClearTempStuff() ]])
