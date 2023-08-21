-- Leader key
vim.g.mapleader = " "

-- Plugins
require('plugins')

-- Vim settings
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
vim.opt.autoread = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.showmode = false

-- Yank line
vim.api.nvim_set_keymap(
  "n", "Y", "y$",
  { noremap = true }
)

-- Mash escape
vim.api.nvim_set_keymap(
  "i", "jj", "<esc>",
  { noremap = true }
)

-- Split lines
vim.cmd [[
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>
]]

