vim.o.number = true
--vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"
vim.o.pumborder = "rounded"
vim.o.winborder = "rounded"

-- Indentation defaults
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Enable true color if terminal supports it
vim.o.termguicolors = true

-- Faster completion UX with built-in completion
vim.o.completeopt = "menu,menuone,popup,fuzzy,noselect,noinsert,preview"

-- Folding
vim.o.foldenable = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
