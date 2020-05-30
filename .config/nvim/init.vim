""""""""""""""""""
"""" SETTINGS """"
""""""""""""""""""

set nocp
set number
set relativenumber
set hlsearch
set incsearch
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set autoindent
set ignorecase
set smartcase
set textwidth=72
set laststatus=2
set backspace=indent,eol,start

filetype plugin indent on


""""""""""""""""""
"""" BINDINGS """"
""""""""""""""""""

" Escape remap
inoremap jj <esc>

" Yank polyfill
nnoremap Y y$


"""""""""""""""""
"""" PLUGINS """"
"""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='alduin'
