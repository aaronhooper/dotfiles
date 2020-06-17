""""""""""""""""""
"""" SETTINGS """"
""""""""""""""""""

set nocp
set number
set relativenumber
set hlsearch
set incsearch
set ignorecase
set smartcase
set textwidth=72
set laststatus=2
set backspace=indent,eol,start
set mouse+=a
set noshowmode
set nowrap

" Explanations of the following indent settings
" https://vim.fandom.com/wiki/Indenting_source_code#Explanation_of_the_options
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
filetype plugin indent on


""""""""""""""""""
"""" BINDINGS """"
""""""""""""""""""

" Escape remap
inoremap jj <esc>

" Yank polyfill
nnoremap Y y$

""""""""""""""""""
"""" COMMANDS """"
""""""""""""""""""

" Use :W to save a file with sudo
com -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod


"""""""""""""""""
"""" PLUGINS """"
"""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'

call plug#end()


"""""""""""""""""""""""""
"""" PLUGIN SETTINGS """"
"""""""""""""""""""""""""

" Airline
let g:airline_theme='alduin'
