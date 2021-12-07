local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
vim.g.completion_confirm_key = ""
_G.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["cmp#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  -- check_ts = true,
})
