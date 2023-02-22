-- To extend you may use M._internal changes are tracked there.
local T = vim.treesitter
local Q = vim.treesitter.query
local L = vim.lsp.buf
local A = vim.api
local util = require("nvim-treesitter.ts_utils")

local M = {}

---@class Match
---@field window number
---@field id number
local matches = {}
local match_state = {}

M._config = {
  match = "IncSearch",
  single = "Visual",
  -- TODO: query for current node's type exactly
  query = "(%s) @_",
  cmd = false,
  heavy = false,
  word = {
    enable = false,
    items = {
      "identifier",
      "property_identifier",
    },
  },
  map = {
    enable = false,
    items = {
      {
        "n",
        "tn",
        ":NodeNx<CR>",
        { noremap = true, silent = true, nowait = true, desc = "Goto next match." },
      },
      {
        "n",
        "ts",
        ":NodeMh<CR>",
        {
          noremap = true,
          silent = true,
          nowait = true,
          desc = "Match nodes with a custom string or node#text.",
        },
      },
      {
        "n",
        "tp",
        ":NodePv<CR>",
        { noremap = true, silent = true, nowait = true, desc = "Goto prev match." },
      },
      {
        "n",
        "tw",
        ":NodeRm<CR>",
        { noremap = true, silent = true, nowait = true, desc = "Remove match highlights." },
      },
      {
        "n",
        "t;",
        ":NodeTg<CR>",
        { noremap = true, silent = true, nowait = true, desc = "Toggle match" },
      },
    },
  },
}

local function any(key, items)
  for _, item in ipairs(items) do
    if key == item then
      return true
    end
  end
  return false
end

-- stolen from https://github.com/AlphaKeks
function M.word(nodes)
  nodes = vim.F.if_nil(nodes, M._config.word.items)
  M._internal.aucmds = vim.F.if_nil(M._internal.aucmds, {})
  if M._internal.aucmds.word then
    A.nvim_del_autocmd(M._internal.aucmds.word)
  end
  M._internal.aucmds.word = A.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
      local node = util.get_node_at_cursor()
      if not node then
        return
      end
      local node_text = Q.get_node_text(node, 0)

      if M._internal.current_node ~= node_text then
        M._internal.current_node = node_text
        L.clear_references()
        local node_type = T.get_node_at_cursor()
        if any(node_type, nodes) then
          L.document_highlight()
        end
      end
    end,
  })
end

function M.heavy()
  M._internal.aucmds = vim.F.if_nil(M._internal.aucmds, {})
  if M._internal.aucmds.heavy then
    A.nvim_del_autocmd(M._internal.aucmds.heavy)
  end
  M._internal.aucmds.heavy = A.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
      pcall(M.match)
    end,
  })
end

local function _cycle(apply, position)
  if not apply then
    if not match_state.current or #matches < 1 then
      return
    end
    position = match_state.current.position
    local total = #match_state.nodes
    return math.min(math.max(1, position), total), total
  end
  match_state.current.position = position
  local node = match_state.nodes[position]
  A.nvim_win_set_cursor(0, { node[1] + 1, node[2] })
end

function M.cycle_next()
  local position, total = _cycle(false)
  if position == nil then
    return
  elseif position == total then
    position = 0
  end
  _cycle(true, position + 1)
end

function M.cycle_prev()
  local position, total = _cycle(false)
  if position == nil then
    return
  elseif position == 1 then
    position = total + 1
  end
  _cycle(true, position - 1)
end

function M.match(match_string)
  local window = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(window)
  if #matches > 0 then
    M.clear_matches()
  end
  --
  local search_node = T.get_node_at_cursor(window)
  if not search_node then
    return
  end
  local cursor_node = util.get_node_at_cursor(window)
  if cursor_node then
    cursor_node = {
      range = { cursor_node:range() },
      type = cursor_node:type(),
      data = Q.get_node_text(cursor_node, buf),
    }
  end
  --
  local query = string.format(M._config.query, search_node)
  local root = T.get_parser(buf):parse()[1]:root()
  local parsed = Q.parse_query(vim.bo.filetype, query)
  match_state = { nodes = {}, current = cursor_node }
  --
  ---@diagnostic disable-next-line: missing-parameter
  for _, node, _ in parsed:iter_captures(root, query) do
    if not cursor_node then
      break
    end
    local data = Q.get_node_text(node, buf)
    if match_string == cursor_node.data or data == cursor_node.data then
      table.insert(match_state.nodes, { node:range() })
      table.insert(matches, { window = window, id = vim.fn.matchadd(M._config.match, data) })
    end
  end
  --
  if cursor_node then
    for index, info in ipairs(match_state.nodes) do
      if
        info[1] == cursor_node.range[1]
        and info[2] == cursor_node.range[2]
        and info[3] == cursor_node.range[3]
        and info[4] == cursor_node.range[4]
      then
        match_state.current.position = index
        break
      end
    end
  end
end

function M.clear_matches()
  for _, match in ipairs(matches) do
    vim.fn.matchdelete(match.id, match.window)
  end
  matches = {}
  match_state = {}
end

function M.cmd()
  A.nvim_create_user_command("NodeNx", function()
    M.cycle_next()
  end, { desc = M._config.map.items[1][4] })
  A.nvim_create_user_command("NodePv", function()
    M.cycle_prev()
  end, { desc = M._config.map.items[2][4] })
  A.nvim_create_user_command("NodeRm", function()
    M.clear_matches()
  end, { desc = M._config.map.items[3][4] })
  A.nvim_create_user_command("NodeMh", function(...)
    M.match((...).fargs[1])
  end, {
    desc = M._config.map.items[4][4],
    nargs = "?",
  })
  A.nvim_create_user_command("NodeTg", function()
    if match_state.current ~= nil then
      M.clear_matches()
    else
      pcall(M.match)
    end
  end, { desc = M._config.map.items[5][4] })
end

function M.map()
  for _, map in ipairs(M._config.map.items) do
    vim.keymap.set(map[1], map[2], map[3], map[4])
  end
end

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  if M._config.word.enable then
    M.word()
  end
  if M._config.heavy then
    M.heavy()
  end
  if M._config.cmd then
    M.cmd()
  end
  if M._config.map.enable then
    M.map()
  end
end

return M
