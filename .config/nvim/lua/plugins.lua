function lualine_settings()
  require('lualine').setup {
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
end

function treesitter_settings ()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "elixir",
      "typescript",
      "html"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

function telescope_settings ()
  local builtin = require('telescope.builtin')

  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

function telescope_fb_settings ()
  require('telescope').load_extension "file_browser"

  vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
    { noremap = true }
  )
end

function tokyonight_settings ()
  -- Highlight cursor line
  vim.cmd [[
  set cursorline
  hi cursorline cterm=none term=none
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  highlight CursorLine guibg=#303000 ctermbg=234
  ]]

  vim.cmd("colorscheme tokyonight")
end

-- Lazy install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy config
require("lazy").setup({
  {
    'folke/tokyonight.nvim',
    config = tokyonight_settings,
  },
  'mattn/emmet-vim',
  'tpope/vim-repeat',
  'vimpostor/vim-tpipeline',
  -- Disabling coc.nvim until they fix their shit
  --{
  --  'neoclide/coc.nvim',
  --  branch = 'release',
  --  build = ':CocInstall',
  --  config = coc_settings,
  --},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = telescope_settings,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = treesitter_settings,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = telescope_fb_settings,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = lualine_settings,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
})

