-- local map = vim.api.nvim_set_keymap
local i = require("import")
local map = vim.keymap.set
local del = vim.keymap.del
local utils = require("rc.utils.keymap")
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local feedkeys = function(keys, mode)
  api.nvim_feedkeys(api.nvim_replace_termcodes(keys, true, true, true), mode, false)
end
local qf = require("rc.plugins.qf")

Keymap = {}

pcall(del, "", "<Space>")
map("", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Packer
-- map("n", "<leader>ps", [[:PackerSync<CR>]], { noremap = true })
map("n", "<leader>ps", [[:Lazy sync<CR>]], { noremap = true, silent = true })
map("n", "<leader>pp", [[:Lazy profile<CR>]], { noremap = true, silent = true })
-- map("n", "<Leader>pi", [[:PackerInstall<CR>]], { noremap = true })
-- map("n", "<leader>pc", [[:PackerCompile<CR>]], { noremap = true })
-- silent dot
map("n", ".", ".", { noremap = true, silent = true })
-- silent &
map("n", "&", ":&&<CR>", { noremap = true, silent = true })
-- easier navigation, also powered by tmux
map({ "n", "t" }, "<C-h>", function()
  vim.cmd("TmuxNavigateLeft")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-j>", function()
  vim.cmd("TmuxNavigateDown")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-k>", function()
  vim.cmd("TmuxNavigateUp")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-l>", function()
  vim.cmd("TmuxNavigateRight")
end, { noremap = true, silent = true })
-- redraw screen
map("n", "<M-l>", [[<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>]], { noremap = true, silent = true })
map("n", "<C-w>d", [[:bdelete<CR>]], { noremap = true, silent = true })
-- tabs stuff
map("n", "<C-w>tn", [[:tabnew<CR>]], { noremap = true, silent = true })
map("n", "<C-w>to", [[:tabonly<CR>]], { noremap = true, silent = true })
map("n", "<C-w>tq", [[:tabc<CR>]], { noremap = true, silent = true })
-- Arrows switch tabs
map({ "n", "t" }, "<C-w><C-j>", function()
  vim.cmd("tabprevious")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-w><C-k>", function()
  vim.cmd("tabnext")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-w><C-h>", function()
  vim.cmd("-tabmove")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-w><C-l>", function()
  vim.cmd("+tabmove")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-S-PageUp>", function()
  vim.cmd("-tabmove")
end, { noremap = true, silent = true })
map({ "n", "t" }, "<C-S-PageDown>", function()
  vim.cmd("+tabmove")
end, { noremap = true, silent = true })
map("t", "<C-PageUp>", function()
  vim.cmd("tabprevious")
end, { noremap = true, silent = true })
map("t", "<C-PageDown>", function()
  vim.cmd("tabnext")
end, { noremap = true, silent = true })
-- Maximizer
map("n", "<C-w>m", [[:MaximizerToggle!<CR>]], { noremap = true, silent = true })
--
map({ "n", "t" }, "<F36>", function()
  vim.cmd("qa")
end, { noremap = true, silent = true }) --<C-F12>
-- resize with C-arrows
map({ "", "t" }, "<C-Up>", function()
  vim.cmd("resize -3")
end, { noremap = true, silent = true })
map({ "", "t" }, "<C-Down>", function()
  vim.cmd("resize +3")
end, { noremap = true, silent = true })
map({ "", "t" }, "<C-Left>", function()
  vim.cmd("vertical resize -4")
end, { noremap = true, silent = true })
map({ "", "t" }, "<C-Right>", function()
  vim.cmd("vertical resize +4")
end, { noremap = true, silent = true })
-- better indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
-- clear last search
map("n", "<C-c>", function()
  -- fn.setreg("/", "")
  cmd.nohlsearch()
end, { noremap = false, silent = true })
-- search and J fix
map("n", "n", function()
  if fn.getreg("/") ~= "" then
    feedkeys("nzzzv", "ni")
  end
end, { noremap = true, silent = true })
map("n", "N", function()
  if fn.getreg("/") ~= "" then
    feedkeys("Nzzzv", "ni")
  end
end, { noremap = true, silent = true })
map("n", "J", [[mzJ`z]], { noremap = true, silent = true })
-- undo streak breakers
map("i", ",", [[,<C-g>u]], { noremap = true, silent = true })
map("i", ".", [[.<C-g>u]], { noremap = true, silent = true })
map("i", "!", [[!<C-g>u]], { noremap = true, silent = true })
map("i", "?", [[?<C-g>u]], { noremap = true, silent = true })
map("i", "(", [[(<C-g>u]], { noremap = true, silent = true })
map("i", ")", [[)<C-g>u]], { noremap = true, silent = true })
map("i", "[", [[[<C-g>u]], { noremap = true, silent = true })
map("i", "]", [[]<C-g>u]], { noremap = true, silent = true })
map("i", "{", [[{<C-g>u]], { noremap = true, silent = true })
map("i", "}", [[}<C-g>u]], { noremap = true, silent = true })
map("i", "<", [[<<C-g>u]], { noremap = true, silent = true })
map("i", ">", [[><C-g>u]], { noremap = true, silent = true })
map("i", ":", [[:<C-g>u]], { noremap = true, silent = true })
map("i", "<CR>", [[<CR><C-g>u]], { noremap = true, silent = true })
-- jumplist mutation
map("n", "k", [[(v:count > 5 ? "m'" . v:count : "") . 'k']], { noremap = true, silent = true, expr = true })
map("n", "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j']], { noremap = true, silent = true, expr = true })
-- hacking search with visual mode
-- search within current selection (prompt)
map("x", "/i", [[<Esc>/\%V]], { noremap = true, silent = true })
-- search for selected text
map("v", "/a", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })
-- jj to escape
-- map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("t", "<C-]>", "<C-\\><C-n>", { noremap = true, silent = true })
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
-- map("i", "<C-k>", function()
-- 	cmd.move(".-2")
-- 	feedkeys(api.nvim_replace_termcodes("<C-o>", true, false, true) .. "==", "nt", false)
-- end, { noremap = true, silent = true })
-- map("i", "<C-j>", function()
-- 	cmd.move(".+1")
-- 	feedkeys(api.nvim_replace_termcodes("<C-o>", true, false, true) .. "==", "nt", false)
-- end, { noremap = true, silent = true })
-- map("n", "<leader>k", function()
-- 	cmd.move(".-2")
-- 	feedkeys("==", "nt", false)
-- end, { noremap = true, silent = true, desc = "Move line up" })
-- map("n", "<leader>j", function()
-- 	cmd.move(".+1")
-- 	feedkeys("==", "nt", false)
-- end, { noremap = true, silent = true, desc = "Move line down" })
-- handy to move around on the line
map("", "H", [[^]], { noremap = true, silent = true })
map("", "L", [[$]], { noremap = true, silent = true })
-- yank to EOL
map("n", "Y", [[y$]], { silent = true })
-- 'whole buffer' operator
map(
  { "o", "v" },
  "ie",
  "<cmd>exec 'normal! ggVG'<cr>",
  { noremap = true, silent = true, desc = "Whole buffer" }
)
-- treesitter unit (node)
map(
  "x",
  "in",
  ':lua require"treesitter-unit".select()<CR>',
  { noremap = true, silent = true, desc = "Select treesitter node's inner scope" }
)
map(
  "x",
  "an",
  ':lua require"treesitter-unit".select(true)<CR>',
  { noremap = true, silent = true, desc = "Select treesitter node's outer scope" }
)
map(
  "o",
  "in",
  ':<c-u>lua require"treesitter-unit".select()<CR>',
  { noremap = true, silent = true, desc = "Select treesitter node's inner scope" }
)
map(
  "o",
  "an",
  ':<c-u>lua require"treesitter-unit".select(true)<CR>',
  { noremap = true, silent = true, desc = "Select treesitter node's outer scope" }
)
-- s for substitute
map("n", "s", [[<plug>(SubversiveSubstitute)]], { noremap = true, silent = true })
map("n", "ss", [[<plug>(SubversiveSubstituteLine)]], { noremap = true, silent = true })
map("n", "S", [[<plug>(SubversiveSubstituteToEndOfLine)]], { noremap = true, silent = true })
-- yank-delete
map({ "n", "x" }, "c", [["_c]], { noremap = true, silent = true })
map({ "n", "x" }, "d", [["_d]], { noremap = true, silent = true })
map("n", "dd", [["_dd]], { noremap = true, silent = true })
map({ "n", "x" }, "D", [["_D]], { noremap = true, silent = true })
map({ "n", "x" }, "x", [[d]], { noremap = true, silent = true })
map("n", "xx", [[dd]], { noremap = true, silent = true })
map("n", "X", [[D]], { noremap = true, silent = true })
-- yank maps
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map("n", "<PageUp>", [[<plug>(YankyCycleBackward)]], { silent = true })
map("n", "<PageDown>", [[<plug>(YankyCycleForward)]], { silent = true })
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
-- like unimpaired
map("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
map("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
map("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
map("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
map("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
map("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
map("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
map("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
map("n", "=p", "<Plug>(YankyPutAfterFilter)")
map("n", "=P", "<Plug>(YankyPutBeforeFilter)")
-- substitute
map("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
map("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
map("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
map("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
-- exchange
map("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
map("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
map("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
map("n", "cxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
-- quickfix stuff
-- Open quickfix list at the bottom of the screen
map("n", "<C-q><C-q>", [[:cclose<CR>]], { noremap = true, silent = true })
map("n", "<C-q><C-o>", qf.open, { noremap = true, silent = true, desc = "Open quickfix" })
map("n", "<C-q><C-n>", function()
  cmd("cnewer")
end, { noremap = true, silent = true, desc = "Next qf list" })
map("n", "<C-q><C-p>", function()
  cmd("colder")
end, { noremap = true, silent = true, desc = "Prev qf list" })
---@type Jumplist
local jumplist
i.import("jumplist", function(j)
  jumplist = j
end)
-- changelist stuff g, g;
-- map("n", "<C-S-O>", function()
--   ---@diagnostic disable-next-line: param-type-mismatch
--   pcall(cmd, "normal! g;")
-- end, { noremap = true, silent = true, desc = "Jump to prev change" })
-- map("n", "<S-Tab>", function() -- <C-S-I>
--   ---@diagnostic disable-next-line: param-type-mismatch
--   pcall(cmd, "normal! g,")
-- end, { noremap = true, silent = true, desc = "Jump to next change" })
-- map("n", "<S-NL>", jumplist.jump_next, { noremap = true, silent = true, desc = "Jumplist next" }) -- <C-S-J>
-- map("n", "<C-S-K>", jumplist.jump_prev, { noremap = true, silent = true, desc = "Jumplist prev" })
-- map("n", "<S-Tab>", jumplist.jump_next, { noremap = true, silent = true, desc = "Jumplist next" }) -- <C-S-J>
-- map("n", "<C-S-O>", jumplist.jump_prev, { noremap = true, silent = true, desc = "Jumplist prev" })
map("n", "<C-S-L>", function()
  vim.notify("Entries: " .. #jumplist.get_list() .. "\n" .. vim.inspect(jumplist.get_list()))
end, { noremap = true, silent = true, desc = "Jumplist prev" })
map("n", "<C-S-H>", function()
  vim.notify(
    "Current: " .. jumplist.get_current_jump_idx() .. "\n" .. vim.inspect({ jumplist.get_current_jump() })
  )
end, { noremap = true, silent = true, desc = "Jumplist prev" })
map("n", "<C-n>", function()
  if #vim.fn.getqflist() == 1 then
    cmd("cfirst")
  else
    ---@diagnostic disable-next-line: param-type-mismatch
    if not pcall(cmd, "cnext") then
      ---@diagnostic disable-next-line: param-type-mismatch
      pcall(cmd, "cfirst")
    end
  end
end, { noremap = true, silent = true, desc = "Go to next item in qf" })
map("n", "<C-p>", function()
  if #vim.fn.getqflist() == 1 then
    cmd("cfirst")
  else
    ---@diagnostic disable-next-line: param-type-mismatch
    if not pcall(cmd, "cprevious") then
      ---@diagnostic disable-next-line: param-type-mismatch
      pcall(cmd, "clast")
    end
  end
end, { noremap = true, silent = true, desc = "Go to prev item in qf" })
map("n", "<C-S-N>", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  pcall(cmd, "cbelow")
end, { noremap = true, silent = true, desc = "Go to next item in qf in this file" })
map("n", "<C-S-P>", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  pcall(cmd, "cabove")
end, { noremap = true, silent = true, desc = "Go to prev item in qf in this file" })
map("n", "<leader>.", function()
  local cursor = api.nvim_win_get_cursor(0)
  fn.setloclist(0, {
    {
      bufnr = api.nvim_get_current_buf(),
      lnum = cursor[1],
      col = cursor[2] + 1,
      ---@diagnostic disable-next-line: param-type-mismatch
      text = fn.getline("."),
    },
  }, "a")
end, { noremap = true, silent = true, desc = "Add cursorpos to loclist" })
-- search-replace within quickfix entries
map({ "v", "n" }, "<C-q><C-r>", function()
  if #fn.getqflist() == 0 then
    cmd("echo 'No quickfix list'")
    return
  end
  local search
  if utils.is_vis_mode() then
    cmd('noau normal! "vy"')
    search = fn.getreg("v")
  else
    search = fn.input({ prompt = "Search: " })
  end
  local replacement = fn.input({ prompt = "Replace with: " })
  if search == nil or #search == 0 or replacement == nil or #replacement == 0 then
    return
  end
  cmd("cdo s/" .. fn.escape(search, "/") .. "/" .. fn.escape(replacement, "/") .. "/gcI")
end, { noremap = true, silent = true, desc = "Replace within quickfix entries" })
map(
  "n",
  "<leader>sr",
  ":%s/<C-r><C-w>//gcI<Left><Left><Left><Left>",
  { silent = false, desc = "Search and replace cword" }
)
map(
  "v",
  "<leader>sr",
  'y:%s/<C-R>"//gcI<Left><Left><Left><Left>',
  { silent = false, desc = "Search and replace selection" }
)
-- TODO: construct substitution command in cmdline with preview, then exit and paste it to cdo
--
-- map("c", "<C-q><C-r>", function()
-- 	local c = fn.getcmdline()
-- 	feedkeys("<Esc>", "")
-- 	cmd("cdo " .. c:gsub("%%s/", "s/") .. "gcI")
-- end, { noremap = true, silent = true })
--
-- handy set filetype
map("n", "<leader>vsft", [[:set ft=]], { noremap = true, silent = false })
map("n", "<leader>vsbt", [[:set bt=]], { noremap = true, silent = false })
-- sometimes scrolloff gets messed up for no obvious reason
map("n", "<leader>vsso", function()
  vim.o.scrolloff = O.scrolloff
  vim.o.sidescrolloff = O.sidescrolloff
end, { noremap = true, silent = true, desc = "Reset scrolloff" })
-- noice scrolling through hover docs
map("n", "<c-d>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-d>"
  end
end, { silent = true, expr = true })
map("n", "<c-u>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-u>"
  end
end, { silent = true, expr = true })
-- lsp
-- toggle diagnostics
map(
  "n",
  "<F2>",
  Lsp.toggle_diagnostic_virt_lines,
  { noremap = true, silent = true, desc = "Diagnostics: toggle virtual lines" }
)
map(
  "n",
  "<F26>",
  Lsp.toggle_diagnostic_float,
  { noremap = true, silent = true, desc = "Diagnostics: toggle float" }
)
map("n", "<leader>le", function()
  vim.diagnostic.setqflist({ severity = { min = Lsp.diagnostic_min_severity, open = false } })
  qf.open()
end, { noremap = true, silent = true, desc = "Diagnostics to qf list" })
map("n", "<F27>", function()
  vim.diagnostic.goto_prev({ severity = { min = Lsp.diagnostic_min_severity } })
end, { noremap = true, silent = true, desc = "Go to previous diagnostic" })
map("n", "<F3>", function()
  vim.diagnostic.goto_next({ severity = { min = Lsp.diagnostic_min_severity } })
end, { noremap = true, silent = true, desc = "Go to next diagnostic" })
map(
  "n",
  "<F15>",
  Lsp.shift_diagnostic_min_severity,
  { noremap = true, silent = true, desc = "Diagnostics: shift severity" }
)
local function set_lsp_buf_shortcuts(_, bufnr)
  local function buf_map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = bufnr
    return map(mode, lhs, rhs, opts)
  end
  buf_map("n", "gd", function()
    vim.lsp.buf.definition({
      reuse_win = true,
      on_list = function(options)
        Lsp.on_list(options, options.items and #options.items > 1, true)
      end,
    })
  end, { noremap = true, silent = true, desc = "Goto Definition" })
  buf_map("n", "gr", function()
    vim.lsp.buf.references({ includeDeclaration = false }, { on_list = Lsp.on_list })
  end, { noremap = true, silent = true, desc = "List References" })
  buf_map("n", "gI", function()
    vim.lsp.buf.implementation({ on_list = Lsp.on_list })
  end, { noremap = true, silent = true, desc = "List Implementations" })
  buf_map(
    "n",
    "gCi",
    vim.lsp.buf.incoming_calls,
    { noremap = true, silent = true, desc = "List Incoming Calls" }
  )
  buf_map(
    "n",
    "gCo",
    vim.lsp.buf.outgoing_calls,
    { noremap = true, silent = true, desc = "List Outgoing Calls" }
  )
  buf_map("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover docs" })
  buf_map(
    { "n", "i" },
    "<M-k>",
    vim.lsp.buf.signature_help,
    { noremap = true, silent = true, desc = "Signature help" }
  )
  buf_map("n", "<leader>lar", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename symbol" })
  buf_map(
    { "n", "v" },
    "<leader>lac",
    vim.lsp.buf.code_action,
    { noremap = true, silent = true, desc = "Code action" }
  )
end
Keymap.set_lsp_buf_shortcuts = set_lsp_buf_shortcuts
-- formatting without calling on_attach (for null-ls)
map("n", "<leader>laf", function()
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end, { noremap = true, silent = true, desc = "Format file" })
-- refactoring.nvim
local function set_refactor_shortcuts(params)
  local function buf_map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = params.buf
    return map(mode, lhs, rhs, opts)
  end
  buf_map(
    "v",
    "<leader>laef",
    [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, desc = "refactor: Extract Function" }
  )
  buf_map(
    "v",
    "<leader>laetf",
    [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, desc = "refactor: Extract Function To File" }
  )
  buf_map({ "n", "v" }, "<leader>laiv", function()
    if utils.is_vis_mode() then
      feedkeys("<Esc>", "n")
    end
    require("refactoring").refactor("Inline Variable")
  end, { noremap = true, silent = true, desc = "refactor: Inline Variable" })
  -- do not map extract variable for java
  if params.file:find(".java") then
    return
  end
  buf_map(
    "v",
    "<leader>laev",
    [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, desc = "refactor: Extract Variable" }
  )
end
api.nvim_create_autocmd("BufEnter", {
  group = api.nvim_create_augroup("RefactoringNvimShortcuts", {}),
  callback = set_refactor_shortcuts,
})
-- aerial
local function set_aerial_buf_shortcuts(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- Jump forwards/backwards with '{' and '}'
  map("n", "{", require("aerial").prev, opts)
  map("n", "}", require("aerial").next, opts)
end
Keymap.set_aerial_buf_shortcuts = set_aerial_buf_shortcuts
map("n", "<leader>ls", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
-- NvimTree
local nvim_tree = require("nvim-tree.api").tree
map("n", "<leader>n", function()
  nvim_tree.toggle(true, false, fn.getcwd(-1, 0))
end, { noremap = true, silent = true, desc = "NvimTree: Toggle for current scope (global/tab/window)" })
-- floaterm
-- local toggleterm = require("toggleterm")
local terms = require("rc.plugins.toggleterm").terms
local term = require("toggleterm.terminal").Terminal:new({
  direction = "float",
  on_create = function()
    cmd("startinsert!")
  end,
  on_open = function()
    cmd("startinsert!")
  end,
})
local function toggleterm(size, direction)
  direction = vim.F.if_nil(direction, "float")
  term:toggle(size, direction)
end
map({ "n", "t" }, "<End>", toggleterm, { noremap = true, silent = true })
map({ "n", "t" }, "<C-End>", function()
  toggleterm(nil, "tab")
end, { noremap = true, silent = true })
-- Telescope - opener
local find_files_opts = {
  layout_strategy = "horizontal",
  no_ignore = true,
  hidden = true,
  layout_config = {
    mirror = false,
    prompt_position = "top",
    scroll_speed = 5,
    height = 0.4,
    width = 0.65,
    preview_width = 0.47,
  },
}
local function with_default_opts(opts)
  opts = opts or {}
  return vim.tbl_deep_extend("force", {
    layout_strategy = "center",
    layout_config = {
      mirror = true,
      prompt_position = "top",
      scroll_speed = 7,
      height = 0.45,
      width = 0.6,
    },
  }, opts)
end
local telescope_builtin = require("telescope.builtin")
local telescope = require("telescope")
local default_mode = "git"
local mode = default_mode
map({ "n", "i" }, "<C-g>", function()
  if vim.bo.filetype == "TelescopePrompt" then
    -- toggle mode
    mode = mode == "git" and "files" or "git"
    feedkeys("<C-c>", "t")
  else
    mode = default_mode
  end
  if mode == "git" then
    local has_git = pcall(telescope_builtin.git_files, find_files_opts)
    if not has_git then
      telescope_builtin.find_files(find_files_opts)
    end
  else
    telescope_builtin.find_files(find_files_opts)
  end
end, { noremap = true, silent = true, desc = "Find files" })
local function get_visual_selection(escaped)
  cmd('noau normal! "vy"')
  local text = fn.getreg("v")
  fn.setreg("v", {})
  text = string.gsub(text, "\n", "")
  if #text > 0 then
    if escaped then
      return fn.escape(text, "/\\(){}[].+*")
    else
      return text
    end
  else
    return ""
  end
end
-- grepping
-- Telescope grep_string search="" only_sort_text=true
map("v", "<C-f>", function()
  telescope_builtin.live_grep(with_default_opts({
    default_text = get_visual_selection(true),
    initial_mode = "normal",
  }))
end, { noremap = true, silent = true, desc = "Grep selected string" })
map("n", "<C-f>", function()
  telescope_builtin.live_grep(with_default_opts())
end, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<C-s>", function()
  telescope.extensions.aerial.aerial(with_default_opts({
    sorting_strategy = "descending",
    layout_config = {
      height = 0.3,
    },
  }))
end, { noremap = true, silent = true, desc = "Live grep" })
map(
  "n",
  "<leader>m",
  ":NoiceHistory<CR>",
  { noremap = true, silent = true, desc = "View all noice messages" }
)
map("n", "<leader>omm", ":messages<CR>", { noremap = true, silent = true, desc = "View :messages" })
map("n", "<leader>omf", function()
  telescope.extensions.notify.notify({
    initial_mode = "normal",
    sorting_strategy = "descending",
  })
end, { noremap = true, silent = true, desc = "View notifications" })
-- map("n", "<leader>ovs", function()
-- 	require("telescope").extensions.persisted.persisted(with_default_opts({}))
-- end, { noremap = true, silent = true, desc = "View sessions" })
-- project/sessions
map("n", "<leader>ovsl", [[:SessionLoadLast<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovso", [[:SessionLoad<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovss", [[:SessionStop<CR>]], { noremap = true, silent = true })
-- map("n", "<leader>ssd", [[:SessionDelete<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovsd", [[:SessionDeleteCurrent<CR>]], { noremap = true, silent = true })
map("n", "<leader>ovx", function()
  require("telescope").extensions.tmuxinator.projects(require("telescope.themes").get_dropdown({}))
end, { noremap = true, silent = true, desc = "View tmuxinator projects" })
map("n", "<leader>ovb", function()
  telescope_builtin.buffers(with_default_opts({ initial_mode = "normal" }))
end, { noremap = true, silent = true, desc = "View buffers" })
map("n", "<leader>ovf", function()
  telescope_builtin.oldfiles(with_default_opts({ initial_mode = "normal" }))
end, { noremap = true, silent = true, desc = "View oldfiles" })
map("n", "<leader>ovm", function()
  telescope_builtin.keymaps(with_default_opts())
end, { noremap = true, silent = true, desc = "View keymaps" })
map("n", "<leader>ovn", function()
  vim.ui.input({ prompt = "Show man page for", completion = "shellcmd" }, function(input)
    if input ~= nil then
      cmd("vert Man " .. input)
    end
  end)
end, { noremap = true, silent = true, desc = "Prompt for man page" })
map("n", "<leader>ovh", function()
  telescope_builtin.help_tags(with_default_opts())
end, { noremap = true, silent = true, desc = "View help tags" })
map("n", "<leader>ovo", function()
  telescope_builtin.vim_options(with_default_opts())
end, { noremap = true, silent = true, desc = "View vim options" })
map("n", "<leader>ovl", function()
  telescope_builtin.highlights(with_default_opts())
end, { noremap = true, silent = true, desc = "View highlights" })
map("n", "<leader>ova", function()
  telescope_builtin.autocommands(with_default_opts())
end, { noremap = true, silent = true, desc = "View autocommands" })
map("n", "<leader>ovc", function()
  telescope_builtin.commands(with_default_opts())
end, { noremap = true, silent = true, desc = "View commands" })
map("n", "<leader>ovr", function()
  telescope_builtin.reloader(with_default_opts())
end, { noremap = true, silent = true, desc = "View reloader" })
-- UndoTree
map(
  "n",
  "<leader>ovu",
  [[:UndotreeToggle <bar> UndotreeFocus<CR>]],
  { noremap = true, silent = true, desc = "View undo tree" }
)
map("n", "<leader>ovtb", function()
  telescope_builtin.builtin(with_default_opts())
end, { noremap = true, silent = true, desc = "View telescope builtin" })
map("n", "<leader>ovts", [[:TSPlaygroundToggle<CR>]], { noremap = true, silent = true })
-- todo
map("n", "<leader>ltd", function()
  -- require("todo-comments.search").setqflist({ open = false })
  require("todo-comments.search").search(function(results)
    fn.setqflist({}, " ", { title = "Todo", id = "$", items = results })
    qf.open(#results, false, false)
  end)
  -- qf.trigger()
end, { noremap = true, silent = true, desc = "Todos" })
-- open config dir
map("n", "<leader>ocd", function()
  cmd("cd " .. vim.fn.getcwd(-1, -1))
end, { noremap = true, silent = true, desc = "Change current tab's dir to !pwd" })
map("n", "<leader>ods", function()
  require("rc.plugins.telescope").pickers.dirs()
end, { noremap = true, silent = true, desc = "Open dir" })
map("n", "<leader>odc", function()
  cmd("$tabnew +tcd\\ " .. fn.stdpath("config") .. " " .. fn.stdpath("config") .. "/lua/rc/init.lua")
end, { noremap = true, silent = true, desc = "Open config/nvim dir in tab" })
local function open_dir(dir_to_open, open_in_tmux)
  if dir_to_open == nil then
    return
  end
  open_in_tmux = open_in_tmux ~= nil and open_in_tmux or false
  -- trim trailing slash
  dir_to_open = string.gsub(dir_to_open, "/$", "")
  if vim.loop.fs_realpath(dir_to_open) then
    if open_in_tmux then
      local name = fn.fnamemodify(dir_to_open, ":t")
      if #name == 0 then
        name = "new_window"
      end
      cmd("!tmux new-window -n " .. name .. " -c " .. dir_to_open .. " ';' set -w remain-on-exit off")
    else
      cmd("$tabnew +tcd\\ " .. dir_to_open)
    end
  else
    print("Invalid directory")
  end
end
-- prompt for plugin dir and open in tab
map("n", "<leader>odp", function()
  vim.ui.input({
    prompt = "Enter directory to open: ",
    default = O.pluginspath .. "/",
    completion = "file",
  }, open_dir)
end, { noremap = true, silent = true, desc = "Open lazy/plugin dir in tab" })
-- prompt for work dir and open in tab
map("n", "<leader>odw", function()
  vim.ui.input({
    prompt = "Enter directory to open: ",
    default = fn.expand("$HOME/dev/sbl/"),
    completion = "file",
  }, open_dir)
end, { noremap = true, silent = true, desc = "Open work dir in tab" })
-- prompt for dir and open in separate tmux window
map("n", "<leader>odt", function()
  vim.ui.input({
    prompt = "Enter directory to open: ",
    default = fn.expand("$HOME") .. "/",
    completion = "file",
  }, function(input)
    open_dir(input, true)
  end)
end, { noremap = true, silent = true, desc = "Open dir in separate tmux window" })
-- debug actions
local dap = require("dap")
local dapui = require("dapui")
map("n", "<F8>", function()
  if dap.session() == nil then
    pcall(dapui.close)
  end
  dap.continue()
end, { noremap = true, silent = true })
map("n", "<F32>", function()
  pcall(dapui.close)
  dap.run_last()
end, { noremap = true, silent = true })
map("n", "<F20>", function()
  dap.terminate()
  pcall(dapui.close)
end, { noremap = true, silent = true })
-- map("n", "<leader>dr", dap.terminate, { noremap = true, silent = true })
map("n", "<F6>", function()
  if dap.session() ~= nil then
    qf.set_jumplist()
    dap.step_over()
  end
end, { noremap = true, silent = true })
map("n", "<F5>", function()
  if dap.session() ~= nil then
    qf.set_jumplist()
    dap.step_into()
  end
end, { noremap = true, silent = true })
map("n", "<F7>", function()
  if dap.session() ~= nil then
    qf.set_jumplist()
    dap.step_out()
  end
end, { noremap = true, silent = true })
map("n", "<leader>dp", dap.toggle_breakpoint, { noremap = true, silent = true, desc = "Toggle breakpoint" })
-- set breakpoint condition
local cond_breakpoint_expr = nil
map("v", "<leader>dP", function()
  cmd('noau normal! "vy"')
  cond_breakpoint_expr = fn.getreg("v")
  -- fn.setreg("v", {})
end, { noremap = true, silent = true, desc = "Set breakpoint condition" })
-- set breakpoint with condition
local function set_breakpoint_with_condition(s)
  if s == nil then
    return
  end
  dap.set_breakpoint(s)
end
map("n", "<leader>dP", function()
  if cond_breakpoint_expr ~= nil then
    vim.ui.input(
      { prompt = "Breakpoint condition: ", default = cond_breakpoint_expr },
      set_breakpoint_with_condition
    )
    cond_breakpoint_expr = nil
  else
    vim.ui.input({ prompt = "Breakpoint condition: " }, set_breakpoint_with_condition)
  end
end, { noremap = true, silent = true, desc = "Set breakpoint with condition" })
map("n", "<leader>dc", dap.clear_breakpoints, { noremap = true, silent = true, desc = "Clear breakpoints" })
map("n", "<leader>dL", function()
  dap.set_breakpoint(nil, nil, fn.input({ prompt = "Log point message: " }))
end, { noremap = true, silent = true, desc = "Set log point message" })
map("n", "<leader>du", function()
  if dap.session() == nil then
    vim.notify_once("No active debug session", vim.log.levels.WARN)
  end
  dapui.toggle()
end, { noremap = true, silent = true })
map("n", "<leader>de", function()
  ---@diagnostic disable-next-line: missing-parameter
  dapui.eval()
end, { noremap = true, silent = true })
map("v", "<leader>de", function()
  ---@diagnostic disable-next-line: missing-parameter
  dapui.eval()
end, { noremap = true, silent = true })
map("n", "<leader>df", function()
  ---@diagnostic disable-next-line: missing-parameter
  dapui.float_element()
end, { noremap = true, silent = true })
-- debug jest
map("n", "<leader>dj", [[:JesterActions<CR>]], { noremap = true, silent = true })
-- telescope dap
map("n", "<leader>dlb", [[:Telescope dap list_breakpoints<CR>]], { noremap = true, silent = true })
map("n", "<leader>dlv", [[:Telescope dap variables<CR>]], { noremap = true, silent = true })
map("n", "<leader>dlf", [[:Telescope dap configurations<CR>]], { noremap = true, silent = true })
map("n", "<leader>dlc", [[:Telescope dap commands<CR>]], { noremap = true, silent = true })
-- :Telescope dap commands
-- :Telescope dap configurations
-- :Telescope dap list_breakpoints
-- :Telescope dap variables
-- :Telescope dap frames
-- dadbod
map("n", "<leader>ddu", [[:DBUIToggle<CR>]], { noremap = true, silent = true })
-- scratch buffers
map("n", "<leader>llf", [[:vsplit | e /tmp/scratch<CR>]], { noremap = true, silent = true })
map("n", "<leader>llx", [[:Luapad<CR>]], { noremap = true, silent = true, desc = "Toggle Luapad" })
map("n", "<leader>llr", [[:LuaRun<CR>]], { noremap = true, silent = true, desc = "Lua: run current file" })
map(
  "n",
  "<leader>llir",
  [[:Reload jumplist<CR>]],
  { noremap = true, silent = true, desc = "Import: reload jumplist modules" }
)
map(
  "n",
  "<leader>llis",
  [[:ImportStatus<CR>]],
  { noremap = true, silent = true, desc = "Import: show status window" }
)
map("n", "<leader>llds", function()
  require("osv").launch({ port = 8086 })
end, { noremap = true, silent = true, desc = "Debug this instance (launch server at port 8086)" })
map("n", "<leader>lldr", function()
  local log_path = fn.stdpath("data") .. "/osv.log"
  cmd("!rm " .. log_path)
  require("osv").run_this({ log = true })
  -- cmd("vsplit e " .. log_path)
end, { noremap = true, silent = true, desc = "Lua: debug current file with logging" })
-- git stuff
-- status
local parent_tabs = {}
map("n", "<leader>gs", function()
  local parenttabhandle = api.nvim_get_current_tabpage()
  cmd("DiffviewOpen HEAD")
  cmd("Git")
  cmd("resize -7")
  parent_tabs[api.nvim_get_current_tabpage()] = parenttabhandle
end, { noremap = true, silent = true, desc = "Git status" })
-- log
map(
  "n",
  "<leader>gla",
  [[:DiffviewFileHistory<CR>]],
  { noremap = true, silent = true, desc = "Git log - all files" }
)
map(
  "n",
  "<leader>glf",
  [[:DiffviewFileHistory %<CR>]],
  { noremap = true, silent = true, desc = "Git log - current file" }
)
-- diff
map(
  "n",
  "<leader>gdm",
  [[:tabnew <bar> :b# <bar> :Gvdiffsplit!<CR>]],
  { noremap = true, silent = true, desc = "Git merge 3-way diff" }
)
map(
  "n",
  "<leader>gdf",
  [[:DiffviewOpen HEAD -- %:p<CR> <bar> <C-w>l<C-w>l]],
  { noremap = true, silent = true, desc = "Git diff file against index" }
)
map(
  "n",
  "<leader>gda",
  [[:DiffviewOpen HEAD]],
  { noremap = true, silent = false, desc = "Git diff all (prompts for revision)" }
)
-- git remote
map("n", "<leader>grp", function()
  term:open(nil, "float")
  term:change_dir(fn.getcwd(-1, 0))
  term:send("git push", false)
end, { noremap = true, silent = true, desc = "Git push" })
map("n", "<leader>grl", function()
  term:open(nil, "float")
  term:change_dir(fn.getcwd(-1, 0))
  term:send("git pull", false)
end, { noremap = true, silent = true, desc = "Git pull" })
-- lazygit
map("n", "<leader>gtt", function()
  terms.lazygit:toggle()
end, { noremap = true, silent = true, desc = "Lazygit" })
-- gitsigns
local function set_gitsigns_buf_shortcuts(buf_map, gs)
  -- Navigation
  buf_map(
    "n",
    "<F4>",
    "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
    { noremap = true, silent = true, expr = true, desc = "git: Next hunk" }
  )
  buf_map(
    "n",
    "<F28>", --<C-F4>
    "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
    { noremap = true, silent = true, expr = true, desc = "git: Prev hunk" }
  )
  -- Actions
  buf_map(
    { "n", "v" },
    "<leader>ghs",
    gs.stage_hunk,
    { noremap = true, silent = true, desc = "git: Stage hunk" }
  )
  buf_map(
    { "n", "v" },
    "<leader>ghr",
    gs.reset_hunk,
    { noremap = true, silent = true, desc = "git: Reset hunk" }
  )
  buf_map("n", "<leader>ghS", gs.stage_buffer, { noremap = true, silent = true, desc = "git: Stage buffer" })
  buf_map(
    "n",
    "<leader>ghu",
    gs.undo_stage_hunk,
    { noremap = true, silent = true, desc = "git: Undo stage hunk" }
  )
  buf_map("n", "<leader>ghR", gs.reset_buffer, { noremap = true, silent = true, desc = "git: Reset buffer" })
  buf_map("n", "<leader>ghp", gs.preview_hunk, { noremap = true, silent = true, desc = "git: Preview hunk" })
  buf_map("n", "<leader>ghb", function()
    gs.blame_line({ full = true })
  end, { noremap = true, silent = true, desc = "git: Blame line" })
  buf_map(
    "n",
    "<leader>gtb",
    gs.toggle_current_line_blame,
    { noremap = true, silent = true, desc = "git: Toggle current line blame" }
  )
  buf_map("n", "<leader>gdt", gs.diffthis, { noremap = true, silent = true, desc = "git: Diff to index" })
  buf_map("n", "<leader>gdT", function()
    gs.diffthis("HEAD~1")
  end, { noremap = true, silent = true, desc = "git: Diff to previous commit" })
  buf_map(
    "n",
    "<leader>gtd",
    gs.toggle_deleted,
    { noremap = true, silent = true, desc = "git: Toggle deleted" }
  )
  -- Text object
  buf_map(
    { "o", "x" },
    "ih",
    ":<C-U>Gitsigns select_hunk<CR>",
    { noremap = true, silent = true, desc = "git: Select hunk" }
  )
end
Keymap.set_gitsigns_buf_shortcuts = set_gitsigns_buf_shortcuts
-- harpoon
map("n", "<leader>ha", [[:lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })
map(
  "n",
  "<leader>hv",
  [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]],
  { noremap = true, silent = true }
)
local function goto_harpooned(file)
  cmd.m("'")
  require("harpoon.ui").nav_file(file)
end
map("n", "<M-a>", function()
  goto_harpooned(1)
end, { noremap = true, silent = true, desc = "Harpoon file 1" })
map("n", "<M-s>", function()
  goto_harpooned(2)
end, { noremap = true, silent = true, desc = "Harpoon file 2" })
map("n", "<M-d>", function()
  goto_harpooned(3)
end, { noremap = true, silent = true, desc = "Harpoon file 3" })
map("n", "<M-f>", function()
  goto_harpooned(4)
end, { noremap = true, silent = true, desc = "Harpoon file 4" })
map("n", "<M-g>", function()
  goto_harpooned(5)
end, { noremap = true, silent = true, desc = "Harpoon file 5" })
map("n", "<M-h>", function()
  goto_harpooned(6)
end, { noremap = true, silent = true, desc = "Harpoon file 6" })
-- rest
map("n", "<leader>lhe", [[:RestSelectEnv ]], { noremap = true, silent = false })
map("n", "<leader>lhr", [[<cmd>RestNvimRun<CR>]], { noremap = true, silent = true })
map("n", "<leader>lhp", [[<cmd>RestNvimPreview<CR>]], { noremap = true, silent = true })
map("n", "<leader>lhl", [[<cmd>RestNvimRunLast<CR>]], { noremap = true, silent = true })
-- prettify json
map("n", "<leader>ljsp", [[:%!jq<CR>]], { noremap = true, silent = true, desc = "Prettify json" })
map("v", "<leader>ljsp", [[:!jq<CR>]], { noremap = true, silent = true, desc = "Prettify json" })
map("n", "<leader>ljsm", [[:%!jq -c<CR>]], { noremap = true, silent = true, desc = "Minify json" })
map("v", "<leader>ljsm", [[:!jq -c<CR>]], { noremap = true, silent = true, desc = "Minify json" })
-- map("c", "<C-t>", function()
-- 	require("noice").redirect(fn.getcmdline())
-- end, { desc = "Redirect Cmdline" })
map("c", "<C-t>", function()
  require("noice").redirect(fn.getcmdline(), { { filter = { event = "msg_show" }, view = "notify" } })
  feedkeys("<C-c>", "n")
end, { desc = "Redirect Cmdline" })
-- cmdbuf
-- TODO: update cmdbuf history after executing command in or outside of cmdbuf
-- this requires remapping <CR> in cmdline to add getcmdline() to cmdbuf history
--
-- vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
--   -- buffer = bufnr,
--   callback = function()
--     self:load(vim.fn.getcmdline())
--   end,
-- })
local cmdbuf = require("cmdbuf")
map({ "n", "v" }, "qo", function()
  cmdbuf.split_open(vim.o.cmdwinheight)
end, { noremap = true, silent = true, nowait = true })
map("c", "<C-f>", function()
  cmdbuf.split_open(vim.o.cmdwinheight, { line = fn.getcmdline(), column = fn.getcmdpos() })
  feedkeys("<C-c>", "n")
end)
-- open lua command-line window
map("n", "ql", function()
  cmdbuf.split_open(vim.o.cmdwinheight, { type = "lua/cmd" })
end, { noremap = true, silent = true, nowait = true })
local cmdwin_aug_id = api.nvim_create_augroup("CmdwinHacks", {})
local function cmdwin_maps()
  map("n", "<Esc>", [[<Cmd>quit<CR>]], { noremap = true, silent = true, buffer = true })
  map("n", "q", [[<Cmd>quit<CR>]], { nowait = true, buffer = true })
  map({ "n", "i" }, "<C-t>", function()
    local cursor = api.nvim_win_get_cursor(0)
    local line = api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], false)[1]
    local ft = vim.bo.filetype
    local command = ft == "lua" and ("lua " .. line) or line
    vim.notify(command)
    cmd("stopinsert")
    require("noice").redirect(command, { { filter = { event = "msg_show" }, view = "notify" } })
  end, { noremap = true, silent = true, desc = "Redirect Cmdline", buffer = true })
end
api.nvim_create_autocmd({ "CmdwinEnter" }, {
  group = cmdwin_aug_id,
  callback = function()
    cmdwin_maps()
    map("n", "<C-k>", [[<Cmd>quit<CR>]], { nowait = true, buffer = true })
    cmd("TSBufDisable incremental_selection")
    cmd("TSContextDisable")
  end,
})
api.nvim_create_autocmd({ "CmdwinLeave" }, {
  group = cmdwin_aug_id,
  callback = function()
    cmd("TSContextEnable")
  end,
})
api.nvim_create_autocmd({ "User" }, {
  group = api.nvim_create_augroup("cmdbuf_setting", {}),
  pattern = { "CmdbufNew" },
  callback = function()
    cmdwin_maps()
    map("n", "dd", cmdbuf.delete, { buffer = true })
    vim.wo.winfixheight = true
    local sources = {
      { name = "nvim_lua", group_index = 1, priority = 3 },
      { name = "path", group_index = 2, priority = 2 },
    }
    if vim.bo.filetype == "lua" then
      table.insert(sources, { name = "vsnip", group_index = 1, priority = 10 })
    else
      table.insert(sources, { name = "cmdline", group_index = 1, priority = 4 })
    end
    require("cmp").setup.buffer({
      sources = sources,
    })
  end,
})
-- unicode encode-decode
map(
  "v",
  "]c",
  [[:s/\%V\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1))/<CR>]],
  { noremap = true, silent = true, desc = "Decode unicode character" }
)
-- toggle options
local function toggle_scoped(option, scope)
  return pcall(function()
    local new_value
    if scope == "o" then
      new_value = not vim[scope][option]
      vim[scope][option] = new_value
    elseif scope == "wo" then
      new_value = not vim[scope][api.nvim_get_current_win()][option]
      vim[scope][api.nvim_get_current_win()][option] = new_value
    elseif scope == "bo" then
      new_value = not vim[scope][api.nvim_get_current_buf()][option]
      vim[scope][api.nvim_get_current_buf()][option] = new_value
    end
    return new_value
  end)
end
local function toggle(option)
  return function()
    local ok, new_value, scope
    for _, _scope in ipairs({ "o", "wo", "bo" }) do
      ok, new_value = toggle_scoped(option, _scope)
      -- vim.notify(("%s %s"):format(scope, tostring(new_value)))
      if ok then
        scope = _scope
        break
      end
    end
    if not ok then
      vim.notify("Option not found: " .. option)
      return
    else
      vim.notify(("Option set: %s.%s=%s"):format(scope, option, tostring(new_value)))
    end
  end
end
-- TODO: store in shada globals (vim.g.UPPERCASE_VAR)
map("n", "\\w", toggle("wrap"), { noremap = true, silent = true, desc = "Toggle wrap" })
map("n", "\\C", toggle("cursorcolumn"), { noremap = true, silent = true, desc = "Toggle cursorcolumn" })
map("n", "\\c", toggle("cursorline"), {
  noremap = true,
  silent = true,
  desc = "Toggle cursorline",
})
map("n", "\\i", toggle("ignorecase"), {
  noremap = true,
  silent = true,
  desc = "Toggle ignorecase",
})
map("n", "\\l", toggle("list"), { noremap = true, silent = true, desc = "Toggle list" })
map("n", "\\n", toggle("number"), { noremap = true, silent = true, desc = "Toggle number" })
map("n", "\\r", toggle("relativenumber"), { noremap = true, silent = true, desc = "Toggle relativenumber" })
map("n", "\\s", toggle("spell"), { noremap = true, silent = true, desc = "Toggle spell" })
map("n", "\\b", function()
  vim.g.heirline_show_winbufnrs = not vim.g.heirline_show_winbufnrs
end, { noremap = true, silent = true, desc = "Toggle show win/buf numbers in winbar" })
map("n", "go", function()
  vim.cmd("normal! o")
  vim.cmd('normal! ^"_D')
  vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Add new line after current" })
map("n", "gO", function()
  vim.cmd("normal! O")
  vim.cmd('normal! ^"_D')
  vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Add new line before current" })
-- esc
map("n", "<Esc>", function()
  cmd.cclose()
  cmd([[Vista!]])
  cmd([[AerialClose]])
  cmd([[NvimTreeClose]])
  cmd([[TroubleClose]])
  pcall(dapui.close)
end, { noremap = true, silent = true })
-- filetype-specific shortcuts
local esc_quit_fts = { "help", "NvimTree", "notify", "aerial", "vista_kind", "httpResult", "man", "Trouble" }
local esc_tabc_fts = { "fugitive", "DiffviewFiles", "DiffviewFileHistory" }
local q_quit_fts = { "help", "notify", "man", "ImportManager", "qf" }
autocmd("BufEnter", {
  group = augroup("CustomFiletypeSettings", {}),
  callback = function(opts)
    -- esc
    local ft = vim.bo[opts.buf].filetype
    if vim.tbl_contains(esc_quit_fts, ft) then
      -- close only current buffer with Esc
      map("n", "<Esc>", ":quit<CR>", { noremap = true, silent = true, nowait = true, buffer = opts.buf })
    elseif vim.tbl_contains(esc_tabc_fts, ft) then
      -- close current tab and focus "parent" tab
      map("n", "<Esc>", function()
        local tabnr_to_close = fn.tabpagenr()
        local tabhandle = api.nvim_get_current_tabpage()
        -- go to parent tabpage
        if parent_tabs[tabhandle] ~= nil then
          cmd(("normal! %sgt"):format(parent_tabs[tabhandle]))
        else
          cmd("tabprevious")
        end
        -- close tab
        cmd("tabc! " .. tabnr_to_close)
      end, { noremap = true, silent = true, buffer = opts.buf })
    end
    -- other shortcuts
    if vim.tbl_contains(q_quit_fts, ft) then
      map("n", "q", ":quit<CR>", { noremap = true, silent = true, nowait = true, buffer = opts.buf })
    end
    if ft == "qf" then
      map("n", "<Esc>", function()
        cmd.wincmd("p")
        cmd.cclose()
      end, { noremap = true, silent = true, nowait = true, buffer = opts.buf })
    end
  end,
})
