call plug#begin()
Plug 'elixir-editors/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
call plug#end()

" required for vim-elixir
syntax on
filetype plugin indent on

set hlsearch
set incsearch
set number
set relativenumber
set smartcase
set ignorecase

" remove the white bottom bar
set laststatus=0 ruler

nnoremap Y y%
