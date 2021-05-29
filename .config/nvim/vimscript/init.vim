" " Install vim-plug if not found
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

" " Run PlugInstall if there are missing plugins
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"       \| PlugInstall --sync
"       \| endif

" call plug#begin('~/.config/nvim/plug')
" archive - unused
" Plug 'drzel/vim-repo-edit'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'windwp/nvim-spectre'
"
" TODO:
" move to packer.nvim
" convert config to lua
" explore useful stuff in nvcode repo
" TODO: Try these
" Plug 'brooth/far.vim'
" Plug 'glepnir/dashboard-nvim'
" Plug 'liuchengxu/vim-which-key'
" TODO: configure java
" Plug 'mfussenegger/nvim-jdtls'
" TODO: dunno about this..
" Plug 'ThePrimeagen/git-worktree.nvim'

" Plug 'tpope/vim-eunuch'
" Plug 'ojroques/nvim-bufdel'
" Plug 'Konfekt/FastFold'
" Plug 'tmhedberg/SimpylFold'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-obsession'
" " text editing sugar
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-unimpaired'
" Plug 'svermeulen/vim-cutlass'
" Plug 'svermeulen/vim-yoink'
" Plug 'svermeulen/vim-subversive'
" Plug 'unblevable/quick-scope'
" Plug 'tommcdo/vim-exchange'
" if !exists("g:vscode")
"   Plug 'glepnir/galaxyline.nvim'
"   Plug 'voldikss/vim-floaterm'
"   " Plug 'liuchengxu/vim-which-key'
"   Plug 'glepnir/indent-guides.nvim'
"   Plug 'lewis6991/gitsigns.nvim'
"   Plug 'mbbill/undotree'
"   Plug 'neovim/nvim-lspconfig'
"   Plug 'glepnir/lspsaga.nvim'
"   Plug 'cohama/lexima.vim'
"   Plug 'hrsh7th/nvim-compe'
"   Plug 'hrsh7th/vim-vsnip'
"   Plug 'hrsh7th/vim-vsnip-integ'
"   Plug 'rafamadriz/friendly-snippets'
"   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"   Plug 'nvim-treesitter/nvim-treesitter-refactor'
"   Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"   Plug 'nvim-treesitter/playground'
"   Plug 'p00f/nvim-ts-rainbow'
"   Plug 'romgrk/nvim-treesitter-context'
"   Plug 'nvim-lua/plenary.nvim'
"   Plug 'nvim-lua/popup.nvim'
"   Plug 'nvim-telescope/telescope.nvim'
"   Plug 'tjdevries/nlua.nvim'
"   Plug 'kyazdani42/nvim-web-devicons' " for file icons
"   Plug 'kyazdani42/nvim-tree.lua'
"   Plug 'dense-analysis/ale'
"   Plug 'lambdalisue/suda.vim'
"   Plug 'szw/vim-maximizer'
"   Plug 'tpope/vim-fugitive'
"   Plug 'glacambre/firenvim'
"   Plug 'puremourning/vimspector'
"   Plug 'preservim/tagbar'
"   Plug 'gruvbox-community/gruvbox'
"   " Plug 'vim-airline/vim-airline'
"   " Plug 'vim-airline/vim-airline-themes'
"   Plug 'christoomey/vim-tmux-navigator'
"   Plug 'tmux-plugins/vim-tmux'
" endif
" call plug#end()

" filetype plugin indent on
" syntax on

" nnoremap <SPACE> <Nop>
" let mapleader=" "

" let g:python3_host_prog = '$HOME/.venvs/neovim/bin/python'

" set hidden
" set confirm
" set autowrite
" set noswapfile
" set nobackup
" set nowritebackup
" set undofile
" set undodir=~/.vim/undodir
" set updatetime=25
" set timeout timeoutlen=300 nottimeout
" set shiftround
" set wildmenu
" set showcmd
" set visualbell
" set t_vb=
" set mouse=a
" set ruler
" set laststatus=2
" set cmdheight=2
" set title
" set nowrap
" set linebreak
" set splitbelow
" set splitright
" set nostartofline
" set hlsearch
" set incsearch
" set ignorecase
" set smartcase
" set ttyfast                " Faster redrawing.
" set lazyredraw             " Only redraw when necessary.
" set cursorline             " Find the current line quickly.
" set wrapscan               " Searches wrap around end-of-file.
" set report      =0         " Always report changed lines.
" set synmaxcol   =200       " Only highlight the first 200 columns.
" set scrolloff=9
" set sidescrolloff=3
" set relativenumber
" set number
" set signcolumn=yes:3
" set colorcolumn=80
" set noshowmode
" set viewoptions=cursor,folds,slash,unix
" " set foldmethod=expr
" " set foldexpr=nvim_treesitter#foldexpr()
" set clipboard+=unnamedplus
" set termguicolors
" " set diffopt+=iwhiteeol
" set shortmess+=c
" " set exrc
" set iskeyword+=-
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" " nmap Ж : nmap Н Y nmap н y nmap з p nmap ы s nmap с c nmap ф a nmap щ o nmap г u nmap З P nmap р h nmap о j nmap л k nmap д l
" set autoindent smartindent expandtab
" set shiftwidth=4 tabstop=4 softtabstop=4

" " disable highlighting matching parens
" let g:loaded_matchparen=1
" " firenvim
" let g:firenvim_config = {
"     \ 'globalSettings': {},
"     \ 'localSettings': {'.*': {}}
" \ }
" let fc = g:firenvim_config['localSettings']
" let fc['.*'] = { 'takeover': 'never' }
" " quick-scope
" let g:qs_max_chars=150
" let g:qs_lazy_highlight = 1
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" " ALE, use only for fixing
" let g:ale_disable_lsp = 1
" let g:ale_linters = {}
" let g:ale_linters_explicit = 1
" let g:ale_fixers = {
"       \   'python': ['black', 'isort', 'trim_whitespace'],
"       \   'xml': ['xmllint', 'remove_trailing_lines', 'trim_whitespace'],
"       \   'javascript': ['prettier'],
"       \   'javascriptreact': ['prettier'],
"       \   'typescript': ['prettier'],
"       \   'typescriptreact': ['prettier'],
"       \   'graphql': ['prettier'],
"       \   'json': ['prettier'],
"       \   'lua': ['luafmt', 'trim_whitespace', 'remove_trailing_lines'],
"       \ }
" " Yoink
" let g:yoinkMaxItems = 20
" let g:yoinkIncludeDeleteOperations = 1
" let g:yoinkMoveCursorToEndOfPaste = 1
" let g:yoinkSavePersistently = 1
" " Airline
" let g:airline_theme = 'gruvbox'
" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_powerline_fonts = 1
" if executable('rg')
"   let g:rg_derive_root='true'
" endif
" let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
" let g:tagbar_map_showproto = ''
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
" let g:fastfold_skip_filetypes = [ 'taglist' ]
" let g:tmux_navigator_no_mappings = 1

