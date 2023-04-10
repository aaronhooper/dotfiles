require('plugins')
require('coc-config')
require('leap').add_default_mappings()

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
}

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.ruler = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 72

-- Keyboard mappings
vim.api.nvim_set_keymap(
	"n",
	"Y",
	"y$",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
    "i",
    "jk",
    "<esc>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
    "i",
    "kj",
    "<esc>",
	{ noremap = true }
)

vim.g.mapleader = " "

-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Highlight cursor line
vim.cmd([[
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
]])

-- Theme
vim.cmd("colorscheme nightfox")
