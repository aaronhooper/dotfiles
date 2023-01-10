local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'elixir-editors/vim-elixir'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'tpope/vim-repeat'
    use 'ggandor/leap.nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }
    use "EdenEast/nightfox.nvim"
    use 'neoclide/vim-jsx-improve'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
