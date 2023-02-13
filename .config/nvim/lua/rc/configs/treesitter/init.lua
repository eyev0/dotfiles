local config = {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = function(_, buf)
      local max_filesize = 1000 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  rainbow = {
    enable = false,
    extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 30, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },
  -- refactor = {
  -- 	-- highlight_definitions = { enable = true },
  -- 	-- highlight_current_scope = { enable = false },
  -- },
  context_commentstring = {
    enable = true,
  },
  pairs = {
    enable = true,
    disable = {},
    highlight_pair_events = { "CursorHold" }, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
    highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
    goto_right_end = true, -- whether to go to the end of the right partner or the beginning
    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
    keymaps = {
      goto_partner = "%",
      delete_balanced = "<leader>%d",
    },
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@attribute.outer",
        ["ia"] = "@attribute.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["am"] = "@comment.outer",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["iF"] = "@frame.inner",
        ["aF"] = "@frame.outer",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["as"] = "@statement.outer",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        -- Or you can define your own textobjects like this
        -- ["iF"] = {
        --   python = "(function_definition) @function",
        -- },
      },
    },
    swap = {
      enable = false,
      swap_next = {
        -- ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        -- ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = false,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]]"] = "@class.outer",
        -- ["]c"] = "@call.outer",
        ["]b"] = "@block.outer",
        ["]s"] = "@statement.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]["] = "@class.outer",
        -- ["]C"] = "@call.outer",
        ["]B"] = "@block.outer",
        ["]S"] = "@statement.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[["] = "@class.outer",
        -- ["[c"] = "@call.outer",
        ["[b"] = "@block.outer",
        ["[s"] = "@statement.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[]"] = "@class.outer",
        -- ["[C"] = "@call.outer",
        ["[B"] = "@block.outer",
        ["[S"] = "@statement.outer",
      },
    },
  },
}

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main",
  },
}

-- fix for jsonc
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.jsonc.used_by = "json"

require("nvim-treesitter.configs").setup(config)

require("rc.configs.treesitter.node").setup({
  match = "Search",
  map = { enable = true },
  cmd = true,
  -- heavy = true,
})
