-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function (entry, vim_item)
      --   ...
      --   return vim_item
      -- end
    })
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  else
    return t "<Tab>"
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

-- require'cmp'.setup {
  --   enabled = true;
  --   autocomplete = true;
  --   debug = false;
  --   min_length = 1;
  --   preselect = 'always';
  --   throttle_time = 34;
  --   source_timeout = 200;
  --   incomplete_delay = 400;
  --   max_abbr_width = 100;
  --   max_kind_width = 100;
  --   max_menu_width = 100;
  --   documentation = true,

  --   source = {
    --     nvim_lsp = { priority=7 };
    --     vsnip = { priority=6 };
    --     path = { priority=4 };
    --     nvim_lua = { priority=3 };
    --     -- nvim_lua = false;
    --     buffer = { priority=2 };
    --     calc = false;
    --     spell = false;
    --     tags = false;
    --     snippets_nvim = false;
    --     treesitter = false;
    --   };
    -- }

    -- local t = function(str)
      --   return vim.api.nvim_replace_termcodes(str, true, true, true)
      -- end

      -- -- Use (s-)tab to:
      -- --- move to prev/next item in completion menuone
      -- --- jump to prev/next snippet's placeholder
      -- _G.tab_complete = function()
        --   if vim.fn.pumvisible() == 1 then
        --     return t "<C-n>"
        --   elseif vim.fn.call("vsnip#available", {1}) == 1 then
        --     return t "<Plug>(vsnip-expand-or-jump)"
        --   else
        --     return t "<Tab>"
        --   end
        -- end
        -- _G.s_tab_complete = function()
          --   if vim.fn.pumvisible() == 1 then
          --     return t "<C-p>"
          --   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
          --     return t "<Plug>(vsnip-jump-prev)"
          --   else
          --     return t "<S-Tab>"
          --   end
          -- end
