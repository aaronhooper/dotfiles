""""""""""""""""""
"""" SETTINGS """"
""""""""""""""""""

set nocp
set number
set hlsearch
set incsearch
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set ignorecase
set smartcase
set textwidth=72
set laststatus=2

filetype plugin on


""""""""""""""""""
"""" BINDINGS """"
""""""""""""""""""

" Escape remap
inoremap jj <esc>

" Yank polyfill
inoremap Y y$


"""""""""""""""""
"""" PLUGINS """"
"""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='alduin'
