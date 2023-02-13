Lsp = {}
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local qf = require("rc.plugins.qf")

Lsp.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  Keymap.set_lsp_buf_shortcuts(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    local ok, navic = pcall(require, "nvim-navic")
    if ok then
      vim.b.navic_lazy_update_context = true
      navic.attach(client, bufnr)
    end
  end
end
-- LSP Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
-- for cmp.nvim
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
Lsp.capabilities = capabilities

local diag_float_winid = nil
local function open_diag_float()
  _, diag_float_winid = vim.diagnostic.open_float({
    bufnr = 0,
    scope = "cursor",
    severity_sort = true,
    -- source = "if_many",
    source = true,
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
      "BufLeave",
      "InsertEnter",
      "InsertLeave",
      "TextYankPost",
      "CmdlineChanged",
      "CmdlineEnter",
      "CmdlineLeave",
      "BufModifiedSet",
    },
  })
end

local diagnostic_aug_id = nil
local function toggle_diagnostic_float_aug(flag)
  if flag then
    diagnostic_aug_id = vim.api.nvim_create_augroup("DiagnosticFloatPreview", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      group = diagnostic_aug_id,
      callback = open_diag_float,
    })
  else
    if diagnostic_aug_id ~= nil then
      vim.api.nvim_del_augroup_by_id(diagnostic_aug_id)
    end
  end
end

local diagnostic_float_active = false
Lsp.toggle_diagnostic_float = function()
  diagnostic_float_active = not diagnostic_float_active
  if not diagnostic_float_active and diag_float_winid ~= nil then
    vim.api.nvim_win_close(diag_float_winid, false)
  end
  toggle_diagnostic_float_aug(diagnostic_float_active)
end

local diagnostics_virt_lines_switch = false
Lsp.toggle_diagnostic_virt_lines = function()
  if diagnostics_virt_lines_switch then
    vim.diagnostic.config({ virtual_lines = false })
  else
    vim.diagnostic.config({ virtual_lines = true })
  end
  diagnostics_virt_lines_switch = not diagnostics_virt_lines_switch
end

local function print_severity()
  require("noice").redirect(function()
    print("Lsp.diagnostic_min_severity is", vim.diagnostic.severity[Lsp.diagnostic_min_severity])
  end, { { filter = { event = "msg_show" }, view = "mini" } })
end
local default_severity = vim.diagnostic.severity.WARN
Lsp.diagnostic_min_severity = default_severity
Lsp.up_diagnostic_min_severity = function()
  Lsp.diagnostic_min_severity = math.max(Lsp.diagnostic_min_severity - 1, vim.diagnostic.severity.ERROR)
  print_severity()
end
Lsp.down_diagnostic_min_severity = function()
  Lsp.diagnostic_min_severity = math.min(Lsp.diagnostic_min_severity + 1, vim.diagnostic.severity.HINT)
  print_severity()
end
Lsp.shift_diagnostic_min_severity = function()
  Lsp.diagnostic_min_severity = Lsp.diagnostic_min_severity + 1
  if Lsp.diagnostic_min_severity > vim.diagnostic.severity.HINT then
    Lsp.diagnostic_min_severity = vim.diagnostic.severity.ERROR
  end
  print_severity()
end
Lsp.reset_diagnostic_min_severity = function()
  Lsp.diagnostic_min_severity = default_severity
  print_severity()
end

local jumplist = require("jumplist")

-- TODO: winscrolled freezes a bit on large help files

---@param options table qf {what} table, see :h setqflist-what
---@param open boolean? Open quickfix? (default = true)
---@param jump boolean? Jump to first entry? (default = true)
function Lsp.on_list(options, open, jump)
  -- pprint("on_list", options, open, jump)
  if options.items == nil or #options.items == 0 then
    vim.notify("No items")
    return
  end
  local n_items = #options.items
  local entry = options.items[1]
  open = vim.F.if_nil(open, true) and n_items > 1
  jump = vim.F.if_nil(jump, true)
  qf.set_jumplist()
  jumplist.mark()
  fn.setqflist({}, " ", options)
  if jump then
    -- Here we try to reuse open window containing first item
    -- Find window containing first item
    -- if such window exists, open first item there (could be another tab),
    -- then open qf window and return to prev window position.
    -- If such window doesn't exist, use cfirst to jump
    --
    local win
    while true do
      -- current window contains buffer containing first item?
      if qf.win_has_item(entry, api.nvim_get_current_win()) then
        win = api.nvim_get_current_win()
        break
      end
      -- check all open windows
      for _, open_win in ipairs(api.nvim_list_wins()) do
        if qf.win_has_item(entry, open_win) then
          win = open_win
          break
        end
      end
      break
    end
    -- TODO: check switchbuf option has useopen or usetab
    if win ~= nil then
      -- found window containing first item
      -- go to window, open qf, refocus window, set cursor position
      fn.win_gotoid(win)
    else
      win = api.nvim_get_current_win()
    end
    if open then
      qf.open(n_items, false, false, false)
    end
    if entry.filename ~= api.nvim_buf_get_name(api.nvim_win_get_buf(win)) then
      cmd("edit " .. entry.filename)
    end
    api.nvim_win_set_cursor(win, { entry.lnum, entry.col - 1 })
    -- qf.set_jumplist(entry.bufnr, entry.lnum, entry.col - 1)
    jumplist.mark()
  elseif open then
    qf.open(n_items, false, false, false)
  end
end

-- disable updating diagnostics in insert
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = false,
})

require("rc.plugins.neoconf")

require("rc.plugins.neodev")

require("rc.plugins.lsp.vuels")
-- require("rc.plugins.lsp.eslint")
require("rc.plugins.lsp.tsserver")
-- require("rc.plugins.lsp.volar")
require("rc.plugins.lsp.sumneko")
require("rc.plugins.lsp.teal_ls")
-- require("rc.plugins.lsp.rust_analyzer")
require("rc.plugins.lsp.rls")
require("rc.plugins.lsp.solidity")
require("rc.plugins.lsp.jdtls")
require("rc.plugins.lsp.pyright")
require("rc.plugins.lsp.jsonls")
require("rc.plugins.lsp.bashls")
require("rc.plugins.lsp.yamlls")
require("rc.plugins.lsp.dockerls")
require("rc.plugins.lsp.html")
require("rc.plugins.lsp.clangd")
require("rc.plugins.lsp.gopls")
require("rc.plugins.lsp.graphql")
