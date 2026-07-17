local augroup = vim.api.nvim_create_augroup('native.pack', { clear = true })

vim.api.nvim_create_autocmd('PackChanged', {
  group = augroup,
  callback = function(event)
    if event.data.spec.name == 'telescope-fzf-native.nvim' then
      vim.system({ 'make' }, { cwd = event.data.path }):wait()
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/esmuellert/nvim-eslint" },
})
