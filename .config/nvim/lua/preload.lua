-- persistence command to load session
vim.cmd([[command! PersistenceLoad lua require("persistence").load()]])
vim.cmd([[command! PersistenceDeleteCurrent lua require("persistence").delete_current()]])

vim.cmd([[autocmd User ChangeNvimCursor normal! :startinsert :stopinsert]])

require("impatient")
