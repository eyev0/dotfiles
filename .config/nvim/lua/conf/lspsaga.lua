local saga = require'lspsaga'
saga.init_lsp_saga {
  use_saga_diagnostic_sign = false,
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  code_action_keys = {
    quit = {'<Esc>','q'},
    exec = '<CR>'
  },
  rename_action_keys = {
    quit = {
      '<C-c>',
      '<C-d>',
    },
    exec = '<CR>'
  },
}
