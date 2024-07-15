-- Set leader key
vim.g.mapleader = " "

-- Key mappings
local keymap = vim.keymap.set

-- Keymap options
local opts = { noremap = true, silent = true }

-- Navigation
keymap("n", "<leader>pv", vim.cmd.Ex, opts)

-- Move lines up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Center the cursor vertically after moving down or up
keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)


-- Yank to system clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

-- Format buffer with LSP
keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, opts)

-- Search and replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Make file executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Toggle file explorer
keymap("n", "<leader>e", "<cmd>lua require('mini.files').open()<CR>", opts)
-- Basic split navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Toggle wrap text
keymap("n", "<leader>wt", ":set wrap!<CR>", opts)

-- Toggle line numbers
keymap("n", "<leader>nn", function()
    if vim.wo.number then
        vim.wo.number = false
        vim.wo.relativenumber = false
    else
        vim.wo.number = true
        vim.wo.relativenumber = true
    end
end, opts)
