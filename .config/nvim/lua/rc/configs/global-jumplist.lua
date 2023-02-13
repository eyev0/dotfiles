local i = require("import")

---@param j Jumplist
local function cb(jumplist)
  -- print(vim.inspect(a))
  -- print(#a.get_list())
  jumplist.clear()
  jumplist.mark()
  jumplist.push({ file = vim.fn.expand("%"), line = 1, col = 0 })
  jumplist.push({ file = vim.fn.expand("%"), line = 1, col = 0 })
  jumplist.push({ file = vim.fn.expand("%"), line = 2, col = 3 })
  -- print(vim.inspect(a.get_list()))
end

i.import("jumplist", cb)

-- local j = require("jumplist")

-- local a = j.jumplist()
--
-- print(vim.inspect(a))
-- a:mark()
-- a:mark()
--

-- print(vim.inspect(vim.o.rtp))
