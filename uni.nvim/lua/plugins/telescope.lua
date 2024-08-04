return {
  {
       'nvim-telescope/telescope.nvim',
       dependencies = { 'nvim-lua/plenary.nvim' },
       keys = {
           { "<leader>ss", "<cmd>Telescope find_files<cr>" },
           { "<leader>sg", "<cmd>Telescope live_grep<cr>" },
           { "<leader>sb", "<cmd>Telescope buffers<cr>" },
           { "<leader>sh", "<cmd>Telescope help_tags<cr>" },
       }
   },
}
