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

filetype plugin on


""""""""""""""""""
"""" BINDINGS """"
""""""""""""""""""

"let mapleader = " "

" Escape remap
inoremap jj <esc>

" Yank polyfill
inoremap Y y$


"""""""""""""""""
"""" PLUGINS """"
"""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

call plug#end()

