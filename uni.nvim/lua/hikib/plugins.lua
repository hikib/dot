-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- PACKER
    use 'wbthomason/packer.nvim'

    -- BASICS
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- EXTRA
    use('github/copilot.vim')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('tpope/vim-commentary')
    use('karb94/neoscroll.nvim')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {

            -- LSP SUPPORT
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- AUTOCOMPLETION
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip' },

            --  SNIPPETS
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }

    }
end)
