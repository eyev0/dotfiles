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
    " autocmd ColorScheme * highlight! link VirtualTextWarning DiagnosticSignWarn
    " autocmd ColorScheme * highlight! link VirtualTextError DiagnosticSignError
  augroup END
]])

vim.cmd([[
fun! SetQsColors()
  augroup QuickScopeColors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
  augroup END
endfun
call SetQsColors()
]])

vim.o.background = O.background
-- gruvbox-material
vim.g.gruvbox_material_palette = O.pallete
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
-- tokyonight
-- storm or night
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_dark_sidebar = false

vim.cmd("colorscheme " .. O.colorscheme)
