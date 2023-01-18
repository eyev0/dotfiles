-- Highlight line number instead of having icons in sign column
vim.cmd([[
  augroup DiagnosticsHighlighting
    autocmd!
    autocmd ColorScheme * highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
    autocmd ColorScheme * highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
    autocmd ColorScheme * highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
    autocmd ColorScheme * highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
    " autocmd ColorScheme * sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    autocmd ColorScheme * sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    autocmd ColorScheme * sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    autocmd ColorScheme * sign define DiagnosticSignInfo text= texthl= linehl=DiagnosticSignInfo numhl=DiagnosticLineNrInfo
    autocmd ColorScheme * sign define DiagnosticSignHint text= texthl= linehl=DiagnosticSignHint numhl=DiagnosticLineNrHint
    " colorful virtual text
    " autocmd ColorScheme * highlight! link VirtualTextHint DiagnosticSignHint
    " autocmd ColorScheme * highlight! link VirtualTextInfo DiagnosticSignInfo
    autocmd ColorScheme * highlight! link VirtualTextWarning DiagnosticSignWarn
    autocmd ColorScheme * highlight! link VirtualTextError DiagnosticSignError
    autocmd ColorScheme * hi CurSearch ctermfg=235 ctermbg=167 guifg=#282828 guibg=#db4740
    autocmd ColorScheme * hi Search ctermfg=235 ctermbg=142 guifg=#282828 guibg=#b0b846
  augroup END
]])
-- vim.cmd("hi CurSearch cterm=bold ctermfg=142 gui=bold guifg=#b0b846")
-- IncSearch ctermfg=235 ctermbg=167 guifg=#282828 guibg=#db4740
