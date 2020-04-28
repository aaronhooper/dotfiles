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
set scrolloff=7
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

" NERDTree remap
map <C-b> :NERDTreeToggle<cr>

" Move lines/selection
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

noremap <C-a> ^
noremap <C-e> $

"""""""""""""""""
"""" PLUGINS """"
"""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

