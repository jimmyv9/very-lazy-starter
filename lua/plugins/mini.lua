return {
    "echasnovski/mini.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("mini.files").setup()
    end,
    keys = {
        { "<leader>e", "<cmd>lua require('mini.files').open()<cr>", desc = "Open Mini File Explorer" },
    },
}
