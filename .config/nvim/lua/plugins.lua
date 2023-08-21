function coc_settings()
  -- Some servers have issues with backup files, see #649
  vim.opt.backup = false
  vim.opt.writebackup = false

  -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
  -- delays and poor user experience
  vim.opt.updatetime = 300

  -- Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appeared/became resolved
  vim.opt.signcolumn = "yes"

  local keyset = vim.keymap.set
  -- Autocomplete
  function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- Use Tab for trigger completion with characters ahead and navigate
  -- NOTE: There's always a completion item selected by default, you may want to enable
  -- no select by setting `"suggest.noselect": true` in your configuration file
  -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
  -- other plugins before putting this into your config
  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
  keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

  -- Make <CR> to accept selected completion item or notify coc.nvim to format
  -- <C-g>u breaks current undo, please make your own choice
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  -- Use <c-j> to trigger snippets
  keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
  -- Use <c-space> to trigger completion
  keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

  -- Use `[g` and `]g` to navigate diagnostics
  -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
  keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
  keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

  -- GoTo code navigation
  keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
  keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
  keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
  keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

  -- Use K to show documentation in preview window
  function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
      else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
  end
  keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  vim.api.nvim_create_augroup("CocGroup", {})
  vim.api.nvim_create_autocmd("CursorHold", {
      group = "CocGroup",
      command = "silent call CocActionAsync('highlight')",
      desc = "Highlight symbol under cursor on CursorHold"
  })

  -- Symbol renaming
  keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

  -- Formatting selected code
  keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
  keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

  -- Setup formatexpr specified filetype(s)
  vim.api.nvim_create_autocmd("FileType", {
      group = "CocGroup",
      pattern = "typescript,json",
      command = "setl formatexpr=CocAction('formatSelected')",
      desc = "Setup formatexpr specified filetype(s)."
  })

  -- Update signature help on jump placeholder
  vim.api.nvim_create_autocmd("User", {
      group = "CocGroup",
      pattern = "CocJumpPlaceholder",
      command = "call CocActionAsync('showSignatureHelp')",
      desc = "Update signature help on jump placeholder"
  })

  -- Apply codeAction to the selected region
  -- Example: `<leader>aap` for current paragraph
  local opts = {silent = true, nowait = true}
  keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
  keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

  -- Remap keys for apply code actions at the cursor position.
  keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
  -- Remap keys for apply code actions affect whole buffer.
  keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
  -- Remap keys for applying codeActions to the current buffer
  keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
  -- Apply the most preferred quickfix action on the current line.
  keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

  -- Remap keys for apply refactor code actions.
  keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
  keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
  keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

  -- Run the Code Lens actions on the current line
  keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


  -- Map function and class text objects
  -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
  keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
  keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
  keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
  keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
  keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
  keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
  keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
  keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


  -- Remap <C-f> and <C-b> to scroll float windows/popups
  ---@diagnostic disable-next-line: redefined-local
  local opts = {silent = true, nowait = true, expr = true}
  keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
  keyset("i", "<C-f>",
         'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
  keyset("i", "<C-b>",
         'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
  keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


  -- Use CTRL-S for selections ranges
  -- Requires 'textDocument/selectionRange' support of language server
  keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
  keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


  -- Add `:Format` command to format current buffer
  vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

  -- " Add `:Fold` command to fold current buffer
  vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

  -- Add `:OR` command for organize imports of the current buffer
  vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

  -- Add (Neo)Vim's native statusline support
  -- NOTE: Please see `:h coc-status` for integrations with external plugins that
  -- provide custom statusline: lightline.vim, vim-airline
  vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

  -- Mappings for CoCList
  -- code actions and coc stuff
  ---@diagnostic disable-next-line: redefined-local
  local opts = {silent = true, nowait = true}
  -- Show all diagnostics
  keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
  -- Manage extensions
  keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
  -- Show commands
  keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
  -- Find symbol of current document
  keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
  -- Search workspace symbols
  keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
  -- Do default action for next item
  keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
  -- Do default action for previous item
  keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
  -- Resume latest coc list
  keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
end

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

