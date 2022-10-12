call plug#begin()
Plug 'elixir-editors/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'ggandor/leap.nvim'
call plug#end()

lua require('leap').add_default_mappings()

set hlsearch
set incsearch
set number
set relativenumber
set smartcase
set ignorecase

" remove the white bottom bar
set laststatus=0 ruler

nnoremap Y y%
