-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- PLUGIN MANAGER
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

require("lazy").setup({
     { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },
     
     { 'rose-pine/neovim',
         name = 'rose-pine',
         config = function()
             vim.cmd('colorscheme rose-pine')
         end
     },
 
     -- EXTRA
     -- 'github/copilot.vim',
     -- 'mbbill/undotree',
     -- 'tpope/vim-fugitive',
     'tpope/vim-commentary',
     'karb94/neoscroll.nvim',
 
     -- LSP
     { 'VonHeikemen/lsp-zero.nvim',
         branch = 'v3.x',
         dependencies = {
             -- LSP SUPPORT
             'neovim/nvim-lspconfig',
             'williamboman/mason.nvim',
             'williamboman/mason-lspconfig.nvim',
 
             -- AUTOCOMPLETION
             'hrsh7th/cmp-buffer',
             'hrsh7th/cmp-nvim-lsp',
             'hrsh7th/cmp-nvim-lua',
             'hrsh7th/cmp-path',
             'hrsh7th/nvim-cmp',
             'saadparwaiz1/cmp_luasnip',
 
             --  SNIPPETS
             'L3MON4D3/LuaSnip',
             'rafamadriz/friendly-snippets',
         } },
})

