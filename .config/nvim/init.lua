require('plugins')
require('coc-config')

local lualine = require('lualine')
local treesitter_configs = require('nvim-treesitter.configs')
local telescope = require('telescope')

-- Plugin setup
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

treesitter_configs.setup {
  -- `ensure_installed = "all"` hangs Neovim for ages on Windows, so
  -- only specifying parsers from
  -- https://github.com/nvim-treesitter/nvim-treesitter#modules
  -- and others that are explicitly needed.
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "query",
    "javascript",
    "typescript",
  },
  highlight = { enable = true },
  indent = { enable = true },
}

telescope.load_extension "file_browser"

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

-- Keyboard mappings
vim.api.nvim_set_keymap(
  "n",
  "Y",
  "y$",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "jj",
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

-- Open Telescope file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
  { noremap = true }
)

-- Highlight cursor line
vim.cmd([[
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
]])

-- Theme
vim.cmd("colorscheme tokyonight")
