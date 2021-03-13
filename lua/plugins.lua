vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'Chiel92/vim-autoformat'}
    use {'airblade/vim-gitgutter'}
    use {'craigemery/vim-autotag'}
    use {
       'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'eviline' end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {'kshenoy/vim-signature'}
    use {'lilydjwg/colorizer'}
    use {'mbbill/undotree'}
    use {'neovim/nvim-lspconfig',
          -- requires = {{'nvim-lua/completion-nvim'}},
          requires = {{'hrsh7th/nvim-compe'}},
          config = function() require'lsp_custom_config' end}
    use {
        'nvim-telescope/telescope.nvim',
        config = function () require'telescope_config' end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
    }
    -- use {'nvim-treesitter/completion-treesitter'}
    use {'nvim-treesitter/nvim-treesitter',
          config = function() require'treesitter_config' end,
          run = ':TSUpdate'}
    use {'nvim-treesitter/playground'}
    use {'patstockwell/vim-monokai-tasty'}
    use {'puremourning/vimspector'}
    -- use {'steelsojka/completion-buffers'}
    use {'szw/vim-maximizer'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'wbthomason/packer.nvim'}
    use {'xolox/vim-misc'}
    use {'xolox/vim-notes'}
    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function() require"telescope".load_extension("frecency") end,
        requires = {{"tami5/sql.nvim"}}
    }
    use {'p00f/nvim-ts-rainbow', config = function() require'nvim-treesitter.configs'.setup {rainbow = { enable = true } } end }
    use {'rmagatti/auto-session'}
    use {'tjdevries/train.nvim'}
    use {'lukas-reineke/indent-blankline.nvim', branch='lua'}
end)
