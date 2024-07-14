-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('telescope').setup {
            defaults = {
                -- Default configuration can go here
            },
            pickers = {
                -- Default configuration for builtin pickers can go here
            },
            extensions = {
                -- Your extension configuration can go here
            }
        }
    end,
    keys = {
        {
            "<leader>pf",
            function() require("telescope.builtin").find_files() end,
            desc = "Find Files",
        },
        {
            "<leader>ps",
            function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
            desc = "Grep String",
        },
        {
            "<C-p>",
            function() require("telescope.builtin").git_files() end,
            desc = "Git Files",
        },
    },
}
