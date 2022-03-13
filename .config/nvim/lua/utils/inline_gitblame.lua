local M = {}
local api = vim.api

function M.blameVirtText()
  -- local ft = vim.fn.expand('%:h:t') -- get the current file extension
  local ft = vim.bo.filetype -- get the current file extension
  if ft == '' then -- if we are in a scratch buffer or unknown filetype
    return
  end
  if ft == 'bin' then -- if we are in nvim's terminal window
    return
  end
  -- api.nvim_buf_clear_namespace(0, 2, 0, -1) -- clear out virtual text from namespace 2 (the namespace we will set later)
  local currFile = vim.fn.expand('%')
  local line = api.nvim_win_get_cursor(0)
  local blame = vim.fn.system(string.format('git blame -c -L %d,%d %s', line[1], line[1], currFile))
  local hash = vim.split(blame, '%s')[1]
  local cmd = string.format("git show %s ", hash).."--format='%an | %ar | %s'"
  local text
  if hash == '00000000' then
    text = 'Not Committed Yet'
  else
    text = vim.fn.system(cmd)
    text = vim.split(text, '\n')[1]
    if text:find("fatal") then -- if the call to git show fails
      text = 'Not Committed Yet'
    end
  end
  api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, {{ text,'InlineGitBlame' }}, {}) -- set virtual text for namespace 2 with the content from git and assign it to the higlight group 'InlineGitBlame'
end

function M.clearBlameVirtText() -- important for clearing out the text when our cursor moves
  api.nvim_buf_clear_namespace(0, 2, 0, -1)
end

vim.cmd[[ 
fun! SetInlineGitBlameAus()
  aug InlineGitBlameAus
    au!
    au CursorHold   * lua require'utils.inline_gitblame'.blameVirtText()
    au CursorMoved  * lua require'utils.inline_gitblame'.clearBlameVirtText()
    au InsertEnter  * lua require'utils.inline_gitblame'.clearBlameVirtText()
  aug END
endfun
fun! ToggleGitBlameText()
  if !exists('#InlineGitBlameAus#CursorHold')
    call SetInlineGitBlameAus()
  else
    aug InlineGitBlameAus
      autocmd!
    aug END
  endif
endfun
" call SetInlineGitBlameAus()
]]

-- works with lua config only when defered..
vim.defer_fn(function () vim.cmd[[hi! link InlineGitBlame Comment]] end, 200)

return M
