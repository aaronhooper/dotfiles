local ok, telescope = pcall(require, "telescope")

if not ok then
  return
end

telescope.setup({
  defaults = {
    preview = {
      treesitter = true,
    }
  }
})

local utils = require("telescope.utils")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search Recent Files (\".\" for repeat)" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "  Find existing buffers" })

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ cwd = utils.buffer_dir() })
end, { desc = 'Find Files in current buffer directory' })

vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "/ Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
  builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files", })
end, { desc = "Search / in Open Files" })

vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search Neovim files" })
