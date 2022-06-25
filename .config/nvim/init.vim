call plug#begin()
Plug 'elixir-editors/vim-elixir'
call plug#end()

set hlsearch
set incsearch
set number
set relativenumber
set smartcase
set ignorecase

" highlight when lines exceed 80 chars
2mat ErrorMsg '\%81v.'

" remove the white bottom bar
set laststatus=0 ruler

nnoremap Y y%
