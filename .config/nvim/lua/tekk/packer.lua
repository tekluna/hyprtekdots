vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'AlphaTechnolog/pywal.nvim',
        as = 'pywal'
    }

    -- Mason (LSP installer) - group these together
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',  -- Added missing lspconfig
        run = ":MasonUpdate"
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Treesitter 
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'nvim-treesitter/playground' },  -- Fixed structure
        run = ':TSUpdate'
    }

    -- Pretty stuff 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Single plugins
    use 'github/copilot.vim'
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'ThePrimeagen/vim-be-good'
    use 'airblade/vim-gitgutter'
    use 'nvim-tree/nvim-tree.lua'

end)
