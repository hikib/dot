return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        cmd = 'TSUpdate',
        event = { 'BufReadPre', 'BufNewFile' },
    },
}
