-- Undotree directory for containerized environment
vim.opt.undodir = "/workspace/.vim-undo"
vim.opt.undofile = true
-- Use the "+" register on Neovim for general clipboard
vim.o.clipboard = "unnamedplus"
-- Select system clipboard depending on Mac/Linux
if vim.fn.has('unix') == 1 then
    vim.g.clipboard = {
        name = 'xclip',
        copy = {
            ['+'] = 'xclip -selection clipboard',
            ['*'] = 'xclip -selection primary',
        },
        paste = {
            ['+'] = 'xclip -selection clipboard -o',
            ['*'] = 'xclip -selection primary -o',
        },
        cache_enabled = 0,
    }
end

vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
vim.g.mapleader = " "

vim.cmd('autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy')
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.py.j2",
    command = "set filetype=python"
})

-- function FormatWithBlackOnSave()
--     local cursor_pos = vim.api.nvim_win_get_cursor(0)
--     vim.cmd('silent !black --line-length 120 %')
--     -- vim.cmd('edit!')
--     vim.api.nvim_win_set_cursor(0, cursor_pos)
-- end

function FormatWithBlackAndReload()
    -- Save the current buffer, in case `black --check` modifies it (which it shouldn't)
    vim.cmd('write')
    -- Check if Black would make changes
    local check_status = vim.fn.system('black --check --line-length 120 ' .. vim.fn.expand('%:p'))
    if not string.find(check_status, "1 file would be left unchanged") then
        -- Black will make changes, so apply them
        vim.cmd('silent !black --line-length 120 ' .. vim.fn.expand('%:p'))
        -- Now reload the buffer to reflect those changes
        vim.cmd('edit!')
    else
        print("No formatting needed.")
    end
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = FormatWithBlackAndReload,
})
