-- if vim.fn.exists("g:colorscheme_defined") == 1 then
--   return
-- end
-- Normal ctermfg=#223 ctermbg=#235 guifg=#ebdbb2 guibg=#282828
-- vim.cmd[[au ColorScheme * hi! NormalInactive ctermfg=223 ctermbg=235]]
-- vim.cmd[[au ColorScheme * hi! NormalFloat ctermfg=223 ctermbg=235]]
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
-- gruvbox
vim.g.gruvbox_contrast_light = O.contrast
vim.g.gruvbox_contrast_dark = O.contrast
-- tokyonight
-- storm or night
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_dark_sidebar = false

vim.cmd("colorscheme " .. O.colorscheme)
vim.g.colorscheme_defined = 1
