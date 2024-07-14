return {
    'tpope/vim-fugitive',
    keys = {
        { "<leader>gs", vim.cmd.Git, { noremap = true, silent = true, desc = "Git status" } }
    }
}

