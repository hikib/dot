local PROJECTS = vim.fn.expand("$PROJECTS")

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>ss", "<cmd>Telescope find_files<cr>" },
            { "<leader>sg", "<cmd>Telescope live_grep<cr>" },
            { "<leader>sb", "<cmd>Telescope buffers<cr>" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>" },
            --
            -- Only search content of markdown files in project logs
            { "<leader>sl", function()
                require('telescope.builtin').live_grep({
                    search_dirs = { PROJECTS },
                    type_filter = "md",
                    path_display = function(opts, path)
                        return path:gsub(PROJECTS, "")
                    end
                })
            end
            },
        },
        opts = {
            defaults = {
                path_display = { "filename_first" }
            }
        }
    }
}
