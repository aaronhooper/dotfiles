local ok, tokyonight = pcall(require, "tokyonight")

if not ok then
  vim.cmd.colorscheme("habamax")
end

tokyonight.setup({
  style = "night",
  light_style = "day",
  styles = {
    comments = { italic = true },
  },
})

vim.cmd.colorscheme("tokyonight")
