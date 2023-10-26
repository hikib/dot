local lsp = require('lsp-zero')

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
    sign_icons = {}
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        -- 'gopls',
        'pylsp',
    },
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local cmp_format = lsp.cmp_format()


cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
