local ok, oil = pcall(require, "oil")

if not ok then
  return
end

oil.setup({
  float = {
    max_width = 80,
    max_height = 24,
  }
})

vim.keymap.set("n", "-", oil.open_float, { desc = "Open parent directory" })
