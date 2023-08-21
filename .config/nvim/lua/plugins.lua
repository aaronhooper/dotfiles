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

require("lazy").setup({
  'folke/tokyonight.nvim',
  'mattn/emmet-vim',
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-repeat',
  'vimpostor/vim-tpipeline',
  {
    'neoclide/coc.nvim',
    branch = 'release',
    build = ':CocUpdate',
    config = function () require('coc-config') end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "typescript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function () require('lualine-config') end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}, { defaults = { lazy = false } })
