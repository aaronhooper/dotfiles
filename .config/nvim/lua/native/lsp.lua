-- NOTE:
-- 1) Install language servers yourself on PATH (e.g. rust-analyzer, lua-language-server, typescript-language-server)
-- 2) Use :checkhealth vim.lsp if something does not attach.

-- Define server configs
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy" },
      lens = {
        enable = true,
        references = {
          adt = {
            enable = true,
          }
        }
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "none",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "none",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayVariableTypeHints = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})

vim.lsp.config("sourcekit-lsp", {
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "objc", "objcpp", "c", "cpp" },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, {
      { "Package.swift", "compile_commands.json" },
      function(name)
        return name:match("%.xcworkspace$")
            or name:match("%.xcodeproj$")
      end,
      ".git",
    })

    on_dir(root)
  end,
})

vim.lsp.config('zls', {
  cmd = { 'zls' },
  filetypes = { 'zig' },
  root_markers = { 'build.zig', ".git" },
})

vim.lsp.config("superhtml", {
  cmd = { "superhtml", "lsp" },
  filetypes = { "html" },
  root_markers = { ".git" },
})

-- Enable the LSPs
vim.lsp.enable({ "lua_ls", "rust_analyzer", "ts_ls", "sourcekit-lsp", "zls", "superhtml" })

local augroup = vim.api.nvim_create_augroup("native.lsp", { clear = true })

-- Enable and bind capabilities
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local function lsp_map(lhs, rhs, desc, mode)
      vim.keymap.set(mode or "n", lhs, rhs, { buffer = args.buf, desc = "LSP: " .. desc })
    end

    -- Navigation / actions
    lsp_map("grn", vim.lsp.buf.rename, "Rename")
    lsp_map("gra", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })
    lsp_map("grr", require("telescope.builtin").lsp_references, "Goto References")
    lsp_map("gri", require("telescope.builtin").lsp_implementations, "Goto Implementation")
    lsp_map("grd", require("telescope.builtin").lsp_definitions, "Goto Definition")
    lsp_map("grD", vim.lsp.buf.declaration, "Goto Declaration")
    lsp_map("grt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

    -- Symbols
    lsp_map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
    lsp_map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

    -- Hover / signature help
    lsp_map("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover")
    lsp_map("<C-k>", vim.lsp.buf.signature_help, "Signature help", "i")

    -- Toggle diagnostics
    lsp_map("<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, "Toggle Diagnostics")

    -- Inlay hints
    if client and client:supports_method("textDocument/inlayHint", args.buf) then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })

      lsp_map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
      end, "Toggle inlay hints")
    end

    -- Document highlights
    if client and client:supports_method("textDocument/documentHighlight", args.buf) then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd("LspDetach", {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- Autocomplete
    if client and client:supports_method('textDocument/completion', args.buf) then
      vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
    end

    -- Codelens
    -- if client and client:supports_method('textDocument/codeLens', args.buf) then
    --   vim.lsp.codelens.enable(true, { bufnr = args.buf })
    -- end

    -- Folding
    if client and client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
