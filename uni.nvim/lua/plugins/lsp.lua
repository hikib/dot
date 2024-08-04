return {
	

   -- https://github.com/VonHeikemen/lsp-zero.nvim
   {
       'VonHeikemen/lsp-zero.nvim',
       branch = 'v3.x',
       lazy = true,
       config = false,
       init = function()
           -- Disable automatic setup, we are doing it manually
           vim.g.lsp_zero_extend_cmp = 0
           vim.g.lsp_zero_extend_lspconfig = 0
       end,
   },

   -- Installer for language servers
   -- Plays with lsp-zero
   -- https://github.com/williamboman/mason.nvim
   {
       'williamboman/mason.nvim',
       lazy = false,
       config = true,
   },

    -- Autocompletion
    -- Part of lsp-zero
    -- https://github.com/hrsh7th/nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- https://github.com/L3MON4D3/LuaSnip
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    -- https://github.com/neovim/nvim-lspconfig
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            -- https://github.com/neovim/nvim-lspconfig
            { 'hrsh7th/cmp-nvim-lsp' },
            -- https://github.com/williamboman/mason-lspconfig.nvim
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            ---@diagnostic disable-next-line: unused-local
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },

}

