-- To extend you may use M._internal changes are tracked there.
local T = vim.treesitter
local Q = vim.treesitter.query
local L = vim.lsp.buf
local A = vim.api
local util = require("nvim-treesitter.ts_utils")

local M = {}
M._internal = {}
M._config = {
  match = "IncSearch",
  single = "Visual",
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
    if not M._internal.match_state or #M._internal.matches < 1 then
      return
    end
    if not M._internal.match_state.current then
      return
    end
    position = M._internal.match_state.current.position
    local total = #M._internal.match_state.nodes
    return math.min(math.max(1, position), total), total
  end
  M._internal.match_state.current.position = position
  local node = M._internal.match_state.nodes[position]
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

-- TODO: store window/buf info and delete appropriately
function M.match(match_string)
  local window = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(window)
  if M._internal.matches and #M._internal.matches > 0 then
    M.unmatch(window)
  end
  if M._internal.match_state and #M._internal.match_state > 0 then
    M.unmatch(window)
  end

  local search_node = T.get_node_at_cursor(window)
  if not search_node then
    return
  end

  local curse = util.get_node_at_cursor(window)
  if curse then
    curse = {
      range = { curse:range() },
      type = curse:type(),
      data = Q.get_node_text(curse, buf),
    }
  end

  local query = string.format(M._config.query, search_node)
  local root = T.get_parser(buf):parse()[1]:root()
  local parsed = Q.parse_query(vim.bo.filetype, query)
  M._internal.match_state = { nodes = {}, current = curse }
  M._internal.matches = vim.F.if_nil(M._internal.matches, {})

  ---@diagnostic disable-next-line: missing-parameter
  for _, node, _ in parsed:iter_captures(root, query) do
    if not curse then
      break
    end
    local data = Q.get_node_text(node, 0)
    if match_string == curse.data or data == curse.data then
      table.insert(M._internal.match_state.nodes, { node:range() })
      -- TODO: window to match id mapping to delete appropriately
      table.insert(M._internal.matches, vim.fn.matchadd(M._config.match, data))
    end
  end

  if curse then
    for index, info in ipairs(M._internal.match_state.nodes) do
      if
        info[1] == curse.range[1]
        and info[2] == curse.range[2]
        and info[3] == curse.range[3]
        and info[4] == curse.range[4]
      then
        M._internal.match_state.current.position = index
        break
      end
    end
  end
end

function M.unmatch(window)
  M._internal.matches = vim.F.if_nil(M._internal.matches, {})
  M._internal.match_state = vim.F.if_nil(M._internal.match_state, {})
  for _, identity in ipairs(M._internal.matches) do
    vim.fn.matchdelete(identity, window or 0)
  end
  M._internal.matches = nil
  M._internal.match_state = nil
end

function M.cmd()
  A.nvim_create_user_command("NodeNx", function()
    M.cycle_next()
  end, { desc = M._config.map.items[1][4] })
  A.nvim_create_user_command("NodePv", function()
    M.cycle_prev()
  end, { desc = M._config.map.items[2][4] })
  A.nvim_create_user_command("NodeRm", function()
    M.unmatch()
  end, { desc = M._config.map.items[3][4] })
  A.nvim_create_user_command("NodeMh", function(...)
    M.match((...).fargs[1])
  end, {
    desc = M._config.map.items[4][4],
    nargs = "?",
  })
  A.nvim_create_user_command("NodeTg", function()
    if M._internal.match_state then
      M.unmatch()
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
