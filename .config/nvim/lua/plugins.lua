return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'elixir-editors/vim-elixir'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'tpope/vim-repeat'
    use {
        'ggandor/leap.nvim',
        config = function() require('leap').add_default_mappings() end
    }
    use { 'neoclide/coc.nvim', branch = 'release' }
end)
