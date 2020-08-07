syntax on

set relativenumber
set nohlsearch
set hidden
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set cmdheight=2
set updatetime=50
set shortmess+=c
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Install vim-plug
" https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'jcherven/jummidark.vim'

call plug#end()

colorscheme gruvbox
set background=dark
set t_Co=256

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
