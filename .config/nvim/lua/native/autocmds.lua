local augroup = vim.api.nvim_create_augroup('native.autocmds', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function() vim.hl.on_yank({ timeout = 200 }) end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local line = vim.fn.line([["']])
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd([[normal! g'"]])
    end
  end,
})
