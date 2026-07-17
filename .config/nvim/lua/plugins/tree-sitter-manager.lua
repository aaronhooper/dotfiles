require("tree-sitter-manager").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "rust",
    "swift",
    "zig",
  },
})
