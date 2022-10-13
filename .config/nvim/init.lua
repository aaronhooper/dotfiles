vim.cmd([[
call plug#begin()
Plug 'elixir-editors/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'ggandor/leap.nvim'
call plug#end()
]])

require('leap').add_default_mappings()

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.ruler = true

vim.api.nvim_set_keymap(
	"n",
	"Y",
	"y$",
	{ noremap = true }
)
